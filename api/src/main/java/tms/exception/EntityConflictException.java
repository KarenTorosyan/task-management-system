package tms.exception;

public class EntityConflictException extends I18nException {

    public EntityConflictException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
