package tms.entities.task.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.entities.task.TaskEmployee;

import java.util.Optional;

public interface TaskEmployeeRepository extends JpaRepository<TaskEmployee, Long> {

    Page<TaskEmployee> findAllByTaskId(Long taskId, Pageable pageable);

    Optional<TaskEmployee> findByTaskIdAndEmployee(Long taskId, String employee);

    boolean existsByTaskIdAndEmployee(Long taskId, String employee);
}
