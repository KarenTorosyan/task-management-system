package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import tms.entities.task.TaskComment;

public record TaskCommentAddRequest(
        @JsonProperty(required = true)
        @NotBlank(message = "{required}")
        @Size(min = 1, max = 1000, message = "{size_constraint}")
        String content,

        @JsonProperty
        @Schema(nullable = true)
        Long parentId) {

    @JsonIgnore
    public TaskComment getComment() {
        return new TaskComment()
                .setContent(content);
    }

    @JsonIgnore
    public Long getCommentParentId() {
        return parentId;
    }
}
