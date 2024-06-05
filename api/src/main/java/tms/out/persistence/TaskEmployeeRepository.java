package tms.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.model.TaskEmployee;

public interface TaskEmployeeRepository extends JpaRepository<TaskEmployee, Long> {

    Page<TaskEmployee> findAllByTaskId(Long taskId, Pageable pageable);

    boolean existsByTaskIdAndEmployee(Long taskId, String employee);
}
