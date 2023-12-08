package tms.entities.task.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;

public interface TaskService {

    Task save(Task task);

    void delete(Task task);

    Task getById(Long taskId);

    Page<Task> getAll(Pageable pageable);

    Page<Task> getAllByUser(String user, Pageable pageable);

    Page<Task> getAllByEmployee(String employee, Pageable pageable);

    Page<Task> getAllByStatus(TaskStatus status, Pageable pageable);

    Page<Task> getAllByPriority(TaskPriority priority, Pageable pageable);
}
