package tms.out.sso;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import tms.config.security.JwtConverter;
import tms.config.sso.SsoProperties;
import tms.exception.SsoProviderException;
import tms.model.*;
import tms.out.persistence.RevokedAccessTokensRepository;
import tms.out.persistence.RoleRepository;
import tms.out.persistence.SessionRepository;
import tms.out.persistence.UserRepository;

import java.security.SecureRandom;
import java.time.Instant;
import java.util.*;
import java.util.function.Function;

@ConditionalOnProperty(name = "sso.provider", havingValue = "local")
@Component
@RequiredArgsConstructor
public class LocalUserProvider implements UserProvider {

    private final Function<byte[], String> nonceEncoder = bytes -> Base64.getEncoder().encodeToString(bytes);
    private final Function<String, byte[]> nonceDecoder = string -> Base64.getDecoder().decode(string);

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final SessionRepository sessionRepository;
    private final AccessTokenGenerator accessTokenGenerator;
    private final RefreshTokenGenerator refreshTokenGenerator;
    private final SsoProperties ssoProperties;
    private final LocalUserSearchEngine localUserSearchEngine;
    private final RoleRepository roleRepository;
    private final RevokedAccessTokensRepository revokedAccessTokensRepository;

    @Override
    public Optional<User> loadUser(String user) {
        return userRepository.findById(user);
    }

    @Override
    public Optional<User> loadUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User signUp(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        User ready = userRepository.save(user);
        List<Role> defaultRoles = roleRepository.findAllByDefaultRole(true, Pageable.unpaged()).getContent();
        for (Role role : defaultRoles) {
            userRepository.addRole(ready.getId(), role.getId());
        }
        localUserSearchEngine.save(ready);
        return ready;
    }

    @Override
    public Optional<AuthToken> signIn(String email, String password) {
        return userRepository.findByEmail(email)
                .filter(user -> passwordEncoder.matches(password, user.getPassword()))
                .flatMap(user -> sessionRepository.findByEmailAndIpAddressAndDevice(email, ClientMetadataHolder.getIp(), ClientMetadataHolder.getDevice())
                        .map(this::editSession)
                        .orElseGet(() -> newSession(email)));
    }

    private Optional<AuthToken> editSession(Session session) {
        Instant now = Instant.now();
        if (ssoProperties.isRefreshTokenRotation()) {
            session.setNonce(generateNonce(session.getUser().getId()));
            session.setRefreshToken(generateRefreshToken(nonceDecoder.apply(session.getNonce())));
            session.setExpires(now.plusSeconds(ssoProperties.getRefreshTokenAge()));
        }
        session.setLastAccess(now);
        sessionRepository.save(session);
        return Optional.of(saveBearerToken(new AuthToken(generateAccessToken(session.getUser()), session.getRefreshToken())));
    }

    private Optional<AuthToken> newSession(String email) {
        return userRepository.findByEmail(email)
                .map(user -> saveBearerToken(new AuthToken(generateAccessToken(user), createSession(user).getRefreshToken())));
    }

    private AuthToken saveBearerToken(AuthToken authToken) {
        BearerTokenHolder.addBearerToken(authToken.refreshToken(), authToken.token(), ssoProperties.getBearerTokenStoreSecret());
        return authToken;
    }

    private Session createSession(User user) {
        Instant now = Instant.now();
        String nonce = generateNonce(user.getId());
        return sessionRepository.save(new Session()
                .setId(UUID.randomUUID().toString())
                .setUser(user)
                .setEmail(user.getEmail())
                .setLastAccess(now)
                .setRefreshToken(generateRefreshToken(nonceDecoder.apply(nonce)))
                .setNonce(nonce)
                .setExpires(now.plusSeconds(ssoProperties.getRefreshTokenAge()))
                .setIpAddress(ClientMetadataHolder.getIp())
                .setDevice(ClientMetadataHolder.getDevice()));
    }

    private String generateAccessToken(User user) {
        List<String> roles = user.getRoles().stream()
                .map(Role::getName)
                .toList();
        return generateAccessToken(user.getId(), roles);
    }

    private String generateAccessToken(String userId, List<String> roles) {
        return accessTokenGenerator.generate(userId, Map.of(JwtConverter.ROLES_CLAIM, roles), ssoProperties.getAudiences());
    }

    private String generateNonce(@Nullable String add) {
        byte[] nonce = new byte[32];
        new SecureRandom().nextBytes(nonce);
        if (add != null) {
            byte[] aadBytes = add.getBytes();
            byte[] extended = new byte[nonce.length + aadBytes.length];
            System.arraycopy(nonce, 0, extended, 0, nonce.length);
            System.arraycopy(aadBytes, 0, extended, nonce.length, aadBytes.length);
            return nonceEncoder.apply(extended);
        }
        return nonceEncoder.apply(nonce);
    }

    private String generateRefreshToken(byte[] nonce) {
        return refreshTokenGenerator.generate(ssoProperties.getRefreshTokenSecret(), nonce);
    }

    @Override
    public void signOut(String refreshToken) {
        sessionRepository.findByRefreshToken(refreshToken).ifPresentOrElse(this::invalidateSession, () -> {
            throw new SsoProviderException("No session");
        });
    }

    private void invalidateSession(Session session) {
        sessionRepository.deleteById(session.getId());
        BearerTokenHolder.clearBearerToken(session.getRefreshToken());
    }

    @Override
    public AuthToken refreshToken(String refreshToken) {
        SsoProviderException exception = new SsoProviderException("No session");
        return sessionRepository.findByRefreshToken(refreshToken)
                .filter(session -> session.getExpires().isAfter(Instant.now()) && refreshToken.equals(refreshTokenGenerator.generate(ssoProperties.getRefreshTokenSecret(), nonceDecoder.apply(session.getNonce()))))
                .map(this::generateAccessToken)
                .map(this::saveBearerToken)
                .orElseThrow(() -> exception);
    }

    private AuthToken generateAccessToken(Session session) {
        String token = generateAccessToken(session.getUser());
        return new AuthToken(token, ssoProperties.isRefreshTokenRotation() ? rotateRefreshToken(session) : session.getRefreshToken());
    }

    private String rotateRefreshToken(Session session) {
        session.setNonce(generateNonce(session.getUser().getId()));
        session.setRefreshToken(refreshTokenGenerator.generate(ssoProperties.getRefreshTokenSecret(), nonceDecoder.apply(session.getNonce())));
        return sessionRepository.save(session).getRefreshToken();
    }

    @Override
    public User editUser(User user) {
        User ready = userRepository.save(user);
        localUserSearchEngine.save(ready);
        return ready;
    }

    @Override
    public void removeUser(String user) {
        userRepository.deleteById(user);
        sessionRepository.deleteAllByUserId(user);
        localUserSearchEngine.deleteById(user);
    }

    @Override
    public Page<User> getUsers(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public Page<User> searchUsers(String query, Pageable pageable) {
        return localUserSearchEngine.searchUsers(query, pageable);
    }

    @Override
    public Page<Session> loadSessions(String user, Pageable pageable) {
        return sessionRepository.findAllByUserId(user, pageable);
    }

    @Override
    public Optional<Session> loadSession(String sessionId) {
        return sessionRepository.findById(sessionId);
    }

    @Override
    public void removeSession(Session session) {
        sessionRepository.deleteById(session.getId());
        String token = BearerTokenHolder.getBearerToken(session.getRefreshToken(), ssoProperties.getBearerTokenStoreSecret());
        if (token != null) {
            revokedAccessTokensRepository.save(new RevokedAccessToken(token));
        }
    }
}
