package tms.entities.task.in.web;

import tms.entities.task.TaskEmployee;

public record TaskEmployeeResponse(
        Long id,
        Long taskId,
        String employee) {

    public static TaskEmployeeResponse from(TaskEmployee taskEmployee) {
        return new TaskEmployeeResponse(
                taskEmployee.getId(),
                taskEmployee.getTask().getId(),
                taskEmployee.getEmployee());
    }
}
