package tms.model;

import java.time.Instant;

public record AuthToken(String token, String refreshToken) {
}
