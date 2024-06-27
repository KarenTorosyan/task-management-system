package tms.config.file;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.nio.file.Path;

@ConfigurationProperties("file")
@Setter
@Getter
public class FileProperties {

    private String store = "s3";

    private String localDirectory = "files";

    public Path getLocalDirectory() {
        return Path.of(localDirectory);
    }
}
