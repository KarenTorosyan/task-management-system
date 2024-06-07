package tms.config.env;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.nio.file.Path;

@ConfigurationProperties("fs")
@Setter
@Getter
public class FsProperties {

    private Path filesPath;
}
