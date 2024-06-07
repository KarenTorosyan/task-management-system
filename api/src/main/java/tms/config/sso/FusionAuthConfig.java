package tms.config.sso;

import io.fusionauth.client.FusionAuthClient;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@ConditionalOnProperty(name = "sso.provider", havingValue = "fusionauth", matchIfMissing = true)
@Configuration
public class FusionAuthConfig {

    @Bean
    FusionAuthClient fusionAuthClient(SsoProperties ssoProperties) {
        return new FusionAuthClient(ssoProperties.getApiKey(), ssoProperties.getServer(), ssoProperties.getTenantId());
    }
}
