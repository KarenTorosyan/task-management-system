package tms.in.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.data.mapping.PropertyReferenceException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import tms.exception.*;
import tms.transfer.ErrorState;

import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Set;

@RestControllerAdvice
@RequiredArgsConstructor
public class RestErrorHandler {

    private final MessageSource messageSource;

    private String localize(I18nException e, HttpServletRequest request) {
        return messageSource.getMessage(e.getCode(), e.getArgs(), e.getMessage(), request.getLocale());
    }

    @ExceptionHandler(RequiredParamException.class)
    ResponseEntity<ErrorState> handle(RequiredParamException e, HttpServletRequest request) {
        ErrorState errorResponse = new ErrorState()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(EntityConflictException.class)
    ResponseEntity<ErrorState> handle(EntityConflictException e, HttpServletRequest request) {
        ErrorState errorResponse = new ErrorState()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.CONFLICT.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.CONFLICT);
    }

    @ExceptionHandler(EntityNotFoundException.class)
    ResponseEntity<ErrorState> handle(EntityNotFoundException e, HttpServletRequest request) {
        ErrorState errorResponse = new ErrorState()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.NOT_FOUND.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    ResponseEntity<ErrorState> handle(ConstraintViolationException e, HttpServletRequest request) {
        Set<ConstraintViolation<?>> cv = e.getConstraintViolations();
        List<Map<String, String>> details = cv.stream()
                .map(c -> buildMessage(c, request))
                .toList();
        ErrorState errorResponse = new ErrorState()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(messageSource.getMessage("invalid_fields", new Object[]{}, request.getLocale()))
                .setDetails(details);
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    private Map<String, String> buildMessage(ConstraintViolation<?> c, HttpServletRequest request) {
        Map<String, Object> attributes = c.getConstraintDescriptor().getAttributes();
        String messageFormat = localize(new I18nException(c.getMessage(), c.getMessage()), request);
        String message = messageFormat
                .replace("{min}", String.valueOf(attributes.get("min")))
                .replace("{max}", String.valueOf(attributes.get("max")));
        String path = c.getPropertyPath().toString();
        String onlyFieldName = path.substring(path.lastIndexOf(".") + 1);
        return Map.of(onlyFieldName, message);
    }

    @ExceptionHandler(PropertyReferenceException.class)
    ResponseEntity<ErrorState> handle(PropertyReferenceException e, HttpServletRequest request) {
        ErrorState errorResponse = new ErrorState()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(messageSource.getMessage("invalid_sort_field",
                        new Object[]{e.getPropertyName()}, request.getLocale()));
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(SortConflictException.class)
    ResponseEntity<ErrorState> handle(SortConflictException e, HttpServletRequest request) {
        ErrorState errorResponse = new ErrorState()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }
}
