package tms;

import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.jwt.Jwt;
import tms.config.security.JwtConverter;

import java.time.Instant;
import java.util.Set;

public class SecurityPrincipal {

    public static Authentication bearerToken(String user, Set<String> authorities) {
        return new JwtConverter().convert(Jwt.withTokenValue("_token_")
                .header("typ", "JWT")
                .subject(user)
                .issuedAt(Instant.now())
                .expiresAt(Instant.now())
                .claim(JwtConverter.EMAIL_CLAIM, user)
                .claim(JwtConverter.ROLES_CLAIM, authorities)
                .build());
    }

    public static Authentication bearerToken() {
        return bearerToken("_user_", Set.of());
    }

    public static Authentication bearerToken(String user) {
        return bearerToken(user, Set.of());
    }

    public static Authentication bearerToken(Set<String> authorities) {
        return bearerToken("_user_", authorities);
    }
}
