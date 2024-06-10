package tms.out.sso;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import ua_parser.Client;
import ua_parser.Parser;

import java.io.IOException;

@Component
public class UserAgentMetadataCollectorFilter extends OncePerRequestFilter {

    private final Parser parser = new Parser();

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String clientIp = request.getRemoteAddr();
        String forwardedFor = request.getHeader("X-Forwarded-For");
        if (forwardedFor != null) {
            clientIp = forwardedFor;
        }
        ClientMetadataHolder.setIp(clientIp);

        String userAgent = request.getHeader("User-Agent");
        if (userAgent != null) {
            Client client = parser.parse(userAgent);
            ClientMetadataHolder.setDevice(client.os.family + " " + client.userAgent.family);
        }
        filterChain.doFilter(request, response);
    }
}
