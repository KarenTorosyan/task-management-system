package tms.entities.task.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tms.cache.CacheService;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;
import tms.entities.task.out.index.TaskSearchRepository;
import tms.entities.task.out.persistence.TaskRepository;
import tms.errors.Errors;

@Service
@RequiredArgsConstructor
public class TaskService {

    public static final String CacheName = "task";

    private final TaskRepository taskRepository;
    private final TaskSearchRepository taskSearchRepository;
    private final CacheService cacheService;

    @Transactional
    public Task save(Task task) {
        Task savedTask = taskRepository.save(task);
        taskSearchRepository.save(savedTask);
        cacheService.putCache(CacheName, savedTask.getId(), savedTask);
        return savedTask;
    }

    @Transactional
    public void delete(Task task) {
        taskRepository.delete(task);
        taskSearchRepository.deleteById(task.getId());
        cacheService.evict(CacheName, task.getId());
    }

    @Transactional(readOnly = true)
    public Task getById(Long taskId) {
        return cacheService.getCache(CacheName, taskId, Task.class)
                .orElseGet(() -> {
                    Task task = taskRepository.findById(taskId)
                            .orElseThrow(() -> Errors.taskNotFound(taskId));
                    cacheService.putCache(CacheName, task.getId(), task);
                    return task;
                });
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
