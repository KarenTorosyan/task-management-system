package tms.in.web;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tms.config.swagger.annotation.*;
import tms.model.*;
import tms.service.TaskCommentService;
import tms.service.TaskEmployeeService;
import tms.service.TaskService;
import tms.service.UserService;
import tms.transfer.*;
import tms.util.PageOf;

import java.net.URI;

@RestController
@RequiredArgsConstructor
@Tag(name = "Task")
public class TaskController {

    private final TaskService taskService;
    private final TaskEmployeeService taskEmployeeService;
    private final UserService userService;
    private final TaskCommentService taskCommentService;

    @PostMapping("/tasks")
    @DocPostProtectedEntry(summary = "Create a task")
    ResponseEntity<Void> createTask(@RequestBody TaskBody body) {
        Task ready = taskService.create(body.getTask());
        URI location = URI.create("/tasks/").resolve(String.valueOf(ready.getId()));
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/tasks/{taskId}")
    @DocPutProtectedEntry(summary = "Edit a task")
    ResponseEntity<Void> editTask(@PathVariable Long taskId,
                                  @RequestBody TaskBody body) {
        Task task = taskService.getById(taskId);
        taskService.edit(body.modify(task));
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks")
    @DocGetPublicEntriesPage(summary = "Get tasks")
    ResponseEntity<PageOf<TaskState>> getTasks(@DocInvisibleParam Pageable pageable,
                                               @RequestParam(required = false) String user,
                                               @RequestParam(required = false) UserType userType) {
        Page<Task> page = user == null ?
                taskService.getAll(pageable) :
                userType == UserType.EMPLOYEE ?
                        taskService.getAllByEmployee(user, pageable) :
                        taskService.getAllByUser(user, pageable);
        return ResponseEntity.ok(new PageOf<>(page.map(TaskState::from)));
    }

    @GetMapping("/tasks/search")
    @DocGetPublicEntriesPage(summary = "Search tasks")
    ResponseEntity<PageOf<TaskState>> searchTasks(@RequestParam String query,
                                                  @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(taskService.getAllByQuery(query, pageable)
                .map(TaskState::from)));
    }

    @GetMapping("/tasks/{taskId}")
    @DocGetPublicEntry(summary = "Get a task")
    ResponseEntity<TaskState> getTaskById(@PathVariable Long taskId) {
        return ResponseEntity.ok(TaskState.from(taskService.getById(taskId)));
    }

    @DeleteMapping("/tasks/{taskId}")
    @DocDeleteProtectedEntry(summary = "Delete a task")
    ResponseEntity<Void> deleteTask(@PathVariable Long taskId) {
        Task task = taskService.getById(taskId);
        taskService.delete(task);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/tasks/{taskId}/employees")
    @DocPostProtectedEntry(summary = "Add an employee")
    ResponseEntity<Void> addEmployee(@PathVariable Long taskId,
                                     @RequestBody TaskEmployeeBody body) {
        User user = userService.getUser(body.user());
        Task task = taskService.getById(taskId);
        taskEmployeeService.add(body.getTaskEmployee().setTask(task).setEmployee(user.getId()));
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks/{taskId}/employees")
    @DocGetPublicEntriesPage(summary = "Get employees")
    ResponseEntity<PageOf<TaskEmployeeState>> getEmployees(@PathVariable Long taskId,
                                                           @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(taskEmployeeService.getAll(taskId, pageable)
                .map(TaskEmployeeState::from)));
    }

    @DeleteMapping("/tasks/employees/{id}")
    @DocDeleteProtectedEntry(summary = "Delete an employee")
    ResponseEntity<Void> deleteEmployee(@PathVariable Long id) {
        TaskEmployee taskEmployee = taskEmployeeService.getById(id);
        Task task = taskService.getById(taskEmployee.getTask().getId());
        taskEmployeeService.delete(taskEmployee.setTask(task));
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/tasks/{taskId}/comments")
    @DocPostProtectedEntry(summary = "Add a comment")
    ResponseEntity<Void> addComment(@PathVariable Long taskId,
                                    @RequestBody TaskCommentBody body) {
        Task task = taskService.getById(taskId);
        TaskComment taskComment = body.getTaskComment().setTask(task);
        if (body.parentId() != null) {
            TaskComment parent = taskCommentService.getById(body.parentId());
            taskComment.setParent(parent);
        }
        taskCommentService.add(taskComment);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/tasks/comments/{commentId}")
    @DocPutProtectedEntry(summary = "Edit a comment")
    ResponseEntity<Void> editComment(@PathVariable Long commentId,
                                     @RequestBody TaskCommentEditBody body) {
        TaskComment taskComment = taskCommentService.getById(commentId);
        taskCommentService.edit(body.modify(taskComment));
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tasks/{taskId}/comments")
    @DocGetPublicEntriesPage(summary = "Get comments")
    ResponseEntity<PageOf<TaskCommentState>> getComments(@PathVariable Long taskId,
                                                         @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(taskCommentService.getAll(taskId, pageable)
                .map(TaskCommentState::from)));
    }

    @GetMapping("/tasks/comments/{commentId}/replies")
    @DocGetPublicEntriesPage(summary = "Get comment replies")
    ResponseEntity<PageOf<TaskCommentState>> getCommentsReplies(@PathVariable Long commentId,
                                                                @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(taskCommentService.getAllByParentId(commentId, pageable)
                .map(TaskCommentState::from)));
    }

    @GetMapping("/tasks/comments")
    @DocGetProtectedEntriesPage(summary = "Get user comments")
    ResponseEntity<PageOf<TaskCommentState>> getComments(@DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(taskCommentService.getAllByUser(pageable)
                .map(TaskCommentState::from)));
    }

    @DeleteMapping("/tasks/comments/{id}")
    @DocDeleteProtectedEntry(summary = "Delete a comment")
    ResponseEntity<Void> deleteComment(@PathVariable Long id) {
        TaskComment taskComment = taskCommentService.getById(id);
        taskCommentService.delete(taskComment);
        return ResponseEntity.noContent().build();
    }
}
