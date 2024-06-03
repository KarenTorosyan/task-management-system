package tms.entities.task.in.web;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
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
import java.security.Principal;

@RestController
@RequiredArgsConstructor
@Tag(name = "Task")
public class TaskController {

    private final TaskService taskService;
    private final TaskEmployeeService taskEmployeeService;
    private final TaskCommentService taskCommentService;

    @PostMapping("/tasks")
    @DocPostProtectedEntry(summary = "Create task")
    ResponseEntity<Void> createTask(@Validated @RequestBody TaskCreateRequest request,
                                    Principal principal) {
        Task task = taskService.save(request.getTask()
                .setStatus(TaskStatus.PENDING)
                .setUser(principal.getName()));
        URI location = ServletUriComponentsBuilder.fromCurrentRequestUri()
                .replacePath("/tasks/{taskId}")
                .build(task.getId());
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/tasks/{taskId}")
    @DocPutProtectedEntry(summary = "Edit task")
    ResponseEntity<Void> editTask(@PathVariable Long taskId,
                                  @Validated @RequestBody TaskEditRequest request,
                                  Principal principal) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(principal.getName())) {
            taskService.save(request.modify(task));
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks")
    @DocGetPublicEntriesPage(summary = "Get tasks")
    ResponseEntity<Page<TaskResponse>> getTasks(@DocInvisibleParam Pageable pageable,
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

    @GetMapping("/tasks/search")
    @DocGetPublicEntriesPage(summary = "Search tasks")
    ResponseEntity<Page<TaskResponse>> searchTasks(@RequestParam String query,
                                                   @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(taskService.getAllByQuery(query, pageable)
                .map(TaskResponse::from));
    }

    @GetMapping("/tasks/{taskId}")
    @DocGetPublicEntry(summary = "Get task")
    ResponseEntity<TaskResponse> getTaskById(@PathVariable Long taskId) {
        return ResponseEntity.ok(TaskResponse.from(taskService.getById(taskId)));
    }

    @DeleteMapping("/tasks/{taskId}")
    @DocDeleteProtectedEntry(summary = "Delete task")
    ResponseEntity<Void> deleteTask(@PathVariable Long taskId,
                                    Principal principal) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(principal.getName())) {
            taskService.delete(task);
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/tasks/{taskId}/employees")
    @DocPostProtectedEntry(summary = "Add employee")
    ResponseEntity<Void> addEmployee(@PathVariable Long taskId,
                                     @Validated @RequestBody TaskEmployeeAddRequest request,
                                     Principal principal) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(principal.getName())) {
            taskEmployeeService.add(request.getTaskEmployee()
                    .setTask(task));
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks/{taskId}/employees")
    @DocGetPublicEntriesPage(summary = "Get employees")
    ResponseEntity<Page<TaskEmployeeResponse>> getEmployees(@PathVariable Long taskId,
                                                            @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(taskEmployeeService.getAll(taskId, pageable)
                .map(TaskEmployeeResponse::from));
    }

    @DeleteMapping("/tasks/{taskId}/employees/{user}")
    @DocDeleteProtectedEntry(summary = "Delete employee")
    ResponseEntity<Page<TaskEmployeeResponse>> deleteEmployee(@PathVariable Long taskId,
                                                              @PathVariable String user,
                                                              Principal principal) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(principal.getName())) {
            TaskEmployee taskEmployee = taskEmployeeService.get(taskId, user);
            taskEmployeeService.delete(taskEmployee);
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/tasks/{taskId}/status")
    @DocPutProtectedEntry(summary = "Change task status")
    ResponseEntity<Void> changeTaskStatus(@PathVariable Long taskId,
                                          Principal principal,
                                          @Validated @RequestBody TaskStatusChangeRequest request) {
        Task task = taskService.getById(taskId);
        if (task.getUser().equals(principal.getName()) ||
                taskEmployeeService.has(taskId, principal.getName())) {
            taskService.save(request.modify(task));
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/tasks/{taskId}/comments")
    @DocPostProtectedEntry(summary = "Add comment")
    ResponseEntity<Void> addComment(@PathVariable Long taskId,
                                    @Validated @RequestBody TaskCommentAddRequest request,
                                    Principal principal) {
        Task task = taskService.getById(taskId);
        TaskComment taskComment = request.getComment()
                .setUser(principal.getName())
                .setTask(task);
        if (request.getCommentParentId() != null) {
            TaskComment parent = taskCommentService.get(taskId, request.getCommentParentId());
            taskComment.setParent(parent);
        }
        taskCommentService.save(taskComment);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/tasks/{taskId}/comments/{commentId}")
    @DocPutProtectedEntry(summary = "Edit comment")
    ResponseEntity<Void> editComment(@PathVariable Long taskId,
                                     @PathVariable Long commentId,
                                     @Validated @RequestBody TaskCommentEditRequest request,
                                     Principal principal) {
        TaskComment taskComment = taskCommentService.get(taskId, commentId);
        if (taskComment.getUser().equals(principal.getName())) {
            taskCommentService.save(request.modify(taskComment));
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks/{taskId}/comments")
    @DocGetPublicEntriesPage(summary = "Get comments")
    ResponseEntity<Page<TaskCommentResponse>> getComments(@PathVariable Long taskId,
                                                          @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(taskCommentService.getAll(taskId, pageable)
                .map(TaskCommentResponse::from));
    }

    @GetMapping("/tasks/comments/{commentId}/replies")
    @DocGetPublicEntriesPage(summary = "Get comment replies")
    ResponseEntity<Page<TaskCommentResponse>> getCommentsReplies(@PathVariable Long commentId,
                                                                 @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(taskCommentService.getAllByParentId(commentId, pageable)
                .map(TaskCommentResponse::from));
    }

    @GetMapping("/tasks/comments")
    @DocGetProtectedEntriesPage(summary = "Get user comments")
    ResponseEntity<Page<TaskCommentResponse>> getComments(Principal principal,
                                                          @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(taskCommentService.getAllByUser(principal.getName(), pageable)
                .map(TaskCommentResponse::from));
    }

    @DeleteMapping("/tasks/{taskId}/comments/{commentId}")
    @DocDeleteProtectedEntry(summary = "Delete comment")
    ResponseEntity<Void> deleteComment(@PathVariable Long taskId,
                                       @PathVariable Long commentId,
                                       Principal principal) {
        TaskComment taskComment = taskCommentService.get(taskId, commentId);
        if (taskComment.getUser().equals(principal.getName())) {
            taskCommentService.delete(taskComment);
        } else throw Errors.noEnoughAccess(principal.getName());
        return ResponseEntity.noContent().build();
    }
}
