package tms.errors;

public class EnumConflictException extends I18nException {

    public EnumConflictException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
