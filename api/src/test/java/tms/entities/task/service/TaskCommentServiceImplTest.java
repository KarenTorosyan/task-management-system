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
import tms.entities.task.TaskComment;
import tms.entities.task.TaskPriority;
import tms.entities.task.TaskStatus;
import tms.entities.task.out.persistence.TaskCommentRepository;
import tms.errors.EntityNotFoundException;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest
@ContextConfiguration(classes = TaskCommentServiceImpl.class)
@DisplayName("TaskCommentServiceImpl should")
public class TaskCommentServiceImplTest {

    @Autowired
    private TaskCommentServiceImpl taskCommentService;

    @MockBean
    private TaskCommentRepository taskCommentRepository;

    @DisplayName("save comment")
    @Test
    void shouldSaveComment() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        given(taskCommentRepository.save(taskComment))
                .willReturn(taskComment);
        taskCommentService.save(taskComment);
        verify(taskCommentRepository).save(taskComment);
    }

    @DisplayName("delete comment")
    @Test
    void shouldDeleteComment() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        taskCommentService.delete(taskComment);
        verify(taskCommentRepository).delete(taskComment);
    }

    @DisplayName("get comment when found")
    @Test
    void shouldGetCommentWhenFound() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        given(taskCommentRepository.findByTaskIdAndUser(task.getId(), taskComment.getUser()))
                .willReturn(Optional.of(taskComment));
        assertThat(taskCommentService.get(task.getId(), taskComment.getUser()))
                .isEqualTo(taskComment);
        verify(taskCommentRepository).findByTaskIdAndUser(task.getId(), taskComment.getUser());
    }

    @DisplayName("handle error when get comment when not found")
    @Test
    void shouldHandleErrorWhenGetCommentWhenNotFound() {
        Long taskId = 1L;
        String user = "user";
        given(taskCommentRepository.findByTaskIdAndUser(taskId, user))
                .willReturn(Optional.empty());
        assertThatThrownBy(() -> taskCommentService.get(taskId, user))
                .isInstanceOf(EntityNotFoundException.class);
        verify(taskCommentRepository).findByTaskIdAndUser(taskId, user);
    }

    @DisplayName("get all comments")
    @Test
    void shouldGetAllComments() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskCommentRepository.findAllByTaskIdAndParentIdIsNull(task.getId(), pageable))
                .willReturn(new PageImpl<>(List.of(taskComment)));
        assertThat(taskCommentService.getAll(task.getId(), pageable))
                .hasSize(1)
                .contains(taskComment);
        verify(taskCommentRepository).findAllByTaskIdAndParentIdIsNull(task.getId(), pageable);
    }

    @DisplayName("get all comment children")
    @Test
    void shouldGetAllCommentChildren() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskCommentRepository.findAllByParentId(taskComment.getId(), pageable))
                .willReturn(new PageImpl<>(List.of(taskComment)));
        assertThat(taskCommentService.getAllByParentId(taskComment.getId(), pageable))
                .hasSize(1)
                .contains(taskComment);
        verify(taskCommentRepository).findAllByParentId(taskComment.getId(), pageable);
    }

    @DisplayName("get user comments")
    @Test
    void shouldGetUserComments() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskCommentRepository.findAllByUser(taskComment.getUser(), pageable))
                .willReturn(new PageImpl<>(List.of(taskComment)));
        assertThat(taskCommentService.getAllByUser(taskComment.getUser(), pageable))
                .hasSize(1)
                .contains(taskComment);
        verify(taskCommentRepository).findAllByUser(taskComment.getUser(), pageable);
    }
}
