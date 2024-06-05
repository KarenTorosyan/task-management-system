package tms.config.swagger.annotation;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Operation
public @interface DocDeleteProtectedEntry {

    @AliasFor(annotation = Operation.class)
    String summary() default "";

    @AliasFor(annotation = Operation.class)
    String description() default "";

    @AliasFor(annotation = Operation.class)
    ApiResponse[] responses() default {
            @ApiResponse(responseCode = ResponseCodes.NOT_FOUND,
                    description = ResponseCodes.NOT_FOUND_DESCRIPTION,
                    content = @Content(schema = @Schema(implementation = ErrorState.class))),

            @ApiResponse(responseCode = ResponseCodes.NO_CONTENT,
                    description = ResponseCodes.NO_CONTENT_DESCRIPTION,
                    content = @Content),

            @ApiResponse(responseCode = ResponseCodes.UNAUTHORIZED,
                    description = ResponseCodes.UNAUTHORIZED_DESCRIPTION,
                    content = @Content(schema = @Schema(implementation = ErrorState.class))),

            @ApiResponse(responseCode = ResponseCodes.FORBIDDEN,
                    description = ResponseCodes.FORBIDDEN_DESCRIPTION,
                    content = @Content(schema = @Schema(implementation = ErrorState.class)))
    };

    @AliasFor(annotation = Operation.class)
    SecurityRequirement[] security() default {
        @SecurityRequirement(name = "bearer"),
        @SecurityRequirement(name = "oAuth2Client")
    };
}
