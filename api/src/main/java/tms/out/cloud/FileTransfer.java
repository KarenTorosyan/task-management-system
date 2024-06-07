package tms.out.cloud;

import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;

public interface FileTransfer {

    Path transfer(MultipartFile file, Path path);

    byte[] read(Path path);

    void remove(Path path);
}
