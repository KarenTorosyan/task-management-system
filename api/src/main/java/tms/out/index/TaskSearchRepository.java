package tms.out.index;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.model.Task;

public interface TaskSearchRepository {

    void save(Task task);

    void deleteById(Long taskId);

    Page<Task> findAllByQuery(String query, Pageable pageable);
}
