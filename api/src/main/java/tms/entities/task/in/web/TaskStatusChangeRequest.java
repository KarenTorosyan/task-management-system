package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import tms.entities.task.Task;
import tms.entities.task.TaskStatus;

public record TaskStatusChangeRequest(
        @JsonProperty(required = true)
        TaskStatus status) {

    @JsonIgnore
    public Task modify(Task task) {
        return task.setStatus(status);
    }
}
