package tms.out.cloud;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import software.amazon.awssdk.core.BytesWrapper;
import software.amazon.awssdk.core.async.AsyncRequestBody;
import software.amazon.awssdk.core.async.AsyncResponseTransformer;
import software.amazon.awssdk.services.s3.S3AsyncClient;
import tms.config.cloud.AwsProperties;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.time.Instant;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;

@ConditionalOnProperty(name = "file.store", havingValue = "s3")
@Component
@RequiredArgsConstructor
public class S3FileTransfer implements FileTransfer {

    Function<String, String> nameResolver = name ->
            Instant.now().toEpochMilli() + "_" + name.replaceAll("\\s+", "_");

    private final S3AsyncClient s3AsyncClient;
    private final AwsProperties awsProperties;

    @Override
    public CompletableFuture<Path> transfer(Path path) {
        AwsProperties.S3 s3 = awsProperties.getS3();
        String name = nameResolver.apply(getFileName(path.toString()));
        return s3AsyncClient.putObject(builder -> builder.bucket(s3.getBucket()).key(name), path)
                .thenApply(response -> Path.of(name));
    }

    @Override
    public CompletableFuture<Path> transfer(InputStream stream, String name) {
        AwsProperties.S3 s3 = awsProperties.getS3();
        name = nameResolver.apply(name);
        String finalName = name;

        byte[] bytes;
        try {
            bytes = stream.readAllBytes();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return s3AsyncClient.putObject(builder -> builder.bucket(s3.getBucket()).key(finalName), AsyncRequestBody.fromBytes(bytes))
                .thenApply(response -> Path.of(finalName));
    }

    private String getFileName(String path) {
        int index = path.lastIndexOf("/");
        if (index == -1) {
            return path;
        }
        return path.substring(index + 1);
    }

    @Override
    public CompletableFuture<byte[]> read(Path path) {
        AwsProperties.S3 s3 = awsProperties.getS3();
        String name = getFileName(path.toString());
        return s3AsyncClient.getObject(builder -> builder.bucket(s3.getBucket()).key(name), AsyncResponseTransformer.toBytes())
                .thenApply(BytesWrapper::asByteArray);
    }

    @Override
    public CompletableFuture<Void> remove(Path path) {
        AwsProperties.S3 s3 = awsProperties.getS3();
        return s3AsyncClient.deleteObject(b -> b.bucket(s3.getBucket()).key(getFileName(path.toString())))
                .thenApply(response -> null);
    }
}
