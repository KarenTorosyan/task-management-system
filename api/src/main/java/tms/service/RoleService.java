package tms.service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import tms.exception.EntityConflictException;
import tms.exception.EntityNotFoundException;
import tms.model.Role;
import tms.out.persistence.RoleRepository;
import tms.out.persistence.UserRepository;

import java.util.Optional;

@ConditionalOnProperty(name = "sso.provider", havingValue = "local")
@Service
@CacheConfig(cacheNames = "role")
@Validated
@RequiredArgsConstructor
@PreAuthorize("isAuthenticated() and hasAnyAuthority('ROLE_ADMIN')")
@Slf4j
public class RoleService {

    private final RoleRepository roleRepository;
    private final UserRepository userRepository;
    private final SecurityContextHolderStrategy strategy = SecurityContextHolder.getContextHolderStrategy();

    private String currentUser() {
        return strategy.getContext().getAuthentication().getName();
    }

    @Transactional
    public Role createRole(@Valid Role role) {
        Optional<Role> ready = roleRepository.findByName(role.getName());
        if (ready.isPresent()) {
            throw new EntityConflictException("Role found", "role_found", role.getName());
        }
        log.debug("Role {} created by user (id={})", role.getName(), currentUser());
        return roleRepository.save(role);
    }

    @CachePut(key = "#role.id")
    @Transactional
    public Role editRole(@Valid Role role) {
        Role edited = roleRepository.save(role);
        log.debug("Role {} edited {} by user (id={})", role.getName(), edited, currentUser());
        return edited;
    }

    @Cacheable(key = "#id")
    @Transactional(readOnly = true)
    public Role getRole(Integer id) {
        return roleRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Role not found", "role_not_found", id));
    }

    @Transactional(readOnly = true)
    public Role getRoleByName(String name) {
        return roleRepository.findByName(name)
                .orElseThrow(() -> new EntityNotFoundException("Role not found", "role_not_found", name));
    }

    @Transactional(readOnly = true)
    public Page<Role> getSuperRoles(Pageable pageable) {
        return roleRepository.findAllBySuperRole(true, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Role> getDefaultRoles(Pageable pageable) {
        return roleRepository.findAllByDefaultRole(true, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Role> getRoles(Pageable pageable) {
        return roleRepository.findAll(pageable);
    }

    @PreAuthorize("isAuthenticated() and hasAnyAuthority('ROLE_ADMIN') or #userId eq authentication.name")
    @Transactional(readOnly = true)
    public Page<Role> getUserRoles(String userId, Pageable pageable) {
        return roleRepository.findAllByUsersId(userId, pageable);
    }

    @CacheEvict(key = "#role.id")
    @Transactional
    public void revokeRole(Role role) {
        roleRepository.delete(role);
        log.debug("Role {} removed by user (id={})", role.getName(), currentUser());
    }

    @Transactional
    public void assignRole(String userId, Integer roleId) {
        if (hasRole(userId, roleId)) {
            throw new EntityConflictException("Role found", "role_found", roleId);
        }
        userRepository.addRole(userId, roleId);
        log.debug("Role (id={}) added to user (id={}) by user (id={})", roleId, userId, currentUser());
    }

    @Transactional(readOnly = true)
    public boolean hasRole(String userId, Integer roleId) {
        return userRepository.hasRole(userId, roleId);
    }

    @Transactional
    public void revokeRole(String userId, Integer roleId) {
        if (!hasRole(userId, roleId)) {
            throw new EntityNotFoundException("Role not found", "role_not_found", roleId);
        }
        userRepository.deleteRole(userId, roleId);
        log.debug("Role (id={}) revoked from user (id={}) by user (id={})", roleId, userId, currentUser());
    }
}
