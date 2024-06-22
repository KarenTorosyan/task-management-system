package tms.config.web;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.LinkedList;
import java.util.List;

@ConfigurationProperties("cors")
@Setter
@Getter
public class CorsProperties {

    private List<String> allowedOrigins = new LinkedList<>(List.of("http://localhost:4200", "http://localhost:3000"));
}
