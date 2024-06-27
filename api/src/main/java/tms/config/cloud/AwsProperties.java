package tms.config.cloud;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;

@ConfigurationProperties("aws")
@Setter
@Getter
public class AwsProperties {

    @NestedConfigurationProperty
    private S3 s3;

    @Setter
    @Getter
    public static class S3 {

        private String bucket;
        private String region;
        private String accessKey;
        private String secretKey;
    }
}
