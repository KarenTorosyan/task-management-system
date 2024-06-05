package tms.transfer;

import tms.model.Task;
import tms.model.TaskPriority;
import tms.model.TaskStatus;

public record TaskState(
        Long id,
        String title,
        String description,
        TaskStatus status,
        TaskPriority priority,
        String user
) {

    public static TaskState from(Task task) {
        return new TaskState(
                task.getId(),
                task.getTitle(),
                task.getDescription(),
                task.getStatus(),
                task.getPriority(),
                task.getUser());
    }
}
