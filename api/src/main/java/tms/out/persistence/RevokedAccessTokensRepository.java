package tms.out.persistence;

import org.springframework.data.jpa.repository.JpaRepository;
import tms.model.RevokedAccessToken;

public interface RevokedAccessTokensRepository extends JpaRepository<RevokedAccessToken, Long> {

    boolean existsByToken(String token);
}
