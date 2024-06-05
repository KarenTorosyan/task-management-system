package tms.service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import tms.exception.EntityNotFoundException;
import tms.model.TaskComment;
import tms.out.persistence.TaskCommentRepository;

@Service
@Validated
@RequiredArgsConstructor
public class TaskCommentService {

    private final TaskCommentRepository taskCommentRepository;
    private final SecurityContextHolderStrategy strategy = SecurityContextHolder.getContextHolderStrategy();

    @PreAuthorize("isAuthenticated()")
    @Transactional
    public void add(@Valid TaskComment taskComment) {
        taskCommentRepository.save(taskComment.setUser(strategy.getContext().getAuthentication().getName()));
    }

    @PreAuthorize("isAuthenticated() and #taskComment.user eq authentication.name")
    @Transactional
    public void edit(@Valid TaskComment taskComment) {
        taskCommentRepository.save(taskComment);
    }

    @PreAuthorize("isAuthenticated() and #taskComment.user eq authentication.name")
    @Transactional
    public void delete(TaskComment taskComment) {
        taskCommentRepository.delete(taskComment);
    }

    @Transactional(readOnly = true)
    public TaskComment getById(Long commentId) {
        return taskCommentRepository.findById(commentId)
                .orElseThrow(() -> new EntityNotFoundException("Comment not found!", "comment_not_found", commentId));
    }

    @Transactional(readOnly = true)
    public Page<TaskComment> getAll(Long taskId, Pageable pageable) {
        return taskCommentRepository.findAllByTaskIdAndParentIdIsNull(taskId, pageable);
    }

    @Transactional(readOnly = true)
    public Page<TaskComment> getAllByParentId(Long parentId, Pageable pageable) {
        return taskCommentRepository.findAllByParentId(parentId, pageable);
    }

    @Transactional(readOnly = true)
    public Page<TaskComment> getAllByUser(Pageable pageable) {
        return taskCommentRepository.findAllByUser(strategy.getContext().getAuthentication().getName(), pageable);
    }
}
