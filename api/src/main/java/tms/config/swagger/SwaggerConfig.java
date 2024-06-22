package tms.config.swagger;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.OAuthFlow;
import io.swagger.v3.oas.models.security.OAuthFlows;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import tms.config.security.RefreshTokenExtractor;
import tms.config.sso.SsoProperties;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class SwaggerConfig {

    @Bean
    OpenAPI openAPI(SwaggerProperties swaggerProperties,
                    SsoProperties ssoProperties,
                    RefreshTokenExtractor refreshTokenExtractor) {
        Map<String, SecurityScheme> securitySchemes = new HashMap<>();
        securitySchemes.put("bearer", bearerTokenSecurityScheme());
        securitySchemes.put("refreshToken", refreshTokenSecurityScheme(refreshTokenExtractor));
        if (!ssoProperties.getProvider().equalsIgnoreCase("local")) {
            securitySchemes.put("oAuth2Client", oauth2SecurityScheme(swaggerProperties, ssoProperties));
        }
        return new OpenAPI()
                .info(new Info().title("Task Management System").version("1.0"))
                .components(new Components().securitySchemes(securitySchemes));
    }

    private SecurityScheme bearerTokenSecurityScheme() {
        return new SecurityScheme()
                .type(SecurityScheme.Type.HTTP)
                .scheme("bearer")
                .bearerFormat("JWT");
    }

    public SecurityScheme refreshTokenSecurityScheme(RefreshTokenExtractor refreshTokenExtractor) {
        return new SecurityScheme()
                .type(SecurityScheme.Type.APIKEY)
                .in(SecurityScheme.In.HEADER)
                .name(refreshTokenExtractor.getHeaderName());
    }

    private SecurityScheme oauth2SecurityScheme(SwaggerProperties swaggerProperties, SsoProperties ssoProperties) {
        String issuer = swaggerProperties.getOAuth2().getIssuer();
        return new SecurityScheme()
                .type(SecurityScheme.Type.OAUTH2)
                .flows(new OAuthFlows().authorizationCode(new OAuthFlow()
                        .authorizationUrl(issuer.concat(ssoProperties.getAuthorizationUri()))
                        .tokenUrl(issuer.concat(ssoProperties.getTokenUri()))
                ));
    }
}
