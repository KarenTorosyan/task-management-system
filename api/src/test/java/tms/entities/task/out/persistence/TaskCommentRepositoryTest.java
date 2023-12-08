package tms.entities.task.out.persistence;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import tms.DataJpaContainerTest;
import tms.entities.task.Task;
import tms.entities.task.TaskComment;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaContainerTest
@DisplayName("TaskCommentRepository should")
public class TaskCommentRepositoryTest {

    @Autowired
    private TaskCommentRepository taskCommentRepository;

    @Autowired
    private TaskRepository taskRepository;

    @DisplayName("add comment")
    @Test
    void shouldAddComment() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PROCESS)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        TaskComment taskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser("user"));
        assertThat(taskCommentRepository.findAllByTaskIdAndParentIdIsNull(task.getId(), Pageable.unpaged()))
                .hasSize(1)
                .contains(taskComment);
        taskRepository.delete(task);
    }

    @DisplayName("delete comment")
    @Test
    void shouldDeleteComment() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PROCESS)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        TaskComment taskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser("user"));
        assertThat(taskCommentRepository.findAllByTaskIdAndParentIdIsNull(task.getId(), Pageable.unpaged()))
                .hasSize(1)
                .contains(taskComment);
        taskCommentRepository.delete(taskComment);
        assertThat(taskCommentRepository.findAllByTaskIdAndParentIdIsNull(task.getId(), Pageable.unpaged()))
                .isEmpty();
        taskRepository.delete(task);
    }

    @DisplayName("load comments")
    @Test
    void shouldLoadComments() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PROCESS)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        TaskComment taskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser("user"));
        assertThat(taskCommentRepository.findAllByTaskIdAndParentIdIsNull(task.getId(), Pageable.unpaged()))
                .hasSize(1)
                .contains(taskComment);
        taskRepository.delete(task);
    }

    @DisplayName("load replied comments")
    @Test
    void shouldLoadRepliedComments() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PROCESS)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        TaskComment taskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser("user"));
        TaskComment repliedTaskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("reply to comment")
                .setUser("employee")
                .setParent(taskComment));
        assertThat(taskCommentRepository.findAllByParentId(taskComment.getId(), Pageable.unpaged()))
                .hasSize(1)
                .contains(repliedTaskComment);
        taskRepository.delete(task);
    }

    @DisplayName("load user comments")
    @Test
    void shouldLoadUserComments() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PROCESS)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        String user = "user";
        TaskComment firstTaskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser(user));
        TaskComment secondTaskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser(user));
        assertThat(taskCommentRepository.findAllByUser(user, Pageable.unpaged()))
                .hasSize(2)
                .containsAll(List.of(firstTaskComment, secondTaskComment));
        taskRepository.delete(task);
    }

    @DisplayName("load user comment when exists")
    @Test
    void loadUserCommentWhenExists() {
        Task task = taskRepository.save(new Task()
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PROCESS)
                .setPriority(TaskPriority.HIGH)
                .setUser("user"));
        String user = "user";
        TaskComment taskComment = taskCommentRepository.save(new TaskComment()
                .setTask(task)
                .setContent("comment")
                .setUser(user));
        assertThat(taskCommentRepository.findByTaskIdAndUser(task.getId(), user))
                .contains(taskComment);
        taskRepository.delete(task);
    }

    @DisplayName("load empty when user comment not exists")
    @Test
    void loadEmptyWhenUserCommentNotExists() {
        assertThat(taskCommentRepository.findByTaskIdAndUser(1L, "user"))
                .isEmpty();
    }
}
