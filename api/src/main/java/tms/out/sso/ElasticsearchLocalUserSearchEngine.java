package tms.out.sso;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.IndexOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.query.StringQuery;
import org.springframework.stereotype.Component;
import tms.model.User;

import java.util.List;
import java.util.Map;

@ConditionalOnProperty(name = "sso.search-engine", havingValue = "elasticsearch", matchIfMissing = true)
@Component
public class ElasticsearchLocalUserSearchEngine implements LocalUserSearchEngine {

    private final ElasticsearchOperations elasticsearchOperations;

    public ElasticsearchLocalUserSearchEngine(ElasticsearchOperations elasticsearchOperations) {
        this.elasticsearchOperations = elasticsearchOperations;
        IndexOperations indexOperations = elasticsearchOperations.indexOps(UserIndex.class);
        if (!indexOperations.exists()) indexOperations.createWithMapping();
    }

    @Override
    public void save(User user) {
        elasticsearchOperations.save(UserIndex.fromUser(user));
        elasticsearchOperations.indexOps(UserIndex.class).refresh();
    }

    @Override
    public void deleteById(String userId) {
        elasticsearchOperations.delete(userId, UserIndex.class);
        elasticsearchOperations.indexOps(UserIndex.class).refresh();
    }

    @Override
    public Page<User> searchUsers(String query, Pageable pageable) {
        String q = toJson(Map.of("bool", Map.of("should", List.of(
                Map.of("term", Map.of("id", Map.of("value", query))),
                Map.of("term", Map.of("email", Map.of("value", query))),
                Map.of("match", Map.of("name", Map.of("query", query)))
        ))));
        List<UserIndex> result = elasticsearchOperations.search(new StringQuery(q), UserIndex.class)
                .getSearchHits().stream()
                .map(SearchHit::getContent)
                .toList();
        return new PageImpl<>(result, pageable, result.size())
                .map(UserIndex::getUser);
    }

    private String toJson(Map<String, Object> map) {
        try {
            return new ObjectMapper().writeValueAsString(map);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean exists(String userId) {
        return elasticsearchOperations.exists(userId, UserIndex.class);
    }
}
