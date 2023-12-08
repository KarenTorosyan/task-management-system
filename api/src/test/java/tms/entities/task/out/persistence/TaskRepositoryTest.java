package tms.entities.task.out.persistence;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import tms.DataJpaContainerTest;
import tms.entities.task.Task;
import tms.entities.task.TaskEmployee;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;

import static org.assertj.core.api.Assertions.assertThat;

@DisplayName("TaskRepository should")
@DataJpaContainerTest
public class TaskRepositoryTest {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private TaskEmployeeRepository taskEmployeeRepository;

    @DisplayName("save task")
    @Test
    void shouldSaveTask() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.existsById(task.getId()))
                .isTrue();
        taskRepository.delete(task);
    }

    @DisplayName("delete task")
    @Test
    void deleteTaskById() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.existsById(task.getId()))
                .isTrue();
        taskRepository.delete(task);
        assertThat(taskRepository.existsById(task.getId()))
                .isFalse();
    }

    @DisplayName("load task by id when exists")
    @Test
    void shouldLoadTaskByIdWhenExists() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.findById(task.getId()))
                .contains(task);
        taskRepository.delete(task);
    }

    @DisplayName("load empty when task by id not exists")
    @Test
    void shouldLoadEmptyWhenTaskByIdNotExists() {
        assertThat(taskRepository.findById(1L))
                .isEmpty();
    }

    @DisplayName("load tasks")
    @Test
    void shouldLoadTasks() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.findAll(Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        taskRepository.delete(task);
    }

    @DisplayName("load user tasks")
    @Test
    void shouldLoadUserTasks() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.findAllByUser(task.getUser(), Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        taskRepository.delete(task);
    }

    @DisplayName("load employee tasks")
    @Test
    void shouldLoadEmployeeTasks() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        TaskEmployee taskEmployee = taskEmployeeRepository.save(new TaskEmployee()
                .setEmployee("employee")
                .setTask(task));
        assertThat(taskRepository.findAllByEmployeesEmployee(taskEmployee.getEmployee(), Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        taskRepository.delete(task);
        taskRepository.flush();
        assertThat(taskEmployeeRepository.existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee()))
                .isFalse();
    }

    @DisplayName("load tasks by status")
    @Test
    void shouldLoadTasksByStatus() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.findAllByStatus(TaskStatus.PENDING, Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        taskRepository.delete(task);
    }

    @DisplayName("load tasks by priority")
    @Test
    void shouldLoadTasksByPriority() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        assertThat(taskRepository.findAllByPriority(TaskPriority.HIGH, Pageable.unpaged()))
                .hasSize(1)
                .contains(task);
        taskRepository.delete(task);
    }
}
