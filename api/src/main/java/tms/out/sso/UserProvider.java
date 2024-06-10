package tms.out.sso;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import tms.model.AuthToken;
import tms.model.Session;
import tms.model.User;

import java.util.Optional;

public interface UserProvider {

    static String getCurrentUser() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    Optional<User> loadUser(String user);

    Optional<User> loadUserByEmail(String email);

    User signUp(User user);

    Optional<AuthToken> signIn(String email, String password);

    void signOut(String refreshToken);

    AuthToken refreshToken(String refreshToken);

    User editUser(User user);

    void removeUser(String user);

    Page<User> getUsers(Pageable pageable);

    Page<User> searchUsers(String query, Pageable pageable);

    Page<Session> loadSessions(String user, Pageable pageable);

    Optional<Session> loadSession(String session);

    void removeSession(Session session);
}
