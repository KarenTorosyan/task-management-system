package tms.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfTokenRequestAttributeHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;

import java.util.List;

@Configuration
public class SecurityConfig {

    public static final AntPathRequestMatcher[] AUTHENTICATION = {
    };

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
                .authorizeHttpRequests(c -> {
                    c.requestMatchers(AUTHENTICATION).authenticated();
                    c.anyRequest().permitAll();
                })
                .build();
    }
}