package tms.out.sso;

import com.inversoft.error.Error;
import com.inversoft.error.Errors;
import com.inversoft.rest.ClientResponse;
import io.fusionauth.client.FusionAuthClient;
import io.fusionauth.domain.UserRegistration;
import io.fusionauth.domain.api.LoginRequest;
import io.fusionauth.domain.api.LoginResponse;
import io.fusionauth.domain.api.UserRequest;
import io.fusionauth.domain.api.UserResponse;
import io.fusionauth.domain.api.jwt.JWTRefreshResponse;
import io.fusionauth.domain.api.jwt.RefreshRequest;
import io.fusionauth.domain.api.user.RegistrationRequest;
import io.fusionauth.domain.api.user.RegistrationResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.stereotype.Component;
import tms.config.sso.FusionAuthConfig;
import tms.config.sso.SsoProperties;
import tms.exception.SsoProviderException;
import tms.model.AuthToken;
import tms.model.User;

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
                .setImage(user.imageUrl != null ? user.imageUrl.toString().replace(ssoProperties.getFilesAccess(), "") : null)
                .setPassword(user.password);
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
        ClientResponse<LoginResponse, Errors> response = fusionAuthClient.login(new LoginRequest(UUID.fromString(ssoProperties.getApplicationId()), email, password));
        if (response.wasSuccessful()) {
            return Optional.of(new AuthToken(response.successResponse.token, response.successResponse.refreshToken));
        }
        handleErrors(response.errorResponse, response.exception);
        return Optional.empty();
    }

    @Override
    public void signOut(String refreshToken) {
        ClientResponse<Void, Void> response = fusionAuthClient.logout(true, refreshToken);
        if (response.wasSuccessful()) {
            return;
        }
        handleErrors(response.exception);
        throw new SsoProviderException("User sign out failed");
    }

    @Override
    public AuthToken refreshToken(String refreshToken) {
        ClientResponse<JWTRefreshResponse, Errors> response = fusionAuthClient.exchangeRefreshTokenForJWT(new RefreshRequest(refreshToken));
        if (response.wasSuccessful()) {
            return new AuthToken(response.successResponse.token, response.successResponse.refreshToken);
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
}
