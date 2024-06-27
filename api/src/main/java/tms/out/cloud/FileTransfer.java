package tms.out.cloud;

import java.io.InputStream;
import java.nio.file.Path;
import java.util.concurrent.CompletableFuture;

public interface FileTransfer {

    CompletableFuture<Path> transfer(Path path);

    CompletableFuture<Path> transfer(InputStream stream, String name);

    CompletableFuture<byte[]> read(Path path);

    CompletableFuture<Void> remove(Path path);
}
