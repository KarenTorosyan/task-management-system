package tms.out.sso;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.jwk.JWK;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import org.springframework.core.io.Resource;

import java.io.File;
import java.io.IOException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.List;

public class LocalJwkSource {

    public static JWKSource<SecurityContext> jwkSource(Resource keyStore, String storePassword, String alias, String password) {
        return new ImmutableJWKSet<>(new JWKSet(List.of(loadJwk(keyStore, storePassword, alias, password))));
    }

    public static JWK loadJwk(Resource keyStore, String storePassword, String alias, String password) {
        try {
            return JWK.load(keyStore(keyStore, storePassword), alias, password.toCharArray());
        } catch (KeyStoreException | JOSEException e) {
            throw new RuntimeException(e);
        }
    }

    private static KeyStore keyStore(Resource keystore, String storePassword) {
        try {
            return KeyStore.getInstance(keystoreFile(keystore), storePassword.toCharArray());
        } catch (KeyStoreException | NoSuchAlgorithmException | CertificateException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static File keystoreFile(Resource keystore) {
        try {
            return keystore.getFile();
        } catch (IOException e) {
            throw new RuntimeException("Unable to load keystore file", e);
        }
    }
}
