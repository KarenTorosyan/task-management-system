package tms.out.sso;

import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidatorResult;
import org.springframework.security.oauth2.jwt.Jwt;

import java.util.List;

public class AudienceValidator implements OAuth2TokenValidator<Jwt> {

    private final List<String> audiences;

    public AudienceValidator(List<String> audiences) {
        this.audiences = audiences;
    }

    public OAuth2TokenValidatorResult validate(Jwt jwt) {
        if (audiences != null && !audiences.isEmpty()) {
            List<String> aud = jwt.getClaimAsStringList("aud");
            if (aud == null || aud.isEmpty() || !aud.containsAll(audiences)) {
                return OAuth2TokenValidatorResult.failure(new OAuth2Error("invalid_token", "The required audience is missing", null));
            }
        }
        return OAuth2TokenValidatorResult.success();
    }
}
