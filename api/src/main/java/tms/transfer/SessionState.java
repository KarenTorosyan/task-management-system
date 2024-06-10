package tms.transfer;

import tms.model.Session;

import java.time.Instant;

public record SessionState(
        String id,
        String userId,
        String email,
        String ipAddress,
        String device,
        Instant created,
        Instant lastAccess,
        boolean current) {

    public static SessionState from(Session session, String rt) {
        return new SessionState(
                session.getId(),
                session.getUser().getId(),
                session.getEmail(),
                session.getIpAddress(),
                session.getDevice(),
                session.getCreated(),
                session.getLastAccess(),
                session.getRefreshToken().equals(rt)
        );
    }
}
