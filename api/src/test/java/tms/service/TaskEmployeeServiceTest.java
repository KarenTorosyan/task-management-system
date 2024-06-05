package tms.service;

import jakarta.validation.ConstraintViolationException;
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
import org.springframework.security.test.context.support.WithMockUser;
import tms.exception.EntityConflictException;
import tms.exception.EntityNotFoundException;
import tms.model.Task;
import tms.model.TaskEmployee;
import tms.model.TaskPriority;
import tms.model.TaskStatus;
import tms.out.persistence.TaskEmployeeRepository;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest(classes = {
        TaskEmployeeService.class,
        ValidationAutoConfiguration.class
})
@EnableMethodSecurity
@DisplayName("TaskEmployeeService should")
public class TaskEmployeeServiceTest {

    @Autowired
    private TaskEmployeeService taskEmployeeService;

    @MockBean
    private TaskEmployeeRepository taskEmployeeRepository;

    @WithMockUser
    @DisplayName("add an employee when not found and the client is the task author")
    @Test
    void shouldAddEmployeeWhenNotFoundAndClientIsTaskAuthor() {
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
                .willReturn(false);
        given(taskEmployeeRepository.save(taskEmployee))
                .willReturn(taskEmployee);
        taskEmployeeService.add(taskEmployee);
        verify(taskEmployeeRepository).existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee());
        verify(taskEmployeeRepository).save(taskEmployee);
    }

    @WithMockUser
    @DisplayName("throw employee duplicate exception when the employee already exists")
    @Test
    void shouldThrowEmployeeDuplicateExceptionWhenEmployeeAlreadyExists() {
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
        assertThrows(EntityConflictException.class, () -> taskEmployeeService.add(taskEmployee));
        verify(taskEmployeeRepository).existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee());
    }

    @WithMockUser
    @DisplayName("throw access denied exception on adding an employee when the client is not the task author")
    @Test
    void shouldThrowAccessDeniedExceptionOnAddingEmployeeWhenClientIsNotTaskAuthor() {
        assertThrows(AccessDeniedException.class, () -> taskEmployeeService.add(new TaskEmployee()
                .setTask(new Task().setUser("some user"))));
    }

    @WithMockUser
    @DisplayName("throw validation exception on adding an employee when data is invalid")
    @Test
    void shouldThrowValidationExceptionOnAddingEmployeeWhenDataIsInvalid() {
        assertThrows(ConstraintViolationException.class, () -> taskEmployeeService.add(new TaskEmployee()
                .setTask(new Task().setUser("user"))));
    }

    @WithMockUser
    @DisplayName("delete an employee when found and the client is a task author")
    @Test
    void shouldDeleteEmployeeWhenFoundAndClientIsTaskAuthor() {
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

    @WithMockUser
    @DisplayName("throw access denied exception on delete an employee when the client is not a task author")
    @Test
    void shouldThrowAccessDeniedExceptionOnDeleteEmployeeWhenClientIsNotTaskAuthor() {
        assertThrows(AccessDeniedException.class, () -> taskEmployeeService.delete(new TaskEmployee()
                .setTask(new Task().setUser("some user"))));
    }

    @DisplayName("get employee when found")
    @Test
    void shouldGetEmployeeWhenFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setId(1L)
                .setTask(task)
                .setEmployee("employee");
        given(taskEmployeeRepository.findById(taskEmployee.getId()))
                .willReturn(Optional.of(taskEmployee));
        assertEquals(taskEmployeeService.getById(taskEmployee.getId()), taskEmployee);
        verify(taskEmployeeRepository).findById(taskEmployee.getId());
    }

    @DisplayName("throw not found exception on getting an employee when not found")
    @Test
    void shouldThrowNotFoundExceptionOnGettingEmployeeWhenNotFound() {
        Long taskEmployeeId = 1L;
        given(taskEmployeeRepository.findById(taskEmployeeId))
                .willReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> taskEmployeeService.getById(taskEmployeeId));
        verify(taskEmployeeRepository).findById(taskEmployeeId);
    }

    @DisplayName("return true when the employee found")
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
        assertTrue(taskEmployeeService.has(task.getId(), taskEmployee.getEmployee()));
        verify(taskEmployeeRepository).existsByTaskIdAndEmployee(task.getId(), taskEmployee.getEmployee());
    }

    @DisplayName("return false when the employee not found")
    @Test
    void shouldReturnFalseWhenEmployeeNotFound() {
        Long taskId = 1L;
        String employee = "employee";
        given(taskEmployeeRepository.existsByTaskIdAndEmployee(taskId, employee))
                .willReturn(false);
        assertFalse(taskEmployeeService.has(taskId, employee));
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
        List<TaskEmployee> content = taskEmployeeService.getAll(task.getId(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(taskEmployee));
        verify(taskEmployeeRepository).findAllByTaskId(task.getId(), pageable);
    }
}
