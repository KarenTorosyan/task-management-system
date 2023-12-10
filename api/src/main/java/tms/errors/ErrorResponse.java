package tms.errors;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.time.Instant;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@Accessors(chain = true)
public class ErrorResponse {

    private int status;

    private String uri;

    private String message;

    private List<Map<String, String>> details;

    private Instant datetime;
}
