package tms.out.index.elasticsearch;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.elasticsearch.DataElasticsearchTest;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import tms.DataElasticsearchContainerTest;
import tms.exception.SortConflictException;
import tms.model.Task;
import tms.model.TaskPriority;
import tms.model.TaskStatus;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@DataElasticsearchTest
@Import(ElasticsearchTaskSearchRepository.class)
@DisplayName("ElasticSearchTaskSearchRepository should")
public class ElasticsearchTaskSearchRepositoryTest extends DataElasticsearchContainerTest {

    @Autowired
    private ElasticsearchTaskSearchRepository elasticSearchTaskSearchRepository;

    @DisplayName("save task document to index")
    @Test
    void shouldSaveTaskDocumentToIndex() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        elasticSearchTaskSearchRepository.save(task);
        assertThat(elasticSearchTaskSearchRepository.findAllByQuery(task.getTitle(), Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        elasticSearchTaskSearchRepository.deleteById(task.getId());
    }

    @DisplayName("delete task document from index")
    @Test
    void shouldDeleteTaskDocumentFromIndex() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        elasticSearchTaskSearchRepository.save(task);
        assertThat(elasticSearchTaskSearchRepository.findAllByQuery(task.getTitle(), Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        elasticSearchTaskSearchRepository.deleteById(task.getId());
        assertThat(elasticSearchTaskSearchRepository.findAllByQuery(task.getTitle(), Pageable.unpaged()))
                .hasSize(0);
    }

    @DisplayName("load tasks by query and sort result")
    @Test
    void shouldLoadTasksByQueryAndSortResult() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("find me")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        elasticSearchTaskSearchRepository.save(task);
        Pageable pageable = PageRequest.of(0, 1).withSort(Sort.by("title"));
        assertThat(elasticSearchTaskSearchRepository.findAllByQuery("find", pageable))
                .hasSize(1)
                .contains(task);
        elasticSearchTaskSearchRepository.deleteById(task.getId());
    }

    @DisplayName("throw error when load tasks by query and sort result when sort field is text search field")
    @Test
    void shouldThrowErrorWhenLoadTasksByQueryWithSortResultAndSortFieldIsTextSearchField() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("find me")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        elasticSearchTaskSearchRepository.save(task);
        Pageable pageable = PageRequest.of(0, 1).withSort(Sort.by("description"));
        assertThatThrownBy(() -> elasticSearchTaskSearchRepository.findAllByQuery("me", pageable))
                .isInstanceOf(SortConflictException.class);
    }

    @DisplayName("throw error when load tasks by query and sort result when sort field is undefined in document")
    @Test
    void shouldThrowErrorWhenLoadTasksByQueryWithSortResultAndSortFieldIsUndefinedInDocument() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        elasticSearchTaskSearchRepository.save(task);
        Pageable pageable = PageRequest.of(0, 1).withSort(Sort.by("undefined"));
        assertThatThrownBy(() -> elasticSearchTaskSearchRepository.findAllByQuery(task.getStatus().toString(), pageable))
                .isInstanceOf(SortConflictException.class);
    }
}
