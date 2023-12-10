package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import tms.entities.task.TaskComment;

public record TaskCommentEditRequest(
        @JsonProperty(required = true)
        @NotBlank(message = "{required}")
        @Size(max = 1000, message = "{size_constraint}")
        String content) {

    @JsonIgnore
    public TaskComment modify(TaskComment taskComment) {
        return taskComment.setContent(content);
    }
}
