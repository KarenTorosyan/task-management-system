package tms.errors;

import lombok.Getter;

@Getter
public class SortConflictException extends I18nException {

    public SortConflictException(String message, String code, Object... args) {
        super(message, code, args);
    }
}
