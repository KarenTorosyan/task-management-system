package tms.out.sso;

import lombok.Getter;
import lombok.Setter;

public class ClientMetadataHolder {

    @Getter
    @Setter
    private static String ip;

    @Getter
    @Setter
    private static String device;
}
