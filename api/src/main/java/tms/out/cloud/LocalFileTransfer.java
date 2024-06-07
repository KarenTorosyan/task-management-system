package tms.out.cloud;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import tms.exception.FileNotFoundException;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.util.Objects;

@Component
public class LocalFileTransfer implements FileTransfer {

    @Override
    public Path transfer(MultipartFile file, Path path) {
        try {
            Files.createDirectories(path);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String name = Objects.requireNonNull(file.getOriginalFilename());
        Path location = path.resolve(Instant.now().toEpochMilli() + "_" + name.replaceAll("\\s+", "_"));
        try {
            file.transferTo(location);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return location;
    }

    @Override
    public byte[] read(Path path) {
        if (!Files.exists(path)) {
            throw new FileNotFoundException("File not found", "file_not_found", path.toString());
        }
        try {
            return Files.readAllBytes(path);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void remove(Path path) {
        try {
            Files.deleteIfExists(path);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
