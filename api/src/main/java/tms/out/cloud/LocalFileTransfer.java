package tms.out.cloud;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;
import tms.config.file.FileProperties;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;

@ConditionalOnProperty(name = "file.store", havingValue = "local")
@Component
@RequiredArgsConstructor
public class LocalFileTransfer implements FileTransfer {

    Function<String, String> nameResolver = name ->
            Instant.now().toEpochMilli() + "_" + name.replaceAll("\\s+", "_");

    private final FileProperties fileProperties;

    @Override
    public CompletableFuture<Path> transfer(Path path) {
        Path dest = fileProperties.getLocalDirectory();
        String name = nameResolver.apply(getFileName(path.toString()));
        dest = dest.resolve(Path.of(name));
        try {
            Files.copy(path, dest);
        } catch (IOException e) {
            return CompletableFuture.failedFuture(e);
        }
        return CompletableFuture.completedFuture(dest);
    }

    @Override
    public CompletableFuture<Path> transfer(InputStream stream, String name) {
        Path dest = fileProperties.getLocalDirectory();
        name = nameResolver.apply(name);
        dest = dest.resolve(Path.of(name));
        try {
            Files.copy(stream, dest);
        } catch (IOException e) {
            return CompletableFuture.failedFuture(e);
        }
        return CompletableFuture.completedFuture(dest);
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
        byte[] bytes;
        try {
            bytes = Files.readAllBytes(path);
        } catch (IOException e) {
            return CompletableFuture.failedFuture(e);
        }
        return CompletableFuture.completedFuture(bytes);
    }

    @Override
    public CompletableFuture<Void> remove(Path path) {
        try {
            Files.deleteIfExists(path);
        } catch (IOException e) {
            return CompletableFuture.failedFuture(e);
        }
        return CompletableFuture.completedFuture(null);
    }
}
