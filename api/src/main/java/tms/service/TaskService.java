package tms.service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import tms.exception.EntityNotFoundException;
import tms.model.Task;
import tms.model.TaskPriority;
import tms.model.TaskStatus;
import tms.out.index.TaskSearchRepository;
import tms.out.persistence.TaskRepository;

@Service
@CacheConfig(cacheNames = "task")
@Validated
@RequiredArgsConstructor
public class TaskService {

    private final TaskRepository taskRepository;
    private final TaskSearchRepository taskSearchRepository;
    private final SecurityContextHolderStrategy strategy = SecurityContextHolder.getContextHolderStrategy();

    @PreAuthorize("isAuthenticated()")
    @CachePut(key = "#task.id")
    @Transactional
    public Task create(@Valid Task task) {
        Task ready = taskRepository.save(task.setUser(strategy.getContext().getAuthentication().getName()));
        taskSearchRepository.save(ready);
        return ready;
    }

    @PreAuthorize("isAuthenticated() and #task.user eq authentication.name")
    @CachePut(key = "#task.id")
    @Transactional
    public Task edit(@Valid Task task) {
        Task ready = taskRepository.save(task);
        taskSearchRepository.save(ready);
        return ready;
    }

    @PreAuthorize("isAuthenticated() and #task.user eq authentication.name")
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
                .orElseThrow(() -> new EntityNotFoundException("The task not found!", "task_not_found", taskId));
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
