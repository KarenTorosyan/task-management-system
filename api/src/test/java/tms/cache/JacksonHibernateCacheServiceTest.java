package tms.cache;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.json.AutoConfigureJson;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.test.context.ContextConfiguration;
import org.testcontainers.shaded.com.fasterxml.jackson.core.JsonProcessingException;
import org.testcontainers.shaded.com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest
@ContextConfiguration(classes = {
        JacksonHibernateCacheService.class,
        ObjectMapper.class
})
@AutoConfigureJson
@DisplayName("JacksonHibernateCacheService should")
public class JacksonHibernateCacheServiceTest {

    @Autowired
    private JacksonHibernateCacheService cacheService;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private CacheManager cacheManager;

    @Mock
    private Cache cache;

    @DisplayName("put cache")
    @Test
    void shouldPutCache() throws JsonProcessingException {
        String cacheName = "name";
        String cacheKey = "key";
        String cacheValue = "value";
        given(cacheManager.getCache(cacheName)).willReturn(cache);
        cacheService.putCache(cacheName, cacheKey, cacheValue);
        verify(cacheManager).getCache(cacheName);
        verify(cache).put(cacheKey, objectMapper.writeValueAsString(cacheValue));
    }

    @DisplayName("get cache when found")
    @Test
    void shouldGetCacheWhenFound() throws IOException {
        String cacheName = "name";
        String cacheKey = "key";
        String cacheValue = objectMapper.writeValueAsString("value");
        given(cacheManager.getCache(cacheName)).willReturn(cache);
        given(cache.get(cacheKey, String.class)).willReturn(cacheValue);
        assertThat(cacheService.getCache(cacheName, cacheKey, String.class))
                .isEqualTo(Optional.of(objectMapper.readValue(cacheValue, String.class)));
        verify(cacheManager).getCache(cacheName);
        verify(cache).get(cacheKey, String.class);
    }

    @DisplayName("get empty when cache not found")
    @Test
    void shouldGetEmptyWhenCacheNotFound() {
        String cacheName = "name";
        String cacheKey = "key";
        given(cacheManager.getCache(cacheName)).willReturn(cache);
        given(cache.get(cacheKey, String.class)).willReturn(null);
        assertThat(cacheService.getCache(cacheName, cacheKey, String.class))
                .isEmpty();
        verify(cacheManager).getCache(cacheName);
        verify(cache).get(cacheKey, String.class);
    }

    @DisplayName("evict cache when found")
    @Test
    void shouldEvictCacheWhenFound() {
        String cacheName = "name";
        String cacheKey = "key";
        given(cacheManager.getCache(cacheName)).willReturn(cache);
        cacheService.evict(cacheName, cacheKey);
        verify(cacheManager).getCache(cacheName);
        verify(cache).evictIfPresent(cacheKey);
    }
}
