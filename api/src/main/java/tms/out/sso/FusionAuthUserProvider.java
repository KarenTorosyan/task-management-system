package tms.out.sso;

import com.inversoft.error.Error;
import com.inversoft.error.Errors;
import com.inversoft.rest.ClientResponse;
import io.fusionauth.client.FusionAuthClient;
import io.fusionauth.domain.EventInfo;
import io.fusionauth.domain.UserRegistration;
import io.fusionauth.domain.api.LoginRequest;
import io.fusionauth.domain.api.LoginResponse;
import io.fusionauth.domain.api.UserRequest;
import io.fusionauth.domain.api.UserResponse;
import io.fusionauth.domain.api.jwt.JWTRefreshResponse;
import io.fusionauth.domain.api.jwt.RefreshRequest;
import io.fusionauth.domain.api.jwt.RefreshTokenResponse;
import io.fusionauth.domain.api.user.RegistrationRequest;
import io.fusionauth.domain.api.user.RegistrationResponse;
import io.fusionauth.domain.jwt.DeviceInfo;
import io.fusionauth.domain.jwt.RefreshToken;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import tms.config.sso.FusionAuthConfig;
import tms.config.sso.SsoProperties;
import tms.exception.SsoProviderException;
import tms.model.AuthToken;
import tms.model.RevokedAccessToken;
import tms.model.Session;
import tms.model.User;
import tms.out.persistence.RevokedAccessTokensRepository;

import java.net.URI;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@ConditionalOnBean(FusionAuthConfig.class)
@Component
@RequiredArgsConstructor
public class FusionAuthUserProvider implements UserProvider {

    private final FusionAuthClient fusionAuthClient;

    private final SsoProperties ssoProperties;

    private final FusionAuthSearchEngine fusionAuthSearchEngine;

    private final RevokedAccessTokensRepository revokedAccessTokensRepository;

    @Override
    public Optional<User> loadUser(String user) {
        UUID userId;
        try {
            userId = UUID.fromString(user);
        } catch (IllegalArgumentException e) {
            return Optional.empty();
        }
        ClientResponse<UserResponse, Errors> response = fusionAuthClient.retrieveUser(userId);

        if (response.wasSuccessful()) {
            return Optional.of(toLocalUser(response.successResponse.user));
        }
        handleErrors(response.errorResponse, response.exception);
        return Optional.empty();
    }

    @Override
    public Optional<User> loadUserByEmail(String email) {
        ClientResponse<UserResponse, Errors> response = fusionAuthClient.retrieveUserByEmail(email);
        if (response.wasSuccessful()) {
            return Optional.of(toLocalUser(response.successResponse.user));
        }
        handleErrors(response.errorResponse, response.exception);
        return Optional.empty();
    }

    private void handleErrors(Errors errors, Exception exception) {
        if (errors != null) {
            for (Error error : errors.generalErrors) {
                throw new SsoProviderException(error.message);
            }
            for (Map.Entry<String, List<Error>> entry : errors.fieldErrors.entrySet())
                for (Error error : entry.getValue())
                    throw new SsoProviderException(error.message);
        }
        if (exception != null) {
            throw new SsoProviderException(exception.getMessage());
        }
    }

    private void handleErrors(Exception exception) {
        if (exception != null) {
            throw new SsoProviderException(exception.getMessage());
        }
    }

    private User toLocalUser(io.fusionauth.domain.User user) {
        return new User()
                .setId(user.id.toString())
                .setEmail(user.email)
                .setName(user.fullName)
                .setImage(user.imageUrl != null ? user.imageUrl.toString().replace(ssoProperties.getFilesAccess(), "") : null);
    }

    @Override
    public User signUp(User user) {
        io.fusionauth.domain.User instance = toFusionAuthUser(user);
        UserRegistration userRegistration = new UserRegistration();
        userRegistration.applicationId = UUID.fromString(ssoProperties.getApplicationId());
        ClientResponse<RegistrationResponse, Errors> response = fusionAuthClient.register(UUID.randomUUID(), new RegistrationRequest(instance, userRegistration));

        if (response.wasSuccessful()) {
            return toLocalUser(response.successResponse.user);
        }
        handleErrors(response.errorResponse, response.exception);
        throw new SsoProviderException("User sign up failed");
    }

    private io.fusionauth.domain.User toFusionAuthUser(User user) {
        io.fusionauth.domain.User instance = new io.fusionauth.domain.User();
        if (user.getId() != null) {
            instance.id = UUID.fromString(user.getId());
        }
        instance.email = user.getEmail();
        instance.password = user.getPassword();
        instance.fullName = user.getName();
        if (user.getImage() != null) {
            instance.imageUrl = URI.create(ssoProperties.getFilesAccess().concat(user.getImage()));
        }
        return instance;
    }

    @Override
    public Optional<AuthToken> signIn(String email, String password) {
        LoginRequest loginRequest = new LoginRequest(UUID.fromString(ssoProperties.getApplicationId()), email, password);
        EventInfo eventInfo = new EventInfo();
        eventInfo.ipAddress = ClientMetadataHolder.getIp();
        eventInfo.deviceName = ClientMetadataHolder.getDevice();
        loginRequest.eventInfo = eventInfo;

        ClientResponse<LoginResponse, Errors> response = fusionAuthClient.login(loginRequest);
        if (response.wasSuccessful()) {
            if (response.successResponse.refreshToken == null) {
                throw new SsoProviderException("Refresh token not received");
            }
            return Optional.of(saveBearerToken(new AuthToken(response.successResponse.token, response.successResponse.refreshToken)));
        }
        handleErrors(response.errorResponse, response.exception);
        return Optional.empty();
    }

    private AuthToken saveBearerToken(AuthToken authToken) {
        BearerTokenHolder.addBearerToken(authToken.refreshToken(), authToken.token(), ssoProperties.getBearerTokenStoreSecret());
        return authToken;
    }

    @Override
    public void signOut(String refreshToken) {
        ClientResponse<Void, Void> response = fusionAuthClient.logout(true, refreshToken);
        if (response.wasSuccessful()) {
            BearerTokenHolder.clearBearerToken(refreshToken);
            return;
        }
        handleErrors(response.exception);
        throw new SsoProviderException("User sign out failed");
    }

    @Override
    public AuthToken refreshToken(String refreshToken) {
        ClientResponse<JWTRefreshResponse, Errors> response = fusionAuthClient.exchangeRefreshTokenForJWT(new RefreshRequest(refreshToken));
        if (response.wasSuccessful()) {
            return saveBearerToken(new AuthToken(response.successResponse.token, response.successResponse.refreshToken));
        }
        handleErrors(response.errorResponse, response.exception);
        throw new SsoProviderException("Token refreshing failed");
    }

    @Override
    public User editUser(User user) {
        io.fusionauth.domain.User instance = toFusionAuthUser(user);
        ClientResponse<UserResponse, Errors> response = fusionAuthClient.updateUser(UUID.fromString(user.getId()), new UserRequest(instance));
        if (response.wasSuccessful()) {
            return toLocalUser(response.successResponse.user);
        }
        handleErrors(response.errorResponse, response.exception);
        throw new SsoProviderException("User editing failed");
    }

    @Override
    public void removeUser(String user) {
        ClientResponse<Void, Errors> response = fusionAuthClient.deleteUser(UUID.fromString(user));
        if (response.wasSuccessful()) {
            return;
        }
        handleErrors(response.errorResponse, response.exception);
        throw new SsoProviderException("User removing failed");
    }

    @Override
    public Page<User> getUsers(Pageable pageable) {
        return fusionAuthSearchEngine.matchAll(pageable, this::toLocalUser, this::handleErrors);
    }

    @Override
    public Page<User> searchUsers(String query, Pageable pageable) {
        return fusionAuthSearchEngine.searchUsers(query, pageable, this::toLocalUser, this::handleErrors);
    }

    @Override
    public Page<Session> loadSessions(String user, Pageable pageable) {
        ClientResponse<RefreshTokenResponse, Errors> response = fusionAuthClient.retrieveRefreshTokens(UUID.fromString(user));
        if (response.wasSuccessful()) {
            List<Session> sessions = response.successResponse.refreshTokens
                    .stream().map(this::toLocalSession)
                    .toList();
            return new PageImpl<>(sessions, pageable, sessions.size());
        }
        handleErrors(response.errorResponse, response.exception);
        throw new SsoProviderException("Sessions retrieving failed");
    }

    private Session toLocalSession(RefreshToken refreshToken) {
        DeviceInfo device = refreshToken.metaData.device;
        return new Session()
                .setId(refreshToken.id.toString())
                .setUser(new User().setId(refreshToken.userId.toString()))
                .setRefreshToken(refreshToken.token)
                .setIpAddress(device.lastAccessedAddress)
                .setDevice(device.name)
                .setCreated(refreshToken.startInstant.toInstant())
                .setLastAccess(refreshToken.metaData.device.lastAccessedInstant.toInstant());
    }

    @Override
    public Optional<Session> loadSession(String sessionId) {
        ClientResponse<RefreshTokenResponse, Errors> response = fusionAuthClient.retrieveRefreshTokenById(toRefreshTokenId(sessionId));
        if (response.wasSuccessful()) {
            return Optional.of(toLocalSession(response.successResponse.refreshToken));
        }
        handleErrors(response.errorResponse, response.exception);
        return Optional.empty();
    }

    private UUID toRefreshTokenId(String sessionId) {
        UUID refreshTokenId;
        try {
            refreshTokenId = UUID.fromString(sessionId);
        } catch (IllegalArgumentException e) {
            throw new SsoProviderException("SessionId must be a valid UUID");
        }
        return refreshTokenId;
    }

    @Override
    public void removeSession(Session session) {
        ClientResponse<Void, Errors> response = fusionAuthClient.revokeRefreshTokenByToken(session.getRefreshToken());
        if (response.wasSuccessful()) {
            String token = BearerTokenHolder.getBearerToken(session.getRefreshToken(), ssoProperties.getBearerTokenStoreSecret());
            if (token != null) {
                revokedAccessTokensRepository.save(new RevokedAccessToken(token));
            }
            return;
        }
        handleErrors(response.errorResponse, response.exception);
        throw new SsoProviderException("Session removing failed");
    }
}
