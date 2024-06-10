package tms.out.sso;

public interface RefreshTokenGenerator {

    String generate(String secret, byte[] data);
}
