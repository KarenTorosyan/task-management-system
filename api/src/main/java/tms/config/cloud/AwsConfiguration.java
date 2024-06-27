package tms.config.cloud;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3AsyncClient;

@Configuration
public class AwsConfiguration {

    @Bean
    S3AsyncClient s3AsyncClient(AwsProperties awsProperties) {
        AwsProperties.S3 s3 = awsProperties.getS3();
        return S3AsyncClient.builder()
                .region(Region.of(s3.getRegion()))
                .credentialsProvider(() -> AwsBasicCredentials.create(s3.getAccessKey(), s3.getSecretKey()))
                .build();
    }
}
