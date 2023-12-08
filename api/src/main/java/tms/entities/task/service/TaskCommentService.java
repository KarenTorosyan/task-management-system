package tms.entities.task.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.entities.task.TaskComment;

public interface TaskCommentService {

    void save(TaskComment taskComment);

    void delete(TaskComment taskComment);

    TaskComment get(Long taskId, String user);

    Page<TaskComment> getAll(Long taskId, Pageable pageable);

    Page<TaskComment> getAllByParentId(Long parentId, Pageable pageable);

    Page<TaskComment> getAllByUser(String user, Pageable pageable);
}
