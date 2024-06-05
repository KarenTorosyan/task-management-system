package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.TaskComment;

public record TaskCommentBody(
        String content,
        Long parentId) {

    @JsonIgnore
    public TaskComment getTaskComment() {
        return new TaskComment()
                .setContent(content);
    }
}
