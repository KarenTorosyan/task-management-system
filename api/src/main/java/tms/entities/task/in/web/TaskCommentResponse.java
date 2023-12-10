package tms.entities.task.in.web;

import tms.entities.task.TaskComment;

public record TaskCommentResponse(
        Long id,
        Long taskId,
        Long parentId,
        String content,
        String user) {

    public static TaskCommentResponse from(TaskComment taskComment) {
        return new TaskCommentResponse(
                taskComment.getId(),
                taskComment.getTask().getId(),
                taskComment.getParent() != null ? taskComment.getParent().getId() : null,
                taskComment.getContent(),
                taskComment.getUser()
        );
    }
}
