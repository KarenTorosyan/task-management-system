package tms.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import tms.model.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {

    @EntityGraph("User")
    Optional<User> findById(String id);

    @EntityGraph("User")
    Optional<User> findByEmail(String email);

    @EntityGraph("User")
    Page<User> findAll(Pageable pageable);

    @Query(value = "insert into users_roles(user_id, role_id) values (?1, ?2) ", nativeQuery = true)
    @Modifying
    void addRole(String userId, Integer roleId);

    @Query(value = "select count(*) > 0 from users_roles where user_id = ?1 and role_id = ?2", nativeQuery = true)
    boolean hasRole(String userId, Integer roleId);

    @Query(value = "delete from users_roles where user_id = ?1 and role_id = ?2", nativeQuery = true)
    @Modifying
    void deleteRole(String userId, Integer roleId);
}
