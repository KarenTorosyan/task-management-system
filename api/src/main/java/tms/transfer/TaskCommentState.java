package tms.transfer;

import tms.model.TaskComment;

public record TaskCommentState(
        Long id,
        Long taskId,
        Long parentId,
        String content,
        String user) {

    public static TaskCommentState from(TaskComment taskComment) {
        return new TaskCommentState(
                taskComment.getId(),
                taskComment.getTask().getId(),
                taskComment.getParent() != null ? taskComment.getParent().getId() : null,
                taskComment.getContent(),
                taskComment.getUser());
    }
}
