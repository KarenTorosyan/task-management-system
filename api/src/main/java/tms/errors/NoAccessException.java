package tms.errors;

public class NoAccessException extends I18nException {

    public NoAccessException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
