package tms.out.sso;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import tms.util.MacUtil;

import java.util.Base64;

@ConditionalOnProperty(name = "sso.refresh-token-algorithm", havingValue = "HmacSha512")
@Component
public class HmacRefreshTokenGenerator implements RefreshTokenGenerator {

    @Override
    public String generate(String secret, byte[] data) {
        byte[] mac = MacUtil.hmacSha2(data, secret.getBytes(), 512);
        return Base64.getEncoder()
                .withoutPadding()
                .encodeToString(mac);
    }
}
