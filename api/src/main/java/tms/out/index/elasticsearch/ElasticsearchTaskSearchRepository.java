package tms.out.index.elasticsearch;

import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch._types.query_dsl.QueryBuilders;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.client.elc.NativeQueryBuilder;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.IndexOperations;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.stereotype.Component;
import tms.model.Task;
import tms.out.index.TaskSearchRepository;
import tms.exception.SortConflictException;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ElasticsearchTaskSearchRepository implements TaskSearchRepository {

    private final ElasticsearchOperations elasticsearchOperations;

    @PostConstruct
    private void createIndexWithMapping() {
        IndexOperations indexOperations = elasticsearchOperations.indexOps(TaskDocument.class);
        if (!indexOperations.exists()) indexOperations.createWithMapping();
    }

    @Override
    public void save(Task task) {
        elasticsearchOperations.save(TaskDocument.from(task));
        elasticsearchOperations.indexOps(TaskDocument.class).refresh();
    }

    @Override
    public void deleteById(Long taskId) {
        elasticsearchOperations.delete(String.valueOf(taskId), TaskDocument.class);
        elasticsearchOperations.indexOps(TaskDocument.class).refresh();
    }

    @Override
    public Page<Task> findAllByQuery(String query, Pageable pageable) {
        handleSortConstrains(pageable.getSort());
        Query boolQuery = QueryBuilders.bool(bool -> bool
                .should(QueryBuilders.fuzzy(fuzzy -> fuzzy.field("title").value(query)))
                .should(QueryBuilders.match(match -> match.field("description").query(query)))
                .should(QueryBuilders.term(term -> term.field("status").value(query).caseInsensitive(true)))
                .should(QueryBuilders.term(term -> term.field("priority").value(query).caseInsensitive(true)))
                .should(QueryBuilders.term(term -> term.field("user").value(query).caseInsensitive(true))));
        NativeQuery nativeQuery = new NativeQueryBuilder()
                .withQuery(boolQuery)
                .withPageable(pageable)
                .build();
        SearchHits<TaskDocument> hits = elasticsearchOperations.search(nativeQuery, TaskDocument.class);
        List<Task> tasks = hits.getSearchHits().stream()
                .map(hit -> hit.getContent().getTask())
                .toList();
        return new PageImpl<>(tasks, pageable, hits.getTotalHits());
    }

    private void handleSortConstrains(Sort sort) {
        sort.stream().forEach(order -> {
            switch (order.getProperty()) {
                case "title", "status", "priority", "user" -> {
                }
                case "description" -> {
                    String message = "Text search fields are not sortable";
                    throw new SortConflictException(message, "illegal_sort_property", order.getProperty(), message);
                }
                default -> {
                    String message = "Invalid sort field";
                    throw new SortConflictException(message, "invalid_sort_field", order.getProperty());
                }
            }
        });
    }
}
