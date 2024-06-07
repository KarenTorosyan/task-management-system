package tms.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tms.config.env.FsProperties;
import tms.out.cloud.FileTransfer;

import java.nio.file.Path;
import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class FileTransferService {

    private final FileTransfer fileTransfer;

    private final FsProperties fsProperties;

    public Path transfer(MultipartFile file, Function<Path, Path> resolve) {
        Path path = resolve.apply(fsProperties.getFilesPath());
        return fileTransfer.transfer(file, path);
    }

    public byte[] read(Path path) {
        return fileTransfer.read(path);
    }

    public void remove(Path path) {
        fileTransfer.remove(path);
    }
}
