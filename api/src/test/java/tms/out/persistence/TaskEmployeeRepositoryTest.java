package tms.out.persistence;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import tms.DataJpaContainerTest;
import tms.model.Task;
import tms.model.TaskEmployee;
import tms.model.TaskPriority;
import tms.model.TaskStatus;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaContainerTest
@DisplayName("TaskEmployeeRepository should")
public class TaskEmployeeRepositoryTest {

    @Autowired
    private TaskEmployeeRepository taskEmployeeRepository;

    @Autowired
    private TaskRepository taskRepository;

    @DisplayName("add employee")
    @Test
    void shouldAddEmployee() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user"));
        TaskEmployee taskEmployee = new TaskEmployee()
                .setEmployee("employee")
                .setTask(task);
        taskEmployeeRepository.save(taskEmployee);
        assertThat(taskEmployeeRepository.findAllByTaskId(task.getId(), Pageable.unpaged()).getContent())
                .hasSize(1)
                .contains(taskEmployee);
        taskRepository.delete(task);
    }

    @DisplayName("delete employee")
    @Test
    void shouldDeleteEmployee() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user"));
        TaskEmployee taskEmployee = new TaskEmployee()
                .setEmployee("employee")
                .setTask(task);
        taskEmployeeRepository.save(taskEmployee);
        assertThat(taskEmployeeRepository.findAllByTaskId(task.getId(), Pageable.unpaged()).getContent())
                .hasSize(1)
                .contains(taskEmployee);
        taskEmployeeRepository.delete(taskEmployee);
        assertThat(taskEmployeeRepository.findAllByTaskId(task.getId(), Pageable.unpaged()).getContent())
                .hasSize(0);
        taskRepository.delete(task);
    }

    @DisplayName("load employees")
    @Test
    void shouldLoadEmployees() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user"));
        TaskEmployee taskEmployee = new TaskEmployee()
                .setEmployee("employee")
                .setTask(task);
        taskEmployeeRepository.save(taskEmployee);
        assertThat(taskEmployeeRepository.findAllByTaskId(task.getId(), Pageable.unpaged()).getContent())
                .hasSize(1)
                .contains(taskEmployee);
        taskRepository.delete(task);
    }

    @DisplayName("load employee by id when exists")
    @Test
    void shouldLoadEmployeeByIdWhenExists() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user"));
        TaskEmployee taskEmployee = new TaskEmployee()
                .setEmployee("employee")
                .setTask(task);
        TaskEmployee ready = taskEmployeeRepository.save(taskEmployee);
        assertThat(taskEmployeeRepository.findById(ready.getId()))
                .contains(taskEmployee);
        taskRepository.delete(task);
    }

    @DisplayName("load empty when employee by id not exists")
    @Test
    void shouldLoadEmptyWhenEmployeeNotExists() {
        assertThat(taskEmployeeRepository.findById(1L))
                .isEmpty();
    }

    @DisplayName("return true when employee exists")
    @Test
    void shouldReturnTrueWhenEmployeeExists() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user"));
        TaskEmployee taskEmployee = taskEmployeeRepository.save(new TaskEmployee()
                .setEmployee("employee")
                .setTask(task));
        assertThat(taskEmployeeRepository.existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee()))
                .isTrue();
        taskRepository.delete(task);
    }

    @DisplayName("return false when employee exists")
    @Test
    void shouldReturnFalseWhenEmployeeNotExists() {
        assertThat(taskEmployeeRepository.existsByTaskIdAndEmployee(1L, "employee"))
                .isFalse();
    }
}
