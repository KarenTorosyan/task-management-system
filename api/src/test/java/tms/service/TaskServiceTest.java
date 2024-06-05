package tms.service;

import jakarta.validation.ConstraintViolationException;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.validation.ValidationAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import tms.exception.EntityNotFoundException;
import tms.model.Task;
import tms.model.TaskPriority;
import tms.model.TaskStatus;
import tms.out.index.TaskSearchRepository;
import tms.out.persistence.TaskRepository;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest(classes = {
        TaskService.class,
        ValidationAutoConfiguration.class,
})
@EnableMethodSecurity
@DisplayName("TaskService should")
public class TaskServiceTest {

    @Autowired
    private TaskService taskService;

    @MockBean
    private TaskRepository taskRepository;

    @MockBean
    private TaskSearchRepository taskSearchRepository;

    @WithMockUser
    @DisplayName("create a task when the client is authenticated")
    @Test
    void shouldCreateTaskWhenClientIsAuthenticated() {
        Task task = new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM);
        given(taskRepository.save(task))
                .willReturn(task);
        taskService.create(task);
        verify(taskRepository).save(task);
        verify(taskSearchRepository).save(task);
    }

    @WithAnonymousUser
    @DisplayName("throw access denied exception on creating a task when the client is not authenticated")
    @Test
    void shouldThrowAccessDeniedExceptionOnCreatingTaskWhenClientIsNotAuthenticated() {
        assertThrows(AccessDeniedException.class, () -> taskService.create(new Task()));
    }

    @WithMockUser
    @DisplayName("throw validation exception on creating a task when data is invalid")
    @Test
    void shouldThrowValidationExceptionOnCreatingTaskWhenDataIsInvalid() {
        assertThrows(ConstraintViolationException.class, () -> taskService.create(new Task()));
    }

    @WithMockUser
    @DisplayName("edit a task when the client is the task author")
    @Test
    void shouldEditTaskWhenClientIsTaskAuthor() {
        Task task = new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        given(taskRepository.save(task))
                .willReturn(task);
        taskService.edit(task);
        verify(taskRepository).save(task);
        verify(taskSearchRepository).save(task);
    }

    @WithMockUser
    @DisplayName("throw access denied exception on edit task when the client is not the task author")
    @Test
    void shouldThrowAccessDeniedExceptionOnEditTaskWhenClientIsNotTaskAuthor() {
        assertThrows(AccessDeniedException.class, () -> taskService.edit(new Task()
                .setUser("some user")));
    }

    @WithMockUser
    @DisplayName("throw validation exception on edit task when data is invalid")
    @Test
    void shouldThrowValidationExceptionOnEditTaskWhenDataIsInvalid() {
        assertThrows(ConstraintViolationException.class, () -> taskService.edit(new Task()
                .setUser("user")));
    }

    @WithMockUser
    @DisplayName("delete task when the client is the task author")
    @Test
    void shouldDeleteTaskWhenClientIsTaskAuthor() {
        Task task = new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        taskService.delete(task);
        verify(taskRepository).delete(task);
        verify(taskSearchRepository).deleteById(task.getId());
    }

    @WithMockUser
    @DisplayName("throw access denied exception on delete task when the client is not the task author")
    @Test
    void shouldThrowAccessDeniedExceptionOnDeleteTaskWhenClientIsNotTaskAuthor() {
        assertThrows(AccessDeniedException.class, () -> taskService.delete(new Task()
                .setUser("some user")));
    }

    @DisplayName("get task by id when found")
    @Test
    void shouldGetTaskByIdWhenFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        given(taskRepository.findById(task.getId()))
                .willReturn(Optional.of(task));
        assertEquals(taskService.getById(task.getId()), task);
        verify(taskRepository).findById(task.getId());
    }

    @DisplayName("throw not found exception on getting task by id when not found")
    @Test
    void shouldThrowNotFoundExceptionOnGettingTaskByIdWhenNotFound() {
        Long taskId = 1L;
        given(taskRepository.findById(taskId))
                .willReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> taskService.getById(taskId));
    }

    @DisplayName("get all tasks")
    @Test
    void shouldGetAllTasks() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskRepository.findAll(pageable))
                .willReturn(new PageImpl<>(List.of(task)));
        List<Task> content = taskService.getAll(pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(task));
        verify(taskRepository).findAll(pageable);
    }

    @DisplayName("get user tasks")
    @Test
    void shouldGetUserTasks() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskRepository.findAllByUser(task.getUser(), pageable))
                .willReturn(new PageImpl<>(List.of(task)));
        List<Task> content = taskService.getAllByUser(task.getUser(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(task));
        verify(taskRepository).findAllByUser(task.getUser(), pageable);
    }

    @DisplayName("get employee tasks")
    @Test
    void shouldGetEmployeeTasks() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        String employee = "employee";
        given(taskRepository.findAllByEmployeesEmployee(employee, pageable))
                .willReturn(new PageImpl<>(List.of(task)));
        List<Task> content = taskService.getAllByEmployee(employee, pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(task));
        verify(taskRepository).findAllByEmployeesEmployee(employee, pageable);
    }

    @DisplayName("get tasks by status")
    @Test
    void shouldGetTasksByStatus() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskRepository.findAllByStatus(task.getStatus(), pageable))
                .willReturn(new PageImpl<>(List.of(task)));
        List<Task> content = taskService.getAllByStatus(task.getStatus(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(task));
        verify(taskRepository).findAllByStatus(task.getStatus(), pageable);
    }

    @DisplayName("get tasks by priority")
    @Test
    void shouldGetTasksByPriority() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskRepository.findAllByPriority(task.getPriority(), pageable))
                .willReturn(new PageImpl<>(List.of(task)));
        List<Task> content = taskService.getAllByPriority(task.getPriority(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(task));
        verify(taskRepository).findAllByPriority(task.getPriority(), pageable);
    }

    @DisplayName("get tasks by query")
    @Test
    void shouldGetTasksByQuery() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskSearchRepository.findAllByQuery(task.getTitle(), pageable))
                .willReturn(new PageImpl<>(List.of(task)));
        List<Task> content = taskService.getAllByQuery(task.getTitle(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(task));
        verify(taskSearchRepository).findAllByQuery(task.getTitle(), pageable);
    }
}
