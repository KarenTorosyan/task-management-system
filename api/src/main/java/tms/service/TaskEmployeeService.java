package tms.service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import tms.model.Task;
import tms.model.TaskEmployee;
import tms.out.persistence.TaskEmployeeRepository;
import tms.exception.EntityConflictException;
import tms.exception.EntityNotFoundException;

@Service
@Validated
@RequiredArgsConstructor
public class TaskEmployeeService {

    private final TaskEmployeeRepository taskEmployeeRepository;

    @PreAuthorize("isAuthenticated() and #taskEmployee.task.user eq authentication.name")
    @Transactional
    public void add(@Valid TaskEmployee taskEmployee) {
        if (!has(taskEmployee.getTask().getId(), taskEmployee.getEmployee())) {
            taskEmployeeRepository.save(taskEmployee);
        } else throw new EntityConflictException("Duplicate employee", "duplicate_employee", taskEmployee);
    }

    @PreAuthorize("isAuthenticated() and #taskEmployee.task.user eq authentication.name")
    @Transactional
    public void delete(TaskEmployee taskEmployee) {
        taskEmployeeRepository.delete(taskEmployee);
    }

    @Transactional(readOnly = true)
    public TaskEmployee getById(Long employeeId) {
        return taskEmployeeRepository.findById(employeeId)
                .orElseThrow(() -> new EntityNotFoundException("Employee not found", "employee_not_found", employeeId));
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
