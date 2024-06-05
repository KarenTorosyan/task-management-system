package tms.util;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.Arrays;
import java.util.List;

public class AnyOfValidator implements ConstraintValidator<AnyOf, Object> {

    private String message;
    private List<String> constants;

    @Override
    public void initialize(AnyOf annotation) {
        message = annotation.message();
        constants = Arrays.stream(annotation.value().getEnumConstants())
                .map(Enum::name)
                .toList();
    }

    @Override
    public boolean isValid(Object val, ConstraintValidatorContext constraintValidatorContext) {
        if (val == null) {
            return true;
        }
        boolean valid = constants.contains(String.valueOf(val));
        if (!valid) {
            constraintValidatorContext.disableDefaultConstraintViolation();
            String message = String.format(this.message, constants);
            constraintValidatorContext.buildConstraintViolationWithTemplate(message)
                    .addConstraintViolation();
        }
        return valid;
    }
}
