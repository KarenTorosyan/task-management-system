package tms.out.sso;

import java.time.Instant;
import java.util.List;
import java.util.Map;

public interface AccessTokenGenerator {

    String generate(String userId, Instant issued, Instant expires, Instant notBefore, Map<String, Object> claims, List<String> aud);

    String generate(String userId, Map<String, Object> claims, List<String> aud);
}
