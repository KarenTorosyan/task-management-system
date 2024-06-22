package tms.config.swagger;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;
import org.springframework.validation.annotation.Validated;

@ConfigurationProperties("swagger")
@Setter
@Getter
@Validated
public class SwaggerProperties {

    @NestedConfigurationProperty
    private OAuth2 oAuth2;

    @Setter
    @Getter
    public static class OAuth2 {

        @NotBlank(message = "Issuer required")
        private String issuer;
    }
}
