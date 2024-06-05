package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.Task;
import tms.model.TaskPriority;
import tms.model.TaskStatus;

public record TaskBody(
        String title,
        String description,
        TaskPriority priority,
        TaskStatus status) {

    @JsonIgnore
    public Task getTask() {
        return new Task()
                .setTitle(title)
                .setDescription(description)
                .setPriority(priority)
                .setStatus(status);
    }

    @JsonIgnore
    public Task modify(Task task) {
        return task
                .setTitle(title)
                .setDescription(description)
                .setPriority(priority)
                .setStatus(status);
    }
}
