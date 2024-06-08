package tms.config.sso;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("sso")
@Setter
@Getter
public class SsoProperties {

    private String provider;

    private String server;

    private String apiKey;

    private String tenantId;

    private String applicationId;

    private int accessTokenAge;

    private int refreshTokenAge;

    private String filesAccess;

    private String searchEngine;
}
