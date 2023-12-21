package tms;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.elasticsearch.ElasticsearchContainer;

public class DataElasticsearchContainerTest {

    private static final ElasticsearchContainer Container =
            new ElasticsearchContainer("elasticsearch:8.11.3")
                    .withPassword("elastic")
                    .withEnv("xpack.security.enabled", "false")
                    .withEnv("ES_JAVA_OPTS", "-Xmx512m -Xms512m")
                    .withEnv("bootstrap.memory_lock", "true");

    @BeforeAll
    static void start() {
        Container.start();
    }

    @DynamicPropertySource
    static void setProps(DynamicPropertyRegistry registry) {
        registry.add("spring.elasticsearch.uris", Container::getHttpHostAddress);
        registry.add("spring.elasticsearch.username", () -> "elastic");
        registry.add("spring.elasticsearch.password", () -> "elastic");
    }

    @AfterAll
    static void stop() {
        Container.stop();
    }
}
