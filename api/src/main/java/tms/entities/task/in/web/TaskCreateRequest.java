package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import tms.entities.task.Task;
import tms.entities.task.TaskPriority;

public record TaskCreateRequest(
        @JsonProperty(required = true)
        @NotBlank(message = "{required}")
        @Size(min = 1, max = 100, message = "{size_constraint}")
        String title,

        @JsonProperty
        @Size(max = 3000, message = "{size_constraint}")
        String description,

        @JsonProperty(required = true)
        TaskPriority priority) {

    @JsonIgnore
    public Task getTask() {
        return new Task()
                .setTitle(title)
                .setDescription(description)
                .setPriority(priority);
    }
}
