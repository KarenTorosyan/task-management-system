package tms.out.sso;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import tms.config.security.BearerTokenExtractor;
import tms.config.security.RefreshTokenExtractor;
import tms.out.persistence.RevokedAccessTokensRepository;

import java.io.IOException;

@Component
@RequiredArgsConstructor
public class RevokedAccessTokenFilter extends OncePerRequestFilter {

    private final BearerTokenExtractor bearerTokenExtractor;
    private final RevokedAccessTokensRepository revokedAccessTokensRepository;
    private final RefreshTokenExtractor refreshTokenExtractor;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = bearerTokenExtractor.resolve(request);
        if (token != null) {
            if (revokedAccessTokensRepository.existsByToken(token)) {
                bearerTokenExtractor.clearCookie(response);
                refreshTokenExtractor.clearCookie(response);
                throw new AccessDeniedException("Access Denied");
            }
        }
        filterChain.doFilter(request, response);
    }
}
