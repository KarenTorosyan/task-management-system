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
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import tms.exception.EntityNotFoundException;
import tms.model.Task;
import tms.model.TaskComment;
import tms.model.TaskPriority;
import tms.model.TaskStatus;
import tms.out.persistence.TaskCommentRepository;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;

@SpringBootTest(classes = {
        TaskCommentService.class,
        ValidationAutoConfiguration.class
})
@EnableMethodSecurity
@DisplayName("TaskCommentService should")
public class TaskCommentServiceTest {

    @Autowired
    private TaskCommentService taskCommentService;

    @MockBean
    private TaskCommentRepository taskCommentRepository;

    @WithMockUser
    @DisplayName("add comment when the client is authenticated")
    @Test
    void shouldAddCommentWhenClientIsAuthenticated() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("some user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content");
        given(taskCommentRepository.save(taskComment))
                .willReturn(taskComment);
        taskCommentService.add(taskComment);
        verify(taskCommentRepository).save(taskComment);
    }

    @WithAnonymousUser
    @DisplayName("throw access denied exception on adding a comment when the client is not authenticated")
    @Test
    void shouldThrowingAccessDeniedExceptionOnAddingCommentWhenClientIsNotAuthenticated() {
        assertThrows(AccessDeniedException.class, () -> taskCommentService.add(new TaskComment()));
    }

    @WithMockUser
    @DisplayName("throw validation exception when adding a comment when data is invalid")
    @Test
    void shouldThrowValidationExceptionWhenAddingCommentWhenDataIsInvalid() {
        assertThrows(ConstraintViolationException.class, () -> taskCommentService.add(new TaskComment()));
    }

    @WithMockUser
    @DisplayName("edit a comment when the client is a comment author")
    @Test
    void shouldEditCommentWhenClientIsCommentAuthor() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("some user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        given(taskCommentRepository.save(taskComment))
                .willReturn(taskComment);
        taskCommentService.edit(taskComment);
        verify(taskCommentRepository).save(taskComment);
    }

    @WithMockUser
    @DisplayName("throw access denied exception on editing the comment when the client is not comment author")
    @Test
    void shouldThrowAccessDeniedExceptionOnEditCommentWhenClientIsNotCommentAuthor() {
        assertThrows(AccessDeniedException.class, () -> taskCommentService.edit(new TaskComment()
                .setUser("some user")));
    }

    @WithMockUser
    @DisplayName("throw validation exception on editing the comment when when data is invalid")
    @Test
    void shouldThrowValidationExceptionOnEditCommentWhenDataIsInvalid() {
        assertThrows(ConstraintViolationException.class, () -> taskCommentService.edit(new TaskComment()
                .setUser("user")));
    }

    @WithMockUser
    @DisplayName("delete a comment when the client is a comment author")
    @Test
    void shouldDeleteCommentWhenClientIsCommentAuthor() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("some user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        taskCommentService.delete(taskComment);
        verify(taskCommentRepository).delete(taskComment);
    }

    @WithMockUser
    @DisplayName("throw access denied exception on delete comment when the client is not comment author")
    @Test
    void shouldThrowAccessDeniedExceptionOnDeleteCommentWhenClientIsNotCommentAuthor() {
        assertThrows(AccessDeniedException.class, () -> taskCommentService.delete(new TaskComment()
                .setUser("some user")));
    }

    @DisplayName("get a comment when found")
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
        given(taskCommentRepository.findById(taskComment.getId()))
                .willReturn(Optional.of(taskComment));
        assertEquals(taskCommentService.getById(taskComment.getId()), taskComment);
        verify(taskCommentRepository).findById(taskComment.getId());
    }

    @DisplayName("throw not found exception when comment not found")
    @Test
    void shouldThrowNotFoundExceptionWhenCommentNotFound() {
        Long commentId = 1L;
        given(taskCommentRepository.findById(commentId))
                .willReturn(Optional.empty());
        assertThrows(EntityNotFoundException.class, () -> taskCommentService.getById(commentId));
        verify(taskCommentRepository).findById(commentId);
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
        List<TaskComment> content = taskCommentService.getAll(task.getId(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(taskComment));
        verify(taskCommentRepository).findAllByTaskIdAndParentIdIsNull(task.getId(), pageable);
    }

    @DisplayName("get comment children")
    @Test
    void shouldGetCommentChildren() {
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
        List<TaskComment> content = taskCommentService.getAllByParentId(taskComment.getId(), pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(taskComment));
        verify(taskCommentRepository).findAllByParentId(taskComment.getId(), pageable);
    }

    @WithMockUser
    @DisplayName("get user comments")
    @Test
    void shouldGetUserComments() {
        Task task = new Task()
                .setId(1L)
                .setTitle("task")
                .setDescription("description")
                .setStatus(TaskStatus.PENDING)
                .setPriority(TaskPriority.MEDIUM)
                .setUser("some user");
        TaskComment taskComment = new TaskComment()
                .setTask(task)
                .setContent("content")
                .setUser("user");
        Pageable pageable = Pageable.unpaged();
        given(taskCommentRepository.findAllByUser(taskComment.getUser(), pageable))
                .willReturn(new PageImpl<>(List.of(taskComment)));
        List<TaskComment> content = taskCommentService.getAllByUser(pageable).getContent();
        assertEquals(1, content.size());
        assertTrue(content.contains(taskComment));
        verify(taskCommentRepository).findAllByUser(taskComment.getUser(), pageable);
    }
}
