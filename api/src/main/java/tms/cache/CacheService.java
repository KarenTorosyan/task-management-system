package tms.cache;

import java.util.Optional;

public interface CacheService {

    <T> void putCache(String name, Object key, T value);

    <T> Optional<T> getCache(String name, Object key, Class<T> type);

    void evict(String name, Object key);
}
