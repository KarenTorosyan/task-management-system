package tms.exception;

public class FileTransferException extends I18nException {

    public FileTransferException(String message, Throwable cause, String code, Object... args) {
        super(message, cause, code, args);
    }
}
