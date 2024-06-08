package tms.service;

import jakarta.validation.Valid;
import jakarta.validation.groups.Default;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;
import tms.exception.EntityNotFoundException;
import tms.model.AuthToken;
import tms.model.User;
import tms.out.sso.UserProvider;
import tms.util.OnCreate;

@Service
@Validated
@RequiredArgsConstructor
public class UserService {

    private final UserProvider userProvider;
    private final SecurityContextHolderStrategy strategy = SecurityContextHolder.getContextHolderStrategy();

    public User getUser(String user) {
        return userProvider.loadUser(user)
                .orElseThrow(() -> new EntityNotFoundException("User not found", "user_not_found", user));
    }

    @PreAuthorize("isAuthenticated()")
    public User getUser() {
        return getUser(strategy.getContext().getAuthentication().getName());
    }

    @Validated({OnCreate.class, Default.class})
    public User signUp(@Valid User user) {
        return userProvider.signUp(user);
    }

    public AuthToken signIn(String email, String password) {
        return userProvider.signIn(email, password)
                .orElseThrow(() -> new EntityNotFoundException("User not found", "user_not_found", email));
    }

    @PreAuthorize("isAuthenticated()")
    public void signOut(String refreshToken) {
        userProvider.signOut(refreshToken);
        strategy.clearContext();
    }

    @PreAuthorize("isAuthenticated()")
    public AuthToken refreshToken(String refreshToken) {
        return userProvider.refreshToken(refreshToken);
    }

    @PreAuthorize("isAuthenticated() and #user.id eq authentication.name")
    public User editUser(@Valid User user) {
        return userProvider.editUser(user);
    }

    @PreAuthorize("isAuthenticated() and #user eq authentication.name")
    public void removeUser(String user) {
        userProvider.removeUser(user);
    }

    @PreAuthorize("isAuthenticated() && hasAnyAuthority('ROLE_ADMIN')")
    public Page<User> searchUsers(String query, Pageable pageable) {
        return userProvider.searchUsers(query, pageable);
    }
}
