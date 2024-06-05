package tms.transfer;

import tms.model.TaskEmployee;

public record TaskEmployeeState(
        Long id,
        Long taskId,
        String user) {

    public static TaskEmployeeState from(TaskEmployee employee) {
        return new TaskEmployeeState(
                employee.getId(),
                employee.getTask().getId(),
                employee.getEmployee());
    }
}
