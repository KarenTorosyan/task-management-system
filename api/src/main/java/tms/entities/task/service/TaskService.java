package tms.entities.task.service;

import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;
import tms.entities.task.out.index.TaskSearchRepository;
import tms.entities.task.out.persistence.TaskRepository;
import tms.errors.Errors;

@Service
@CacheConfig(cacheNames = "task")
@RequiredArgsConstructor
public class TaskService {

    private final TaskRepository taskRepository;
    private final TaskSearchRepository taskSearchRepository;

    @CachePut(key = "#task.id")
    @Transactional
    public Task save(Task task) {
        Task savedTask = taskRepository.save(task);
        taskSearchRepository.save(savedTask);
        return savedTask;
    }

    @Transactional
    @CacheEvict(key = "#task.id")
    public void delete(Task task) {
        taskRepository.delete(task);
        taskSearchRepository.deleteById(task.getId());
    }

    @Transactional(readOnly = true)
    @Cacheable(key = "#taskId")
    public Task getById(Long taskId) {
        return taskRepository.findById(taskId)
                .orElseThrow(() -> Errors.taskNotFound(taskId));
    }

    @Transactional(readOnly = true)
    public Page<Task> getAll(Pageable pageable) {
        return taskRepository.findAll(pageable);
    }

    @Transactional(readOnly = true)
    public Page<Task> getAllByUser(String user, Pageable pageable) {
        return taskRepository.findAllByUser(user, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Task> getAllByEmployee(String employee, Pageable pageable) {
        return taskRepository.findAllByEmployeesEmployee(employee, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Task> getAllByStatus(TaskStatus status, Pageable pageable) {
        return taskRepository.findAllByStatus(status, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Task> getAllByPriority(TaskPriority priority, Pageable pageable) {
        return taskRepository.findAllByPriority(priority, pageable);
    }

    @Transactional(readOnly = true)
    public Page<Task> getAllByQuery(String query, Pageable pageable) {
        return taskSearchRepository.findAllByQuery(query, pageable);
    }
}
