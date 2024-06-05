package tms.exception;

public class EntityNotFoundException extends I18nException {

    public EntityNotFoundException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
