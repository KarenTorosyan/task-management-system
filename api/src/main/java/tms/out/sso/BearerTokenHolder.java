package tms.out.sso;

import org.springframework.lang.Nullable;
import tms.util.AesUtil;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class BearerTokenHolder {

    private static final Map<String, Map<String, byte[]>> storage = new ConcurrentHashMap<>(1);

    public static void addBearerToken(String refreshToken, String bearerToken, byte[] key) {
        byte[] iv = AesUtil.genIv(16);
        SecretKeySpec aesKey = new SecretKeySpec(key, "AES");
        byte[] bearerTokenCipher;
        try {
            bearerTokenCipher = AesUtil.aesCbc(Cipher.ENCRYPT_MODE, bearerToken.getBytes(), aesKey, iv);
        } catch (InvalidKeyException e) {
            throw new RuntimeException("Unable to encipher token", e);
        }
        storage.put(refreshToken, Map.of("bearerToken", bearerTokenCipher, "iv", iv));
    }

    public static @Nullable String getBearerToken(String refreshToken, byte[] key) {
        Map<String, byte[]> map = storage.get(refreshToken);
        if (map == null) {
            return null;
        }
        byte[] bearerTokenCipher = map.get("bearerToken");
        byte[] iv = map.get("iv");

        SecretKeySpec aesKey = new SecretKeySpec(key, "AES");
        try {
            return new String(AesUtil.aesCbc(Cipher.DECRYPT_MODE, bearerTokenCipher, aesKey, iv));
        } catch (InvalidKeyException e) {
            throw new RuntimeException("Unable to decipher token", e);
        }
    }

    public static void clearBearerToken(String refreshToken) {
        storage.remove(refreshToken);
    }
}
