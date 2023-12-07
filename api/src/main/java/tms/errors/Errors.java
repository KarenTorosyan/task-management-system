package tms.errors;

public class Errors {

    public static RequiredParamException emailOrPreferredUsernameRequiredInJwt() {
        String message = "The email or preferred_username required in jwt!";
        throw new RequiredParamException(message, "jwt_required_email_or_preferred_username");
    }
}
