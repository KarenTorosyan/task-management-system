package tms.out.sso;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import tms.model.User;
import tms.out.persistence.TaskCommentRepository;
import tms.out.persistence.TaskEmployeeRepository;
import tms.out.persistence.TaskRepository;

@Component
@RequiredArgsConstructor
public class UserEvent {

    private final TaskRepository taskRepository;
    private final TaskCommentRepository taskCommentRepository;
    private final TaskEmployeeRepository taskEmployeeRepository;

    public void onRemove(User user) {
        taskRepository.deleteAll(taskRepository.findAllByUser(user.getId(), Pageable.unpaged()));
        taskCommentRepository.deleteAll(taskCommentRepository.findAllByUser(user.getId(), Pageable.unpaged()));
        taskEmployeeRepository.deleteAll(taskEmployeeRepository.findAllByEmployee(user.getId(), Pageable.unpaged()));
    }
}
