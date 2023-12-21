package tms.entities.task.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.ContextConfiguration;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;
import tms.entities.task.out.index.TaskSearchRepository;
import tms.entities.task.out.persistence.TaskRepository;
import tms.errors.EntityNotFoundException;
import tms.errors.Errors;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest
@ContextConfiguration(classes = TaskServiceImpl.class)
@DisplayName("TaskServiceImpl should")
public class TaskServiceImplTest {

    @Autowired
    private TaskServiceImpl taskService;

    @MockBean
    private TaskRepository taskRepository;

    @MockBean
    private TaskSearchRepository taskSearchRepository;

    @DisplayName("save task")
    @Test
    void shouldSaveTask() {
        Task task = new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        given(taskRepository.save(task))
                .willReturn(task);
        taskService.save(task);
        verify(taskRepository).save(task);
    }

    @DisplayName("delete task")
    @Test
    void shouldDeleteTask() {
        Task task = new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        taskService.delete(task);
        verify(taskRepository).delete(task);
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
        assertThat(taskService.getById(task.getId()))
                .isEqualTo(task);
        verify(taskRepository).findById(task.getId());
    }

    @DisplayName("handle error when get task by id when not found")
    @Test
    void shouldHandleErrorWhenGetTaskByIdWhenNotFound() {
        Long taskId = 1L;
        given(taskRepository.findById(taskId))
                .willThrow(Errors.taskNotFound(taskId));
        assertThatThrownBy(() -> taskService.getById(taskId))
                .isInstanceOf(EntityNotFoundException.class);
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
        assertThat(taskService.getAll(pageable))
                .hasSize(1)
                .contains(task);
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
        assertThat(taskService.getAllByUser(task.getUser(), pageable))
                .hasSize(1)
                .contains(task);
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
        assertThat(taskService.getAllByEmployee(employee, pageable))
                .hasSize(1)
                .contains(task);
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
        assertThat(taskService.getAllByStatus(task.getStatus(), pageable))
                .hasSize(1)
                .contains(task);
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
        assertThat(taskService.getAllByPriority(task.getPriority(), pageable))
                .hasSize(1)
                .contains(task);
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
        assertThat(taskService.getAllByQuery(task.getTitle(), pageable))
                .hasSize(1)
                .contains(task);
        verify(taskSearchRepository).findAllByQuery(task.getTitle(), pageable);
    }
}
