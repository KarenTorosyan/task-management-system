package tms.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.model.Session;

import java.util.Optional;

public interface SessionRepository extends JpaRepository<Session, String> {

    Optional<Session> findByEmailAndIpAddressAndDevice(String email, String ipAddress, String device);

    Optional<Session> findByRefreshToken(String token);

    Page<Session> findAllByUserId(String userId, Pageable pageable);

    void deleteAllByUserId(String userId);
}
