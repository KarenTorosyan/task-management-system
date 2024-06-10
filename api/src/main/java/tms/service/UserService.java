package tms.service;

import jakarta.validation.Valid;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheConfig;
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
import tms.model.AuthToken;
import tms.model.Session;
import tms.model.User;
import tms.out.sso.UserEvent;
import tms.out.sso.UserProvider;
import tms.util.OnCreate;

import java.util.Optional;

@Service
@CacheConfig(cacheNames = "user")
@Validated
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserProvider userProvider;
    private final SecurityContextHolderStrategy strategy = SecurityContextHolder.getContextHolderStrategy();
    private final UserEvent userEvent;

    private String currentUser() {
        return strategy.getContext().getAuthentication().getName();
    }

    @Cacheable(key = "#user")
    @Transactional(readOnly = true)
    public User getUser(String user) {
        return userProvider.loadUser(user)
                .orElseThrow(() -> new EntityNotFoundException("User not found", "user_not_found", user));
    }

    @Transactional(readOnly = true)
    public User getUserByEmail(String email) {
        return userProvider.loadUserByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User not found", "user_not_found", email));
    }

    @PreAuthorize("isAuthenticated()")
    @Transactional(readOnly = true)
    public User getUser() {
        return userProvider.loadUser(currentUser())
                .orElseThrow(() -> new EntityNotFoundException("User not found", "user_not_found"));
    }

    @CachePut(key = "#user.id")
    @Validated({OnCreate.class, Default.class})
    @Transactional
    public User signUp(@Valid User user) {
        Optional<User> ready = userProvider.loadUserByEmail(user.getEmail());
        if (ready.isPresent()) {
            throw new EntityConflictException("User found", "user_found", user.getEmail());
        }
        User signedUp = userProvider.signUp(user);
        log.debug("User signed up: (id={}, email={})", signedUp.getId(), signedUp.getEmail());
        return signedUp;
    }

    @Transactional
    public AuthToken signIn(String email, String password) {
        return userProvider.signIn(email, password).orElseThrow(() -> {
            log.debug("Bad credentials: {}", email);
            return new EntityNotFoundException("Bad credentials", "bad_credentials", email);
        });
    }

    @PreAuthorize("isAuthenticated()")
    @Transactional
    public void signOut(String refreshToken) {
        userProvider.signOut(refreshToken);
        strategy.clearContext();
        log.debug("User signed out (id={})", currentUser());
    }

    @PreAuthorize("isAuthenticated()")
    @Transactional
    public AuthToken refreshToken(String refreshToken) {
        AuthToken authToken = userProvider.refreshToken(refreshToken);
        log.debug("Token refreshed by user: (id={})", currentUser());
        return authToken;
    }

    @PreAuthorize("isAuthenticated() and #user.id eq authentication.name")
    @Transactional
    public User editUser(@Valid User user) {
        User ready = userProvider.editUser(user);
        log.debug("User edited: (id={}, email={})", ready.getId(), ready.getEmail());
        return ready;
    }

    @PreAuthorize("isAuthenticated() and #user.id eq authentication.name")
    @Transactional
    public void removeUser(User user) {
        userProvider.removeUser(user.getId());
        userEvent.onRemove(user);
        log.debug("User removed: (id={}, email={})", user.getId(), user.getEmail());
    }

    @PreAuthorize("isAuthenticated() and hasAnyAuthority('ROLE_ADMIN')")
    @Transactional(readOnly = true)
    public Page<User> getUsers(Pageable pageable) {
        return userProvider.getUsers(pageable);
    }

    @PreAuthorize("isAuthenticated() and hasAnyAuthority('ROLE_ADMIN')")
    @Transactional(readOnly = true)
    public Page<User> searchUsers(String query, Pageable pageable) {
        return userProvider.searchUsers(query, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Session> getSessions(String user, Pageable pageable) {
        return userProvider.loadSessions(user, pageable);
    }

    @PreAuthorize("isAuthenticated()")
    @Transactional(readOnly = true)
    public Session getSession(String sessionId) {
        return userProvider.loadSession(sessionId)
                .orElseThrow(() -> new EntityNotFoundException("No session", "session_not_found", sessionId));
    }

    @PreAuthorize("isAuthenticated() and #session.user.id eq authentication.name")
    @Transactional
    public void removeSession(Session session) {
        userProvider.removeSession(session);
        log.debug("Session removed: (sessId={}, userId={})", session.getId(), session.getUser().getId());
    }
}
