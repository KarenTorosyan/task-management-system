package tms.entities.task.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;
import tms.entities.task.out.persistence.TaskRepository;
import tms.errors.Errors;

@Service
@RequiredArgsConstructor
public class TaskServiceImpl implements TaskService {

    private final TaskRepository taskRepository;

    @Transactional
    @Override
    public Task save(Task task) {
        return taskRepository.save(task);
    }

    @Transactional
    @Override
    public void delete(Task task) {
        taskRepository.delete(task);
    }

    @Transactional(readOnly = true)
    @Override
    public Task getById(Long taskId) {
        return taskRepository.findById(taskId)
                .orElseThrow(() -> Errors.taskNotFound(taskId));
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Task> getAll(Pageable pageable) {
        return taskRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Task> getAllByUser(String user, Pageable pageable) {
        return taskRepository.findAllByUser(user, pageable);
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Task> getAllByEmployee(String employee, Pageable pageable) {
        return taskRepository.findAllByEmployeesEmployee(employee, pageable);
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Task> getAllByStatus(TaskStatus status, Pageable pageable) {
        return taskRepository.findAllByStatus(status, pageable);
    }

    @Transactional(readOnly = true)
    @Override
    public Page<Task> getAllByPriority(TaskPriority priority, Pageable pageable) {
        return taskRepository.findAllByPriority(priority, pageable);
    }
}
