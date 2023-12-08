package tms.errors;

import tms.entities.task.TaskEmployee;

public class Errors {

    public static RequiredParamException emailOrPreferredUsernameRequiredInJwt() {
        String message = "The email or preferred_username required in jwt!";
        throw new RequiredParamException(message, "jwt_required_email_or_preferred_username");
    }

    public static EntityNotFoundException taskNotFound(Long taskId) {
        return new EntityNotFoundException("The task not found!", "task_not_found", taskId);
    }

    public static EntityConflictException taskEmployeeDuplicate(TaskEmployee taskEmployee) {
        return new EntityConflictException("The employee duplicate!", "add_task_employee_duplicate", taskEmployee);
    }

    public static EntityNotFoundException taskEmployeeNotFound(Long taskId, String employee) {
        return new EntityNotFoundException("The employee not found!", "task_employee_not_found", taskId, employee);
    }

    public static EntityNotFoundException taskCommentNotFound(Long taskId, String user) {
        return new EntityNotFoundException("The comment not found!", "task_comment_not_found", taskId, user);
    }
}
