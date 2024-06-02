package tms.config.security;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.BearerTokenAuthentication;
import tms.errors.Errors;

import java.util.Set;

public class JwtConverter implements Converter<Jwt, AbstractAuthenticationToken> {

    public static final String ROLES_CLAIM = "roles";
    public static final String SUB = "sub";

    @Override
    public AbstractAuthenticationToken convert(@NonNull Jwt source) {
        Set<GrantedAuthority> roles = getRoles(source);
        String nameAttributeKey = getNameAttributeKey(source);

        OAuth2User oAuth2User = new DefaultOAuth2User(roles, source.getClaims(), nameAttributeKey);
        OAuth2AccessToken oAuth2AccessToken = new OAuth2AccessToken(OAuth2AccessToken.TokenType.BEARER,
                source.getTokenValue(), source.getIssuedAt(), source.getExpiresAt());

        return new BearerTokenAuthentication(oAuth2User, oAuth2AccessToken, roles);
    }

    private Set<GrantedAuthority> getRoles(Jwt jwt) {
        SimpleAuthorityMapper mapper = new SimpleAuthorityMapper();
        mapper.setConvertToUpperCase(true);

        return !jwt.hasClaim(ROLES_CLAIM) ? Set.of() :
                mapper.mapAuthorities(jwt.getClaimAsStringList(ROLES_CLAIM)
                        .stream()
                        .map(SimpleGrantedAuthority::new)
                        .toList());
    }

    // email, email_verified, preferred_username removed from sso provider https://fusionauth.io/docs/lifecycle/authenticate-users/oauth/tokens
    private String getNameAttributeKey(Jwt jwt) {
        if (jwt.hasClaim(SUB)) {
            return SUB;
        }
        throw Errors.jwtClaimRequired(SUB);
    }
}

