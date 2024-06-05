package tms.util;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = AnyOfValidator.class)
public @interface AnyOf {

    Class<? extends Enum<?>> value();

    String message() default "Set any of %s";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
