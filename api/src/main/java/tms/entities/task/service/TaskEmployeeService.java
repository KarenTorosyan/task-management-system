package tms.entities.task.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.entities.task.TaskEmployee;

public interface TaskEmployeeService {

    void add(TaskEmployee taskEmployee);

    void delete(TaskEmployee taskEmployee);

    TaskEmployee get(Long taskId, String employee);

    boolean has(Long taskId, String employee);

    Page<TaskEmployee> getAll(Long taskId, Pageable pageable);
}
