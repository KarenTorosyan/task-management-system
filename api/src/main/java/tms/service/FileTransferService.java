package tms.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tms.exception.FileNotFoundException;
import tms.exception.FileTransferException;
import tms.out.cloud.FileTransfer;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.concurrent.CompletableFuture;

@Service
@RequiredArgsConstructor
public class FileTransferService {

    private final FileTransfer fileTransfer;

    public CompletableFuture<Path> transfer(Path path) {
        return fileTransfer.transfer(path).exceptionally(throwable -> {
            throw new FileTransferException("File transfer error", throwable, "file_transfer_error", path.toString());
        });
    }

    public CompletableFuture<Path> transfer(InputStream inputStream, String name) {
        return fileTransfer.transfer(inputStream, name).exceptionally(throwable -> {
            throw new FileTransferException("File transfer error", throwable, "file_transfer_error", name);
        });
    }

    public CompletableFuture<Path> transfer(MultipartFile multipartFile) {
        InputStream inputStream;
        try {
            inputStream = multipartFile.getInputStream();
        } catch (IOException e) {
            throw new FileNotFoundException("File not found", e, "file_not_found", multipartFile.getOriginalFilename());
        }
        return transfer(inputStream, multipartFile.getOriginalFilename());
    }

    public CompletableFuture<byte[]> read(Path path) {
        return fileTransfer.read(path).exceptionally(throwable -> {
            throw new FileNotFoundException("File not found", throwable, "file_not_found", path.toString());
        });
    }

    public CompletableFuture<Void> remove(Path path) {
        return fileTransfer.remove(path).exceptionally(throwable -> {
            throw new FileNotFoundException("File not found", throwable, "file_not_found", path.toString());
        });
    }
}
