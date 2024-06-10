package tms.util;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

public class MacUtil {

    public static byte[] hmacSha2(byte[] data, byte[] key, int len) {
        if (len != 128 && len != 256 && len != 512) {
            throw new IllegalArgumentException("Illegal length: " + len);
        }
        String alg = "HmacSHA" + len;
        Mac mac;
        try {
            mac = Mac.getInstance(alg);
            mac.init(new SecretKeySpec(key, alg));
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new RuntimeException(e);
        }
        return mac.doFinal(data);
    }
}
