package tms.entities.task.out.persistence;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tms.entities.task.TaskComment;

import java.util.Optional;

public interface TaskCommentRepository extends JpaRepository<TaskComment, Long> {

    Page<TaskComment> findAllByTaskIdAndParentIdIsNull(Long taskId, Pageable pageable);

    Page<TaskComment> findAllByParentId(Long parentId, Pageable pageable);

    Page<TaskComment> findAllByUser(String user, Pageable pageable);

    Optional<TaskComment> findByTaskIdAndUser(Long taskId, String user);
}
