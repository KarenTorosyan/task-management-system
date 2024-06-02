package tms.entities.task.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tms.entities.task.TaskEmployee;
import tms.entities.task.out.persistence.TaskEmployeeRepository;
import tms.errors.Errors;

@Service
@RequiredArgsConstructor
public class TaskEmployeeService {

    private final TaskEmployeeRepository taskEmployeeRepository;

    @Transactional
    public void add(TaskEmployee taskEmployee) {
        if (!has(taskEmployee.getTask().getId(), taskEmployee.getEmployee())) {
            taskEmployeeRepository.save(taskEmployee);
        } else throw Errors.taskEmployeeDuplicate(taskEmployee);
    }

    @Transactional
    public void delete(TaskEmployee taskEmployee) {
        taskEmployeeRepository.delete(taskEmployee);
    }

    @Transactional(readOnly = true)
    public TaskEmployee get(Long taskId, String employee) {
        return taskEmployeeRepository.findByTaskIdAndEmployee(taskId, employee)
                .orElseThrow(() -> Errors.taskEmployeeNotFound(taskId, employee));
    }

    @Transactional(readOnly = true)
    public boolean has(Long taskId, String employee) {
        return taskEmployeeRepository.existsByTaskIdAndEmployee(taskId, employee);
    }

    @Transactional(readOnly = true)
    public Page<TaskEmployee> getAll(Long taskId, Pageable pageable) {
        return taskEmployeeRepository.findAllByTaskId(taskId, pageable);
    }
}
