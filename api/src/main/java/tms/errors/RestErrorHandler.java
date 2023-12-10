package tms.errors;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestControllerAdvice
@RequiredArgsConstructor
public class RestErrorHandler {

    private final MessageSource messageSource;

    private String localize(I18nException e, HttpServletRequest request) {
        return messageSource.getMessage(e.getCode(), e.getArgs(), e.getMessage(), request.getLocale());
    }

    @ExceptionHandler(RequiredParamException.class)
    ResponseEntity<ErrorResponse> handle(RequiredParamException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NoAccessException.class)
    ResponseEntity<ErrorResponse> handle(NoAccessException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.FORBIDDEN.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.FORBIDDEN);
    }

    @ExceptionHandler(EntityConflictException.class)
    ResponseEntity<ErrorResponse> handle(EntityConflictException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.CONFLICT.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.CONFLICT);
    }

    @ExceptionHandler(EntityNotFoundException.class)
    ResponseEntity<ErrorResponse> handle(EntityNotFoundException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.NOT_FOUND.value())
                .setDatetime(Instant.now())
                .setMessage(localize(e, request));
        return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(EnumConflictException.class)
    ResponseEntity<ErrorResponse> handle(EnumConflictException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(e.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    ResponseEntity<ErrorResponse> handle(MethodArgumentNotValidException e, HttpServletRequest request) {
        List<Map<String, String>> details = e.getFieldErrors().stream()
                .map(field -> Map.of(field.getField(), Objects.requireNonNull(field.getDefaultMessage())))
                .toList();
        ErrorResponse errorResponse = new ErrorResponse()
                .setUri(request.getRequestURI())
                .setStatus(HttpStatus.BAD_REQUEST.value())
                .setDatetime(Instant.now())
                .setMessage(messageSource.getMessage("invalid_fields", new Object[]{}, request.getLocale()))
                .setDetails(details);
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }
}
