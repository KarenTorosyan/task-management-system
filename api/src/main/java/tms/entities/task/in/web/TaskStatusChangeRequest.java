package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import tms.entities.task.Task;
import tms.entities.task.TaskStatus;

public record TaskStatusChangeRequest(
        @JsonProperty(required = true)
        @JsonDeserialize(using = TaskStatusJsonDeserializer.class)
        TaskStatus status) {

    @JsonIgnore
    public Task modify(Task task) {
        return task.setStatus(status);
    }
}
