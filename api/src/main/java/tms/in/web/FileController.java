package tms.in.web;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import tms.service.FileTransferService;

import java.nio.file.Path;

@RestController
@RequiredArgsConstructor
@Tag(name = "File")
public class FileController {

    private final FileTransferService fileTransferService;

    @GetMapping("/download")
    public ResponseEntity<byte[]> load(@RequestParam String location) {
        byte[] content = fileTransferService.read(Path.of(location));
        String ext = location.substring(location.lastIndexOf(".") + 1);
        return ResponseEntity.ok()
                .contentType(new MediaType("image", ext))
                .contentLength(content.length)
                .body(content);
    }
}
