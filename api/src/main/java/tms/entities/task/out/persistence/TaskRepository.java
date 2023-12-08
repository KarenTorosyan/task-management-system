package tms.entities.task.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;

public interface TaskRepository extends JpaRepository<Task, Long> {

    Page<Task> findAllByUser(String user, Pageable pageable);

    Page<Task> findAllByEmployeesEmployee(String employee, Pageable pageable);

    Page<Task> findAllByStatus(TaskStatus status, Pageable pageable);

    Page<Task> findAllByPriority(TaskPriority priority, Pageable pageable);
}
