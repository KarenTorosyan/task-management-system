package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.TaskComment;

public record TaskCommentEditBody(
        String content) {

    @JsonIgnore
    public TaskComment modify(TaskComment taskComment) {
        return taskComment
                .setContent(content);
    }
}
