package tms.entities.task.in.web;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.testcontainers.shaded.com.fasterxml.jackson.databind.ObjectMapper;
import org.testcontainers.shaded.com.fasterxml.jackson.databind.SerializationFeature;
import tms.SecurityConfigurationTest;
import tms.SecurityPrincipal;
import tms.entities.task.*;
import tms.entities.task.service.TaskCommentService;
import tms.entities.task.service.TaskEmployeeService;
import tms.entities.task.service.TaskService;
import tms.errors.Errors;

import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.verify;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.authentication;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(controllers = TaskController.class)
@SecurityConfigurationTest
@DisplayName("TaskController should")
public class TaskControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private TaskService taskService;

    @MockBean
    private TaskEmployeeService taskEmployeeService;

    @MockBean
    private TaskCommentService taskCommentService;

    private final ObjectMapper objectMapper = new ObjectMapper()
            .configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

    @DisplayName("create task when client authorized and data is valid")
    @Test
    void shouldCreateTaskWhenClientAuthorizedAndDataIsValid() throws Exception {
        TaskCreateRequest taskCreateRequest = new TaskCreateRequest("task", "description", TaskPriority.HIGH);
        Task task = taskCreateRequest.getTask();
        given(taskService.save(any(Task.class))).willReturn(task.setId(1L));
        mockMvc.perform(post("/tasks")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCreateRequest))
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isCreated())
                .andExpect(header().string("location", Matchers.endsWith("/tasks/" + task.getId())));
        verify(taskService).save(any(Task.class));
    }

    @DisplayName("handle error when create task when unauthorized")
    @Test
    void shouldHandlerErrorWhenCreateTaskWhenUnauthorized() throws Exception {
        mockMvc.perform(post("/tasks")
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when create task when data invalid")
    @Test
    void shouldHandleErrorWhenCreateTaskWhenDataInvalid() throws Exception {
        TaskCreateRequest taskCreateRequest = new TaskCreateRequest("", "description", TaskPriority.HIGH);
        mockMvc.perform(post("/tasks")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCreateRequest))
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isBadRequest());
    }

    @DisplayName("edit task when data is valid and client authorized and client is task creator")
    @Test
    void shouldEditTaskWhenDataIsValueAndClientAuthorizedAndClientIsTaskCreator() throws Exception {
        Task task = new Task().setId(1L).setUser("user");
        TaskEditRequest taskEditRequest = new TaskEditRequest("task", "description", TaskPriority.HIGH);
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskService.save(any(Task.class))).willReturn(task);
        mockMvc.perform(put("/tasks/{taskId}", task.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEditRequest))
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser()))))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskService).save(any(Task.class));
    }

    @DisplayName("handle error when edit task when authorized client isn't task creator")
    @Test
    void shouldHandleErrorWhenEditTaskWhenAuthorizedClientIsNotTaskCreator() throws Exception {
        Task task = new Task().setId(1L).setUser("user");
        TaskEditRequest taskEditRequest = new TaskEditRequest("task", "description", TaskPriority.HIGH);
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(put("/tasks/{taskId}", task.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEditRequest))
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isForbidden());
    }

    @DisplayName("handle error when edit task when client unauthorized")
    @Test
    void shouldHandleErrorWhenEditTaskWhenClientUnauthorized() throws Exception {
        Task task = new Task().setId(1L).setUser("user");
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(put("/tasks/{taskId}", task.getId())
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when edit task when task not found")
    @Test
    void shouldHandleErrorWhenEditTaskWhenTaskNotFound() throws Exception {
        Task task = new Task().setId(1L).setUser("user");
        TaskEditRequest taskEditRequest = new TaskEditRequest("task", "description", TaskPriority.HIGH);
        given(taskService.getById(task.getId())).willThrow(Errors.taskNotFound(task.getId()));
        mockMvc.perform(put("/tasks/{taskId}", task.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEditRequest))
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isNotFound());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when edit task when data invalid")
    @Test
    void shouldHandleErrorWhenEditTaskWhenDataInvalid() throws Exception {
        TaskEditRequest taskEditRequest = new TaskEditRequest("", "description", TaskPriority.HIGH);
        mockMvc.perform(put("/tasks/{taskId}", 1)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEditRequest))
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isBadRequest());
    }

    @DisplayName("get all tasks")
    @Test
    void shouldGetTasks() throws Exception {
        Pageable pageable = PageRequest.of(0, 10).withSort(Sort.by("title").ascending());
        PageImpl<Task> tasks = new PageImpl<>(List.of(
                new Task()
                        .setId(1L)
                        .setTitle("task")
                        .setDescription("description")
                        .setStatus(TaskStatus.PENDING)
                        .setPriority(TaskPriority.HIGH)
                        .setUser("user")
        ), pageable, 1);
        given(taskService.getAll(pageable)).willReturn(tasks);
        mockMvc.perform(get("/tasks")
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize()))
                        .queryParam("sort", "title,asc")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(tasks.map(TaskResponse::from))));
        verify(taskService).getAll(pageable);
    }

    @DisplayName("get user tasks by default")
    @Test
    void shouldGetUserTasksByDefault() throws Exception {
        Pageable pageable = PageRequest.of(0, 10).withSort(Sort.by("title").ascending());
        String user = "user";
        PageImpl<Task> tasks = new PageImpl<>(List.of(
                new Task()
                        .setId(1L)
                        .setTitle("task")
                        .setDescription("description")
                        .setStatus(TaskStatus.PENDING)
                        .setPriority(TaskPriority.HIGH)
                        .setUser(user)
        ), pageable, 1);
        given(taskService.getAllByUser(user, pageable)).willReturn(tasks);
        mockMvc.perform(get("/tasks")
                        .queryParam("user", user)
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize()))
                        .queryParam("sort", "title,asc")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(tasks.map(TaskResponse::from))));
        verify(taskService).getAllByUser(user, pageable);
    }

    @DisplayName("get user tasks")
    @Test
    void shouldGetUserTasks() throws Exception {
        Pageable pageable = PageRequest.of(0, 10).withSort(Sort.by("title").ascending());
        String user = "user";
        PageImpl<Task> tasks = new PageImpl<>(List.of(
                new Task()
                        .setId(1L)
                        .setTitle("task")
                        .setDescription("description")
                        .setStatus(TaskStatus.PENDING)
                        .setPriority(TaskPriority.HIGH)
                        .setUser(user)
        ), pageable, 1);
        given(taskService.getAllByUser(user, pageable)).willReturn(tasks);
        mockMvc.perform(get("/tasks")
                        .queryParam("user", user)
                        .queryParam("userType", TaskUserType.USER.name())
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize()))
                        .queryParam("sort", "title,asc")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(tasks.map(TaskResponse::from))));
        verify(taskService).getAllByUser(user, pageable);
    }

    @DisplayName("get employee tasks")
    @Test
    void shouldGetEmployeeTasks() throws Exception {
        Pageable pageable = PageRequest.of(0, 10).withSort(Sort.by("title").ascending());
        String employee = "employee";
        PageImpl<Task> tasks = new PageImpl<>(List.of(
                new Task()
                        .setId(1L)
                        .setTitle("task")
                        .setDescription("description")
                        .setStatus(TaskStatus.PENDING)
                        .setPriority(TaskPriority.HIGH)
                        .setUser(employee)
        ), pageable, 1);
        given(taskService.getAllByEmployee(employee, pageable)).willReturn(tasks);
        mockMvc.perform(get("/tasks")
                        .queryParam("user", employee)
                        .queryParam("userType", TaskUserType.EMPLOYEE.name())
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize()))
                        .queryParam("sort", "title,asc")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(tasks.map(TaskResponse::from))));
        verify(taskService).getAllByEmployee(employee, pageable);
    }

    @DisplayName("get task by id when found")
    @Test
    void shouldGetTaskByIdWhenFound() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        given(taskService.getById(task.getId()))
                .willReturn(task);
        mockMvc.perform(get("/tasks/{id}", task.getId())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(TaskResponse.from(task))));
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when get task by id when not found")
    @Test
    void shouldHandleErrorWhenGetTaskByIdWhenNotFound() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        given(taskService.getById(task.getId()))
                .willThrow(Errors.taskNotFound(task.getId()));
        mockMvc.perform(get("/tasks/{id}", task.getId())
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("delete task by id when found and client authorized and client is task creator")
    @Test
    void shouldDeleteTaskByIdWhenFoundAndClientAuthorizedAndClientIsTaskCreator() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(delete("/tasks/{taskId}", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser()))))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskService).delete(task);
    }

    @DisplayName("handle error when delete task by id when authorized client isn't task creator")
    @Test
    void shouldHandlerErrorWhenDeleteTaskByIdWhenAuthorizedClientIsNotTaskCreator() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(delete("/tasks/{taskId}", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isForbidden());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when delete task by id when client unauthorized")
    @Test
    void shouldHandleErrorWhenDeleteTaskByIdWhenClientUnauthorized() throws Exception {
        mockMvc.perform(delete("/tasks/{taskId}", 1)
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when delete task by id when not found")
    @Test
    void shouldHandleErrorWhenDeleteTasByIdkWhenNotFound() throws Exception {
        Long taskId = 1L;
        given(taskService.getById(taskId)).willThrow(Errors.taskNotFound(taskId));
        mockMvc.perform(delete("/tasks/{taskId}", taskId)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isNotFound());
        verify(taskService).getById(taskId);
    }

    @DisplayName("add employee when employee not duplicate and client authorized and client is task creator")
    @Test
    void shouldAddEmployeeWhenEmployeeNotDuplicateAndClientAuthorizedAndClientIsTaskCreator() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskEmployeeAddRequest taskEmployeeAddRequest = new TaskEmployeeAddRequest("employee_user");
        TaskEmployee taskEmployee = taskEmployeeAddRequest.getTaskEmployee()
                .setTask(task);
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(post("/tasks/{taskId}/employees", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEmployeeAddRequest)))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskEmployeeService).add(taskEmployee);
    }

    @DisplayName("handle error when add employee when authorized client isn't task creator")
    @Test
    void shouldHandleErrorWhenAddEmployeeWhenAuthorizedClientIsNotTaskCreator() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskEmployeeAddRequest taskEmployeeAddRequest = new TaskEmployeeAddRequest("employee_user");
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(post("/tasks/{taskId}/employees", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEmployeeAddRequest)))
                .andExpect(status().isForbidden());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when add employee when client unauthorized")
    @Test
    void shouldHandleErrorWhenAddEmployeeWhenClientUnauthorized() throws Exception {
        mockMvc.perform(post("/tasks/{taskId}/employees", 1)
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when add employee when data invalid")
    @Test
    void shouldHandleErrorWhenAddAddEmployeeWhenDataInvalid() throws Exception {
        TaskEmployeeAddRequest taskEmployeeAddRequest = new TaskEmployeeAddRequest("");
        mockMvc.perform(post("/tasks/{taskId}/employees", 1)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEmployeeAddRequest)))
                .andExpect(status().isBadRequest());
    }

    @DisplayName("handle error when add employee when employee is duplicate")
    @Test
    void shouldHandleErrorWhenAddEmployeeWhenEmployeeIsDuplicate() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskEmployeeAddRequest taskEmployeeAddRequest = new TaskEmployeeAddRequest("employee_user");
        TaskEmployee taskEmployee = taskEmployeeAddRequest.getTaskEmployee()
                .setTask(task);
        given(taskService.getById(task.getId())).willReturn(task);
        doThrow(Errors.taskEmployeeDuplicate(taskEmployee)).when(taskEmployeeService).add(taskEmployee);
        mockMvc.perform(post("/tasks/{taskId}/employees", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEmployeeAddRequest)))
                .andExpect(status().isConflict());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when add employee when task not found")
    @Test
    void shouldHandleErrorWhenAddEmployeeWhenTaskNotFound() throws Exception {
        Long taskId = 1L;
        TaskEmployeeAddRequest taskEmployeeAddRequest = new TaskEmployeeAddRequest("employee_user");
        given(taskService.getById(taskId)).willThrow(Errors.taskNotFound(taskId));
        mockMvc.perform(post("/tasks/{taskId}/employees", taskId)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskEmployeeAddRequest)))
                .andExpect(status().isNotFound());
        verify(taskService).getById(taskId);
    }

    @DisplayName("get employees")
    @Test
    void shouldGetEmployees() throws Exception {
        Long taskId = 1L;
        Pageable pageable = PageRequest.of(0, 10).withSort(Sort.by("employee"));
        PageImpl<TaskEmployee> taskEmployees = new PageImpl<>(List.of(
                new TaskEmployee()
                        .setTask(new Task())
                        .setEmployee("employee")
        ), pageable, 1);
        given(taskEmployeeService.getAll(taskId, pageable)).willReturn(taskEmployees);
        mockMvc.perform(get("/tasks/{taskId}/employees", taskId)
                        .accept(MediaType.APPLICATION_JSON)
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize()))
                        .queryParam("sort", "employee,asc"))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(taskEmployees.map(TaskEmployeeResponse::from))));
        verify(taskEmployeeService).getAll(taskId, pageable);
    }

    @DisplayName("delete employee when found and client authorized and client is task creator")
    @Test
    void shouldDeleteEmployeeWhenFoundAndClientAuthorizedAndClientIsTaskCreator() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskEmployeeService.get(task.getId(), taskEmployee.getEmployee())).willReturn(taskEmployee);
        mockMvc.perform(delete("/tasks/{taskId}/employees/{user}", task.getId(), taskEmployee.getEmployee())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser()))))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskEmployeeService).get(task.getId(), taskEmployee.getEmployee());
        verify(taskEmployeeService).delete(taskEmployee);
    }

    @DisplayName("handle error when delete employee when client is not task creator")
    @Test
    void shouldHandleErrorWhenDeleteEmployeeWhenClientIsNotTaskCreator() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskEmployee taskEmployee = new TaskEmployee()
                .setTask(task)
                .setEmployee("employee");
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(delete("/tasks/{taskId}/employees/{user}", task.getId(), taskEmployee.getEmployee())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isForbidden());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when delete employee when client unauthorized")
    @Test
    void shouldHandleErrorWhenDeleteEmployeeWhenClientUnauthorized() throws Exception {
        mockMvc.perform(delete("/tasks/{taskId}/employees/{user}", 1, "user")
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when delete employee when task not found")
    @Test
    void shouldHandleErrorWhenDeleteEmployeeWhenTaskNotFound() throws Exception {
        Long taskId = 1L;
        String user = "user";
        given(taskService.getById(taskId)).willThrow(Errors.taskNotFound(taskId));
        mockMvc.perform(delete("/tasks/{taskId}/employees/{user}", taskId, user)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isNotFound());
        verify(taskService).getById(taskId);
    }

    @DisplayName("handle error when delete employee when employee not found")
    @Test
    void shouldHandleErrorWhenDeleteEmployeeWhenEmployeeNotFound() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        String user = "user";
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskEmployeeService.get(task.getId(), user)).willThrow(Errors.taskEmployeeNotFound(task.getId(), user));
        mockMvc.perform(delete("/tasks/{taskId}/employees/{user}", task.getId(), user)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser()))))
                .andExpect(status().isNotFound());
        verify(taskService).getById(task.getId());
        verify(taskEmployeeService).get(task.getId(), user);
    }

    @DisplayName("change task status when found and client authorized and user is task creator or employee")
    @Test
    void shouldChangeTaskStatusWhenFoundAndClientAuthorizedAndUserIsTaskCreator() throws Exception {
        TaskStatusChangeRequest taskStatusChangeRequest = new TaskStatusChangeRequest(TaskStatus.PROCESS);
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskService.save(task)).willReturn(task);
        mockMvc.perform(put("/tasks/{taskId}/status", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(task.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskStatusChangeRequest)))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskService).save(task);
    }

    @DisplayName("change task status when found and client authorized and user is task employee")
    @Test
    void shouldChangeTaskStatusWhenFoundAndClientAuthorizedAndUserIsTaskEmployee() throws Exception {
        TaskStatusChangeRequest taskStatusChangeRequest = new TaskStatusChangeRequest(TaskStatus.PROCESS);
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        String user = "other_user";
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskEmployeeService.has(task.getId(), user)).willReturn(true);
        given(taskService.save(task)).willReturn(task);
        mockMvc.perform(put("/tasks/{taskId}/status", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(user)))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskStatusChangeRequest)))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskEmployeeService).has(task.getId(), user);
        verify(taskService).save(task);
    }

    @DisplayName("handle error when change task status when user isn't task creator or employee")
    @Test
    void shouldHandleErrorWhenChangeTaskStatusWhenUserIsNotTaskCreatorOrEmployee() throws Exception {
        TaskStatusChangeRequest taskStatusChangeRequest = new TaskStatusChangeRequest(TaskStatus.PROCESS);
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        String user = "other_user";
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskEmployeeService.has(task.getId(), user)).willReturn(false);
        mockMvc.perform(put("/tasks/{taskId}/status", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(user)))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskStatusChangeRequest)))
                .andExpect(status().isForbidden());
        verify(taskService).getById(task.getId());
        verify(taskEmployeeService).has(task.getId(), user);
    }

    @DisplayName("handle error when change task status when client unauthorized")
    @Test
    void shouldHandleErrorWhenChangeTaskStatusWhenClientUnauthorized() throws Exception {
        mockMvc.perform(put("/tasks/{taskId}/status", 1)
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when change task status when task not found")
    @Test
    void shouldHandleErrorWhenChangeTaskStatusWhenTaskNotFound() throws Exception {
        TaskStatusChangeRequest taskStatusChangeRequest = new TaskStatusChangeRequest(TaskStatus.PROCESS);
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        given(taskService.getById(task.getId())).willThrow(Errors.taskNotFound(task.getId()));
        given(taskService.save(task)).willReturn(task);
        mockMvc.perform(put("/tasks/{taskId}/status", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskStatusChangeRequest)))
                .andExpect(status().isNotFound());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("add comment when task found and client authorized and data is valid")
    @Test
    void shouldAddCommentWhenTaskFoundAndClientAuthorizedAndDataIsValid() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskCommentAddRequest taskCommentAddRequest = new TaskCommentAddRequest("comment", null);
        TaskComment taskComment = taskCommentAddRequest.getComment()
                .setTask(task)
                .setUser("comment_user");
        given(taskService.getById(task.getId())).willReturn(task);
        mockMvc.perform(post("/tasks/{taskId}/comments", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentAddRequest)))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskCommentService).save(taskComment);
    }

    @DisplayName("reply comment when found and client authorized and data is valid")
    @Test
    void shouldReplyCommentWhenFoundAndClientAuthorizedAndDataIsValid() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskComment parentTaskComment = new TaskComment()
                .setId(1L)
                .setTask(task)
                .setUser("parent_comment_user")
                .setContent("parent_comment");
        TaskCommentAddRequest taskCommentAddRequest = new TaskCommentAddRequest("comment", parentTaskComment.getId());
        TaskComment taskComment = taskCommentAddRequest.getComment()
                .setTask(task)
                .setUser("reply_comment_user")
                .setParent(parentTaskComment);
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskCommentService.get(task.getId(), parentTaskComment.getId())).willReturn(parentTaskComment);
        mockMvc.perform(post("/tasks/{taskId}/comments", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentAddRequest)))
                .andExpect(status().isNoContent());
        verify(taskService).getById(task.getId());
        verify(taskCommentService).get(task.getId(), parentTaskComment.getId());
        verify(taskCommentService).save(taskComment);
    }

    @DisplayName("handle error when add comment when client unauthorized")
    @Test
    void shouldHandleErrorWhenAddCommentWhenClientUnauthorized() throws Exception {
        mockMvc.perform(post("/tasks/{taskId}/comments", 1)
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when add comment when data invalid")
    @Test
    void shouldHandleErrorWhenAddCommentWhenDataInvalid() throws Exception {
        TaskCommentAddRequest taskCommentAddRequest = new TaskCommentAddRequest("", null);
        mockMvc.perform(post("/tasks/{taskId}/comments", 1)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentAddRequest)))
                .andExpect(status().isBadRequest());
    }

    @DisplayName("handle error when add comment when task not found")
    @Test
    void shouldHandleErrorWhenAddCommentWhenTaskNotFound() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("comment_user");
        TaskCommentAddRequest taskCommentAddRequest = new TaskCommentAddRequest("comment", null);
        TaskComment taskComment = taskCommentAddRequest.getComment()
                .setTask(task)
                .setUser("user");
        given(taskService.getById(task.getId())).willThrow(Errors.taskNotFound(task.getId()));
        mockMvc.perform(post("/tasks/{taskId}/comments", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentAddRequest)))
                .andExpect(status().isNotFound());
        verify(taskService).getById(task.getId());
    }

    @DisplayName("handle error when reply comment when comment not found")
    @Test
    void shouldHandleErrorWhenReplyCommentWhenCommentNotFound() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskComment parentTaskComment = new TaskComment()
                .setId(1L)
                .setTask(task)
                .setUser("parent_comment_user")
                .setContent("parent_comment");
        TaskCommentAddRequest taskCommentAddRequest = new TaskCommentAddRequest("comment", parentTaskComment.getId());
        TaskComment taskComment = taskCommentAddRequest.getComment()
                .setTask(task)
                .setUser("reply_comment_user")
                .setParent(parentTaskComment);
        given(taskService.getById(task.getId())).willReturn(task);
        given(taskCommentService.get(task.getId(), parentTaskComment.getId()))
                .willThrow(Errors.taskCommentNotFound(task.getId(), parentTaskComment.getId()));
        mockMvc.perform(post("/tasks/{taskId}/comments", task.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentAddRequest)))
                .andExpect(status().isNotFound());
        verify(taskService).getById(task.getId());
        verify(taskCommentService).get(task.getId(), parentTaskComment.getId());
    }

    @DisplayName("edit comment when comment found and client authorized and user is comment poster")
    @Test
    void shouldEditCommentWhenCommentFoundAndClientAuthorizedAndUserIsCommentPoster() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setId(1L)
                .setTask(task)
                .setUser("comment_user")
                .setContent("comment");
        TaskCommentEditRequest taskCommentEditRequest = new TaskCommentEditRequest("updated_comment");
        given(taskCommentService.get(task.getId(), taskComment.getId())).willReturn(taskComment);
        mockMvc.perform(put("/tasks/{taskId}/comments/{commentId}", task.getId(), taskComment.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentEditRequest)))
                .andExpect(status().isNoContent());
        verify(taskCommentService).get(task.getId(), taskComment.getId());
        verify(taskCommentService).save(taskComment);
    }

    @DisplayName("handle error when edit comment when client authorized and user is not comment poster")
    @Test
    void shouldHandleErrorWhenEditCommentWhenClientAuthorizedAndUserIsNotCommentPoster() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setId(1L)
                .setTask(task)
                .setUser("comment_user")
                .setContent("comment");
        TaskCommentEditRequest taskCommentEditRequest = new TaskCommentEditRequest("updated_comment");
        given(taskCommentService.get(task.getId(), taskComment.getId())).willReturn(taskComment);
        mockMvc.perform(put("/tasks/{taskId}/comments/{commentId}", task.getId(), taskComment.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentEditRequest)))
                .andExpect(status().isForbidden());
        verify(taskCommentService).get(task.getId(), taskComment.getId());
    }

    @DisplayName("handle error when edit comment when client unauthorized")
    @Test
    void shouldHandleErrorWhenEditCommentWhenClientUnauthorized() throws Exception {
        mockMvc.perform(put("/tasks/{taskId}/comments/{commentId}", 1, 1)
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when edit comment when data invalid")
    @Test
    void shouldHandleErrorWhenEditCommentWhenDataInvalid() throws Exception {
        TaskCommentEditRequest taskCommentEditRequest = new TaskCommentEditRequest("");
        mockMvc.perform(put("/tasks/{taskId}/comments/{commentId}", 1, 1)
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentEditRequest)))
                .andExpect(status().isBadRequest());
    }

    @DisplayName("handle error when edit comment when comment not found")
    @Test
    void shouldHandleErrorWhenEditCommentWhenCommentNotFound() throws Exception {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.HIGH)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setId(1L)
                .setTask(task)
                .setUser("comment_user")
                .setContent("comment");
        TaskCommentEditRequest taskCommentEditRequest = new TaskCommentEditRequest("updated_comment");
        given(taskCommentService.get(task.getId(), taskComment.getId()))
                .willThrow(Errors.taskCommentNotFound(task.getId(), taskComment.getId()));
        mockMvc.perform(put("/tasks/{taskId}/comments/{commentId}", task.getId(), taskComment.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser())))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(taskCommentEditRequest)))
                .andExpect(status().isNotFound());
        verify(taskCommentService).get(task.getId(), taskComment.getId());
    }

    @DisplayName("get all comments")
    @Test
    void shouldGetAllComments() throws Exception {
        Task task = new Task().setId(1L);
        Pageable pageable = PageRequest.of(0, 10);
        PageImpl<TaskComment> taskComments = new PageImpl<>(List.of(
                new TaskComment()
                        .setId(1L)
                        .setTask(task)
                        .setUser("comment_user")
                        .setContent("comment")), pageable, 1);
        given(taskCommentService.getAll(task.getId(), pageable))
                .willReturn(taskComments);
        mockMvc.perform(get("/tasks/{taskId}/comments", task.getId())
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize())))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(taskComments.map(TaskCommentResponse::from))));
        verify(taskCommentService).getAll(task.getId(), pageable);
    }

    @DisplayName("get comment replies")
    @Test
    void shouldGetCommentReplies() throws Exception {
        Pageable pageable = PageRequest.of(0, 10);
        PageImpl<TaskComment> taskComments = new PageImpl<>(List.of(
                new TaskComment()
                        .setId(1L)
                        .setTask(new Task().setId(1L))
                        .setUser("comment_user")
                        .setContent("comment")), pageable, 1);
        Long parentCommentId = 1L;
        given(taskCommentService.getAllByParentId(parentCommentId, pageable))
                .willReturn(taskComments);
        mockMvc.perform(get("/tasks/comments/{commentId}/replies", parentCommentId)
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize())))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(taskComments.map(TaskCommentResponse::from))));
        verify(taskCommentService).getAllByParentId(parentCommentId, pageable);
    }

    @DisplayName("get user comments")
    @Test
    void shouldGetUserComments() throws Exception {
        Pageable pageable = PageRequest.of(0, 10);
        PageImpl<TaskComment> taskComments = new PageImpl<>(List.of(
                new TaskComment()
                        .setId(1L)
                        .setTask(new Task().setId(1L))
                        .setUser("comment_user")
                        .setContent("comment")), pageable, 1);
        String user = "user";
        given(taskCommentService.getAllByUser(user, pageable))
                .willReturn(taskComments);
        mockMvc.perform(get("/tasks/comments")
                        .with(authentication(SecurityPrincipal.bearerToken(user)))
                        .queryParam("page", String.valueOf(pageable.getPageNumber()))
                        .queryParam("size", String.valueOf(pageable.getPageSize())))
                .andExpect(status().isOk())
                .andExpect(content().json(objectMapper.writeValueAsString(taskComments.map(TaskCommentResponse::from))));
        verify(taskCommentService).getAllByUser(user, pageable);
    }

    @DisplayName("handle error when get user comments when client unauthorized")
    @Test
    void shouldHandleErrorWhenGetUserCommentsWhenClientUnauthorized() throws Exception {
        mockMvc.perform(get("/tasks/comments"))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("delete comment when found and client authorized and user is comment poster")
    @Test
    void shouldDeleteCommentWhenFoundAndClientAuthorizedAndUserIsCommentPoster() throws Exception {
        Long taskId = 1L;
        TaskComment taskComment = new TaskComment()
                .setId(1L)
                .setTask(new Task().setId(taskId))
                .setUser("user")
                .setContent("comment");
        given(taskCommentService.get(taskId, taskComment.getId())).willReturn(taskComment);
        mockMvc.perform(delete("/tasks/{taskId}/comments/{commentId}", taskId, taskComment.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken(taskComment.getUser()))))
                .andExpect(status().isNoContent());
        verify(taskCommentService).get(taskId, taskComment.getId());
        verify(taskCommentService).delete(taskComment);
    }

    @DisplayName("handle error when delete comment when client isn't comment poster")
    @Test
    void shouldHandleErrorWhenDeleteCommentWhenClientIsNotCommentPoster() throws Exception {
        Long taskId = 1L;
        TaskComment taskComment = new TaskComment()
                .setId(1L)
                .setTask(new Task().setId(taskId))
                .setUser("user")
                .setContent("comment");
        given(taskCommentService.get(taskId, taskComment.getId())).willReturn(taskComment);
        mockMvc.perform(delete("/tasks/{taskId}/comments/{commentId}", taskId, taskComment.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isForbidden());
        verify(taskCommentService).get(taskId, taskComment.getId());
    }

    @DisplayName("handle error when delete comment when client unauthorized")
    @Test
    void shouldHandleErrorWhenDeleteCommentWhenClientUnauthorized() throws Exception {
        mockMvc.perform(delete("/tasks/{taskId}/comments/{commentId}", 1, 1)
                        .with(csrf()))
                .andExpect(status().isUnauthorized());
    }

    @DisplayName("handle error when delete comment when not found")
    @Test
    void shouldHandleErrorWhenDeleteCommentWhenNotFound() throws Exception {
        Long taskId = 1L;
        TaskComment taskComment = new TaskComment()
                .setId(1L)
                .setTask(new Task().setId(taskId))
                .setUser("user")
                .setContent("comment");
        given(taskCommentService.get(taskId, taskComment.getId()))
                .willThrow(Errors.taskCommentNotFound(taskId, taskComment.getId()));
        mockMvc.perform(delete("/tasks/{taskId}/comments/{commentId}", taskId, taskComment.getId())
                        .with(csrf())
                        .with(authentication(SecurityPrincipal.bearerToken())))
                .andExpect(status().isNotFound());
        verify(taskCommentService).get(taskId, taskComment.getId());
    }
}
