package tms.entities.task.out.index;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.entities.task.Task;

public interface TaskSearchRepository {

    void save(Task task);

    void deleteById(Long taskId);

    Page<Task> findAllByQuery(String query, Pageable pageable);
}
