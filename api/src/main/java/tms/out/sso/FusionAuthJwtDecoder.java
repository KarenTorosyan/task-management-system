package tms.out.sso;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.stereotype.Component;
import tms.config.sso.SsoProperties;

@ConditionalOnProperty(value = "sso.provider", havingValue = "fusionauth")
@Component
@RequiredArgsConstructor
public class FusionAuthJwtDecoder implements JwtDecoder {

    private final SsoProperties ssoProperties;

    @Override
    public Jwt decode(String token) throws JwtException {
        NimbusJwtDecoder jwtDecoder =NimbusJwtDecoder.withJwkSetUri(ssoProperties.getJwtSetUri()).build();
        if (!ssoProperties.getAudiences().isEmpty()) {
            jwtDecoder.setJwtValidator(new AudienceValidator(ssoProperties.getAudiences()));
        }
        return jwtDecoder.decode(token);
    }
}
