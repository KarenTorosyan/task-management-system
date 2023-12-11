package tms.entities.task.in.web;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import tms.config.swagger.annotation.*;
import tms.entities.task.Task;
import tms.entities.task.TaskComment;
import tms.entities.task.TaskEmployee;
import tms.entities.task.TaskStatus;
import tms.entities.task.service.TaskCommentService;
import tms.entities.task.service.TaskEmployeeService;
import tms.entities.task.service.TaskService;
import tms.errors.Errors;

import java.net.URI;

@RestController
@RequiredArgsConstructor
@Tag(name = "Task")
public class TaskController {

    private final TaskService taskService;
    private final TaskEmployeeService taskEmployeeService;
    private final TaskCommentService taskCommentService;

    @PostMapping("/tasks")
    @ApiDocPostMappingRequireAuthorization(summary = "Create task",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> createTask(@Validated @RequestBody TaskCreateRequest request,
                                    @AuthenticationPrincipal OAuth2User oAuth2User) {
        Task task = taskService.save(request.getTask()
                .setStatus(TaskStatus.PENDING)
                .setUser(oAuth2User.getName()));
        URI location = ServletUriComponentsBuilder.fromCurrentRequestUri()
                .replacePath("/tasks/{taskId}")
                .build(task.getId());
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/tasks/{taskId}")
    @ApiDocPutMappingRequireAuthorization(summary = "Edit task",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> editTask(@PathVariable Long taskId,
                                  @Validated @RequestBody TaskEditRequest request,
                                  @AuthenticationPrincipal OAuth2User oAuth2User) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(oAuth2User.getName())) {
            taskService.save(request.modify(task));
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks")
    @ApiDocGetMappingResponsePage(summary = "Get tasks")
    ResponseEntity<Page<TaskResponse>> getTasks(@ApiDocHide Pageable pageable,
                                                @RequestParam(required = false) String user,
                                                @RequestParam(required = false) TaskUserType userType) {
        Page<Task> tasks = getTasksByCriteria(user, userType, pageable);
        return ResponseEntity.ok(tasks.map(TaskResponse::from));
    }

    private Page<Task> getTasksByCriteria(String user, TaskUserType userType, Pageable pageable) {
        if (user == null) {
            return taskService.getAll(pageable);
        }
        return userType != null ? switch (userType) {
            case USER -> taskService.getAllByUser(user, pageable);
            case EMPLOYEE -> taskService.getAllByEmployee(user, pageable);
        } : taskService.getAllByUser(user, pageable);
    }

    @GetMapping("/tasks/{taskId}")
    @ApiDocGetMapping(summary = "Get task")
    ResponseEntity<TaskResponse> getTaskById(@PathVariable Long taskId) {
        return ResponseEntity.ok(TaskResponse.from(taskService.getById(taskId)));
    }

    @DeleteMapping("/tasks/{taskId}")
    @ApiDocDeleteMappingRequireAuthorization(summary = "Delete task",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> deleteTask(@PathVariable Long taskId,
                                    @AuthenticationPrincipal OAuth2User oAuth2User) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(oAuth2User.getName())) {
            taskService.delete(task);
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/tasks/{taskId}/employees")
    @ApiDocPostMappingRequireAuthorization(summary = "Add employee",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> addEmployee(@PathVariable Long taskId,
                                     @Validated @RequestBody TaskEmployeeAddRequest request,
                                     @AuthenticationPrincipal OAuth2User oAuth2User) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(oAuth2User.getName())) {
            taskEmployeeService.add(request.getTaskEmployee()
                    .setTask(task));
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks/{taskId}/employees")
    @ApiDocGetMappingResponsePage(summary = "Get employees")
    ResponseEntity<Page<TaskEmployeeResponse>> getEmployees(@PathVariable Long taskId,
                                                            @ApiDocHide Pageable pageable) {
        return ResponseEntity.ok(taskEmployeeService.getAll(taskId, pageable)
                .map(TaskEmployeeResponse::from));
    }

    @DeleteMapping("/tasks/{taskId}/employees/{user}")
    @ApiDocDeleteMappingRequireAuthorization(summary = "Delete employee",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Page<TaskEmployeeResponse>> deleteEmployee(@PathVariable Long taskId,
                                                              @PathVariable String user,
                                                              @AuthenticationPrincipal OAuth2User oAuth2User) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(oAuth2User.getName())) {
            TaskEmployee taskEmployee = taskEmployeeService.get(taskId, user);
            taskEmployeeService.delete(taskEmployee);
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/tasks/{taskId}/status")
    @ApiDocPutMappingRequireAuthorization(summary = "Change task status",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> changeTaskStatus(@PathVariable Long taskId,
                                          @AuthenticationPrincipal OAuth2User oAuth2User,
                                          @Validated @RequestBody TaskStatusChangeRequest request) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(oAuth2User.getName()) ||
                taskEmployeeService.has(taskId, oAuth2User.getName())) {
            taskService.save(request.modify(task));
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/tasks/{taskId}/comments")
    @ApiDocPostMappingRequireAuthorization(summary = "Add comment",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> addComment(@PathVariable Long taskId,
                                    @Validated @RequestBody TaskCommentAddRequest request,
                                    @AuthenticationPrincipal OAuth2User oAuth2User) {
        Task task = taskService.getById(taskId);
        TaskComment taskComment = request.getComment()
                .setUser(oAuth2User.getName())
                .setTask(task);
        if (request.getCommentParentId() != null) {
            TaskComment parent = taskCommentService.get(taskId, request.getCommentParentId());
            taskComment.setParent(parent);
        }
        taskCommentService.save(taskComment);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/tasks/{taskId}/comments/{commentId}")
    @ApiDocPutMappingRequireAuthorization(summary = "Edit comment",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> editComment(@PathVariable Long taskId,
                                     @PathVariable Long commentId,
                                     @Validated @RequestBody TaskCommentEditRequest request,
                                     @AuthenticationPrincipal OAuth2User oAuth2User) {
        TaskComment taskComment = taskCommentService.get(taskId, commentId);
        if (taskComment.getUser().equals(oAuth2User.getName())) {
            taskCommentService.save(request.modify(taskComment));
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks/{taskId}/comments")
    @ApiDocGetMappingResponsePage(summary = "Get comments")
    ResponseEntity<Page<TaskCommentResponse>> getComments(@PathVariable Long taskId,
                                                          @ApiDocHide Pageable pageable) {
        return ResponseEntity.ok(taskCommentService.getAll(taskId, pageable)
                .map(TaskCommentResponse::from));
    }

    @GetMapping("/tasks/comments/{commentId}/replies")
    @ApiDocGetMappingResponsePage(summary = "Get comment replies")
    ResponseEntity<Page<TaskCommentResponse>> getCommentsReplies(@PathVariable Long commentId,
                                                                 @ApiDocHide Pageable pageable) {
        return ResponseEntity.ok(taskCommentService.getAllByParentId(commentId, pageable)
                .map(TaskCommentResponse::from));
    }

    @GetMapping("/tasks/comments")
    @ApiDocGetMappingResponsePageRequireAuthorization(summary = "Get user comments",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Page<TaskCommentResponse>> getComments(@AuthenticationPrincipal OAuth2User oAuth2User,
                                                          @ApiDocHide Pageable pageable) {
        return ResponseEntity.ok(taskCommentService.getAllByUser(oAuth2User.getName(), pageable)
                .map(TaskCommentResponse::from));
    }

    @DeleteMapping("/tasks/{taskId}/comments/{commentId}")
    @ApiDocDeleteMappingRequireAuthorization(summary = "Delete comment",
            security = @SecurityRequirement(name = "oAuth2"))
    ResponseEntity<Void> deleteComment(@PathVariable Long taskId,
                                       @PathVariable Long commentId,
                                       @AuthenticationPrincipal OAuth2User oAuth2User) {
        TaskComment taskComment = taskCommentService.get(taskId, commentId);
        if (taskComment.getUser().equals(oAuth2User.getName())) {
            taskCommentService.delete(taskComment);
        } else throw Errors.noEnoughAccess(oAuth2User.getName());
        return ResponseEntity.noContent().build();
    }
}
