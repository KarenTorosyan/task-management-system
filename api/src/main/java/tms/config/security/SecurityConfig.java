package tms.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfTokenRequestAttributeHandler;
import org.springframework.web.cors.CorsConfiguration;
import tms.config.sso.SsoProperties;

import java.util.List;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    BearerTokenExtractor bearerTokenExtractor(SsoProperties ssoProperties) {
        BearerTokenExtractor bearerTokenExtractor = new BearerTokenExtractor();
        bearerTokenExtractor.setTokenAge(ssoProperties.getAccessTokenAge());
        return bearerTokenExtractor;
    }

    @Bean
    RefreshTokenExtractor refreshTokenExtractor(SsoProperties ssoProperties) {
        RefreshTokenExtractor refreshTokenExtractor = new RefreshTokenExtractor();
        refreshTokenExtractor.setTokenAge(ssoProperties.getRefreshTokenAge());
        return refreshTokenExtractor;
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity security) throws Exception {
        return security
                .cors(c -> c.configurationSource(request -> {
                    CorsConfiguration corsConfiguration = new CorsConfiguration();
                    corsConfiguration.setAllowedOrigins(List.of("*"));
                    corsConfiguration.setAllowedMethods(List.of("GET", "OPTIONS", "POST", "PUT", "DELETE"));
                    corsConfiguration.setAllowedHeaders(List.of("Content-Type", "Authorization", "X-Xsrf-Token"));
                    corsConfiguration.setAllowCredentials(true);
                    return corsConfiguration;
                }))
                .csrf(c -> {
                    c.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
                    c.csrfTokenRequestHandler(new CsrfTokenRequestAttributeHandler());
                })
                .oauth2ResourceServer(c -> c.jwt(jwt -> jwt.jwtAuthenticationConverter(new JwtConverter())))
                .build();
    }
}
