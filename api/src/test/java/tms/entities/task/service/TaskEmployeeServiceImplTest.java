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
import tms.entities.task.TaskEmployee;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;
import tms.entities.task.out.persistence.TaskEmployeeRepository;
import tms.errors.EntityConflictException;
import tms.errors.EntityNotFoundException;
import tms.errors.Errors;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest
@ContextConfiguration(classes = TaskEmployeeServiceImpl.class)
@DisplayName("TaskEmployeeServiceImpl should")
public class TaskEmployeeServiceImplTest {

    @Autowired
    private TaskEmployeeServiceImpl taskEmployeeService;

    @MockBean
    private TaskEmployeeRepository taskEmployeeRepository;

    @DisplayName("add employee when not found")
    @Test
    void shouldAddEmployeeWhenNotFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        given(taskEmployeeRepository.save(taskEmployee))
                .willReturn(taskEmployee);
        taskEmployeeService.add(taskEmployee);
        verify(taskEmployeeRepository).save(taskEmployee);
    }

    @DisplayName("handle error when add employee when employee duplicated")
    @Test
    void shouldHandleErrorWhenAddEmployeeWhenEmployeeDuplicated() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        given(taskEmployeeRepository.save(taskEmployee))
                .willThrow(Errors.taskEmployeeDuplicate(taskEmployee));
        assertThatThrownBy(() -> taskEmployeeService.add(taskEmployee))
                .isInstanceOf(EntityConflictException.class);
    }

    @DisplayName("delete employee when found")
    @Test
    void shouldDeleteEmployeeWhenFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        taskEmployeeService.delete(taskEmployee);
        verify(taskEmployeeRepository).delete(taskEmployee);
    }

    @DisplayName("get employee when found")
    @Test
    void getEmployeeWhenFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        given(taskEmployeeRepository.findByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee()))
                .willReturn(Optional.of(taskEmployee));
        assertThat(taskEmployeeService.get(task.getId(), taskEmployee.getEmployee()))
                .isEqualTo(taskEmployee);
        verify(taskEmployeeRepository).findByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee());
    }

    @DisplayName("handle error when get employee when employee not found")
    @Test
    void shouldHandleErrorWhenGetEmployeeWhenEmployeeNotFound() {
        Long taskId = 1L;
        String employee = "employee";
        given(taskEmployeeRepository.findByTaskIdAndEmployee(taskId, employee))
                .willReturn(Optional.empty());
        assertThatThrownBy(() -> taskEmployeeService.get(taskId, employee))
                .isInstanceOf(EntityNotFoundException.class);
        verify(taskEmployeeRepository).findByTaskIdAndEmployee(taskId, employee);
    }

    @DisplayName("return true when employee found")
    @Test
    void shouldReturnTrueWhenEmployeeFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        given(taskEmployeeRepository.existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee()))
                .willReturn(true);
        assertThat(taskEmployeeService.has(task.getId(), taskEmployee.getEmployee()))
                .isTrue();
        verify(taskEmployeeRepository).existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee());
    }

    @DisplayName("return false when employee found")
    @Test
    void shouldReturnFalseWhenEmployeeNotFound() {
        Long taskId = 1L;
        String employee = "employee";
        given(taskEmployeeRepository.existsByTaskIdAndEmployee(taskId, employee))
                .willReturn(false);
        assertThat(taskEmployeeService.has(taskId, employee))
                .isFalse();
        verify(taskEmployeeRepository).existsByTaskIdAndEmployee(taskId, employee);
    }

    @DisplayName("get all employees")
    @Test
    void shouldGetAllEmployees() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        Pageable pageable = Pageable.unpaged();
        given(taskEmployeeRepository.findAllByTaskId(task.getId(), pageable))
                .willReturn(new PageImpl<>(List.of(taskEmployee)));
        assertThat(taskEmployeeService.getAll(task.getId(), pageable))
                .hasSize(1)
                .contains(taskEmployee);
        verify(taskEmployeeRepository).findAllByTaskId(task.getId(), pageable);
    }
}
