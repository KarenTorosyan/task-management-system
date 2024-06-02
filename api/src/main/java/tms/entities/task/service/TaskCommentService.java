package tms.entities.task.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tms.entities.task.TaskComment;
import tms.entities.task.out.persistence.TaskCommentRepository;
import tms.errors.Errors;

@Service
@RequiredArgsConstructor
public class TaskCommentService {

    private final TaskCommentRepository taskCommentRepository;

    @Transactional
    public void save(TaskComment taskComment) {
        taskCommentRepository.save(taskComment);
    }

    @Transactional
    public void delete(TaskComment taskComment) {
        taskCommentRepository.delete(taskComment);
    }

    @Transactional(readOnly = true)
    public TaskComment get(Long taskId, Long commentId) {
        return taskCommentRepository.findByTaskIdAndId(taskId, commentId)
                .orElseThrow(() -> Errors.taskCommentNotFound(taskId, commentId));
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
    public Page<TaskComment> getAllByUser(String user, Pageable pageable) {
        return taskCommentRepository.findAllByUser(user, pageable);
    }
}
