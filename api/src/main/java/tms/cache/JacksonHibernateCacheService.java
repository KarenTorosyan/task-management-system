package tms.cache;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate6.Hibernate6Module;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.Optional;

@Service
public class JacksonHibernateCacheService implements CacheService {

    private final ObjectMapper objectMapper;
    private final CacheManager cacheManager;

    public JacksonHibernateCacheService(ObjectMapper objectMapper, CacheManager cacheManager) {
        this.objectMapper = objectMapper.copy()
                .registerModule(new Hibernate6Module()
                        .enable(Hibernate6Module.Feature.SERIALIZE_IDENTIFIER_FOR_LAZY_NOT_LOADED_OBJECTS));
        this.cacheManager = cacheManager;
    }

    private <T> String serialize(T value) {
        try {
            return objectMapper.writeValueAsString(value);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Cannot serialize object to json", e);
        }
    }

    @SuppressWarnings("unchecked")
    private <T> T deserialize(String json, Class<?> type) {
        try {
            return (T) objectMapper.readValue(json, type);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("Cannot deserialize json to object", e);
        }
    }

    @Override
    public <T> void putCache(String name, Object key, T value) {
        String valueAsJson = serialize(value);
        Cache cache = Objects.requireNonNull(cacheManager.getCache(name));
        cache.put(key, valueAsJson);
    }

    @Override
    public <T> Optional<T> getCache(String name, Object key, Class<T> type) {
        Cache cache = Objects.requireNonNull(cacheManager.getCache(name));
        String valueAsJson = cache.get(key, String.class);
        return Optional.ofNullable(valueAsJson)
                .map(json -> deserialize(json, type));
    }

    @Override
    public void evict(String name, Object key) {
        Cache cache = cacheManager.getCache(name);
        if (cache != null) {
            cache.evictIfPresent(key);
        }
    }
}
