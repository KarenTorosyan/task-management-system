package tms.out.sso;

import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.JWSVerificationKeySelector;
import com.nimbusds.jose.proc.SecurityContext;
import com.nimbusds.jwt.proc.DefaultJWTProcessor;
import com.nimbusds.jwt.proc.JWTProcessor;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtException;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.stereotype.Component;
import tms.config.sso.SsoProperties;

@ConditionalOnProperty(value = "sso.provider", havingValue = "local")
@Component
@RequiredArgsConstructor
public class LocalProviderJwtDecoder implements JwtDecoder {

    private final SsoProperties ssoProperties;

    @Override
    public Jwt decode(String token) throws JwtException {
        NimbusJwtDecoder jwtDecoder = new NimbusJwtDecoder(jwtProcessor());
        if (!ssoProperties.getAudiences().isEmpty()) {
            jwtDecoder.setJwtValidator(new AudienceValidator(ssoProperties.getAudiences()));
        }
        return jwtDecoder.decode(token);
    }

    private JWTProcessor<SecurityContext> jwtProcessor() {
        DefaultJWTProcessor<SecurityContext> defaultJWTProcessor = new DefaultJWTProcessor<>();
        JWSAlgorithm algorithm = JWSAlgorithm.parse(ssoProperties.getKeystoreKeyAlgorithm().toUpperCase());
        JWKSource<SecurityContext> jwkSource = LocalJwkSource.jwkSource(ssoProperties.getKeystore(), ssoProperties.getKeystorePassword(), ssoProperties.getKeystoreAlias(), ssoProperties.getKeystoreKeyPassword());
        JWSVerificationKeySelector<SecurityContext> keySelector = new JWSVerificationKeySelector<>(algorithm, jwkSource);
        defaultJWTProcessor.setJWSKeySelector(keySelector);
        return defaultJWTProcessor;
    }
}
