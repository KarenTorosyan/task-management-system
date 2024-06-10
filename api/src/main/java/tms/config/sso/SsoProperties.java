package tms.config.sso;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.io.Resource;

import java.util.ArrayList;
import java.util.HexFormat;
import java.util.List;

@ConfigurationProperties("sso")
@Setter
@Getter
public class SsoProperties {

    private String provider;

    private String server;

    private String jwtSetUri;

    private String jwsAlgorithm;

    private List<String> audiences = new ArrayList<>(0);

    private String apiKey;

    private String tenantId;

    private String applicationId;

    private int accessTokenAge;

    private int refreshTokenAge;

    private String filesAccess;

    private String searchEngine;

    private String refreshTokenSecret;

    private String refreshTokenAlgorithm = "HmacSha512";

    private boolean refreshTokenRotation = true;

    private String bearerTokenType = "jwt";

    private String bearerTokenStoreSecretHex;

    private Resource keystore;

    private String keystoreAlias;

    private String keystorePassword;

    private String keystoreKeyPassword;

    private String keystoreKeyAlgorithm;

    public byte[] getBearerTokenStoreSecret() {
        return HexFormat.of().parseHex(bearerTokenStoreSecretHex);
    }
}
