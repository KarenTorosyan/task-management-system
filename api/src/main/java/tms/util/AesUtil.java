package tms.util;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class AesUtil {

    public static SecretKey genKey(int len) {
        KeyGenerator keyGenerator;
        try {
            keyGenerator = KeyGenerator.getInstance("AES");
            keyGenerator.init(len);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return keyGenerator.generateKey();
    }

    public static byte[] genIv(int len) {
        byte[] iv = new byte[len];
        new SecureRandom().nextBytes(iv);
        return iv;
    }

    public static byte[] aesCbc(int op, byte[] content, SecretKey key, byte[] iv) throws InvalidKeyException {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(op, key, new IvParameterSpec(iv));
            return cipher.doFinal(content);
        } catch (InvalidAlgorithmParameterException | NoSuchPaddingException | IllegalBlockSizeException |
                 NoSuchAlgorithmException | BadPaddingException e) {
            throw new RuntimeException(e);
        }
    }
}
