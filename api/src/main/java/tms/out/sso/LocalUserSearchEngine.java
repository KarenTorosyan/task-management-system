package tms.out.sso;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.model.User;

public interface LocalUserSearchEngine {

    void save(User user);

    void deleteById(String userId);

    Page<User> searchUsers(String query, Pageable pageable);

    boolean exists(String userId);
}
