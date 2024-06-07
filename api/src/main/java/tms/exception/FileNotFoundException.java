package tms.exception;

public class FileNotFoundException extends I18nException {

    public FileNotFoundException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
