package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;

public record TaskEditRequest(
        @JsonProperty(required = true)
        @NotBlank(message = "{required}")
        @Size(min = 1, max = 100, message = "{size_constraint}")
        String title,

        @JsonProperty
        @Size(max = 3000, message = "{size_constraint}")
        String description,

        @JsonProperty(required = true)
        @JsonDeserialize(using = TaskPriorityJsonDeserializer.class)
        TaskPriority priority) {

    @JsonIgnore
    public Task modify(Task task) {
        return task
                .setTitle(title)
                .setDescription(description)
                .setPriority(priority);
    }
}
