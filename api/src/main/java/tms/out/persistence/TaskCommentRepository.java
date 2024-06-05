package tms.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.model.TaskComment;

public interface TaskCommentRepository extends JpaRepository<TaskComment, Long> {

    Page<TaskComment> findAllByTaskIdAndParentIdIsNull(Long taskId, Pageable pageable);

    Page<TaskComment> findAllByParentId(Long parentId, Pageable pageable);

    Page<TaskComment> findAllByUser(String user, Pageable pageable);
}
