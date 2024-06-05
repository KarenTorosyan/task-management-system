package tms.config.security;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.BearerTokenAuthentication;
import tms.config.security.JwtConverter;
import tms.exception.RequiredParamException;

import java.time.Instant;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@DisplayName("Jwt Converter should")
public class JwtConverterTest {

    @DisplayName("create bearer authentication token with subject")
    @Test
    void shouldCreateBearerAuthenticationTokenWithUserSubject() {
        Jwt jwt = Jwt.withTokenValue("token")
                .subject("subject")
                .header("typ", "JWT")
                .claim("roles", List.of("admin", "user"))
                .issuedAt(Instant.now())
                .expiresAt(Instant.now())
                .build();
        AbstractAuthenticationToken token = new JwtConverter()
                .convert(jwt);
        assertThat(token).isNotNull().isInstanceOf(BearerTokenAuthentication.class);
        assertThat(token.getAuthorities())
                .containsAll(List.of(
                        new SimpleGrantedAuthority("ROLE_ADMIN"),
                        new SimpleGrantedAuthority("ROLE_USER")
                ));
    }

    @DisplayName("throw error when sub claim undefined")
    @Test
    void shouldThrowErrorWhenSubClaimUndefined() {
        Jwt jwt = Jwt.withTokenValue("token")
                .header("typ", "JWT")
                .claim("roles", List.of("admin", "user"))
                .issuedAt(Instant.now())
                .expiresAt(Instant.now())
                .build();
        assertThatThrownBy(() -> new JwtConverter().convert(jwt))
                .isInstanceOf(RequiredParamException.class);
    }
}
