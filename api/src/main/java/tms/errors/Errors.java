package tms.errors;

import tms.entities.task.TaskEmployee;

import java.util.List;

public class Errors {

    public static RequiredParamException emailOrPreferredUsernameRequiredInJwt() {
        String message = "The email or preferred_username required in jwt!";
        throw new RequiredParamException(message, "jwt_required_email_or_preferred_username");
    }

    public static NoAccessException noEnoughAccess(String user) {
        return new NoAccessException("No enough access!", "no_enough_access", user);
    }

    public static EnumConflictException invalidEnumValue(List<String> available, String value) {
        String message = "Use any of " + available + " instead " + value;
        return new EnumConflictException(message, "enum_type_invalid", available, value);
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

    public static EntityNotFoundException taskCommentNotFound(Long taskId, Long commentId) {
        return new EntityNotFoundException("The comment not found!", "task_comment_not_found", taskId, commentId);
    }

    public static SortConflictException canNotSortByTextSearchField(String field) {
        String message = "Cannot sort by '" + field + "' because text search fields are not sortable";
        return new SortConflictException(message, "can_not_sort_by_text_search_field", field);
    }

    public static SortConflictException invalidSortField(String field) {
        String message = "Invalid sort field";
        return new SortConflictException(message, "invalid_sort_field", field);
    }
}
