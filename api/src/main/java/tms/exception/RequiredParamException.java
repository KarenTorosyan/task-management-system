package tms.exception;

public class RequiredParamException extends I18nException {

    public RequiredParamException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
