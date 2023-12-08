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
}
