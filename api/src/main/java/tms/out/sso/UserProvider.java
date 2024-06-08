package tms.out.sso;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.model.AuthToken;
import tms.model.User;

import java.util.Optional;

public interface UserProvider {

    Optional<User> loadUser(String user);

    User signUp(User user);

    Optional<AuthToken> signIn(String email, String password);

    void signOut(String refreshToken);

    AuthToken refreshToken(String refreshToken);

    User editUser(User user);

    void removeUser(String user);

    Page<User> searchUsers(String query, Pageable pageable);
}
