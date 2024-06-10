package tms.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.model.Role;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Integer> {

    Optional<Role> findByName(String name);

    Page<Role> findAllByUsersId(String userId, Pageable pageable);

    Page<Role> findAllBySuperRole(boolean superRole, Pageable pageable);

    Page<Role> findAllByDefaultRole(boolean defaultRole, Pageable pageable);
}
