package tms.out.sso;

import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.oauth2.jose.jws.SignatureAlgorithm;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.stereotype.Component;
import tms.config.sso.SsoProperties;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@ConditionalOnProperty(name = "sso.bearer-token-type", havingValue = "jwt")
@Component
@RequiredArgsConstructor
public class JwtAccessTokenGenerator implements AccessTokenGenerator {

    private final SsoProperties ssoProperties;

    @Override
    public String generate(String userId, Instant issued, Instant expires, Instant notBefore, Map<String, Object> claims, List<String> aud) {
        JwtEncoder jwtEncoder = jwtEncoder();
        JwsHeader.Builder headerBuilder = JwsHeader.with(SignatureAlgorithm.from(ssoProperties.getKeystoreKeyAlgorithm().toUpperCase()));
        JwtClaimsSet.Builder claimsBuilder = JwtClaimsSet.builder()
                .claims(c -> c.putAll(claims))
                .subject(userId)
                .audience(new ArrayList<>(aud))
                .issuedAt(issued)
                .expiresAt(expires)
                .notBefore(notBefore);
        Jwt jwt = jwtEncoder.encode(JwtEncoderParameters.from(headerBuilder.build(), claimsBuilder.build()));
        return jwt.getTokenValue();
    }

    @Override
    public String generate(String userId, Map<String, Object> claims, List<String> aud) {
        Instant now = Instant.now();
        return generate(userId, now, now.plusSeconds(ssoProperties.getAccessTokenAge()), now, claims, aud);
    }

    private JwtEncoder jwtEncoder() {
        JWKSource<SecurityContext> jwkSource = LocalJwkSource.jwkSource(ssoProperties.getKeystore(), ssoProperties.getKeystorePassword(), ssoProperties.getKeystoreAlias(), ssoProperties.getKeystoreKeyPassword());
        return new NimbusJwtEncoder(jwkSource);
    }
}
