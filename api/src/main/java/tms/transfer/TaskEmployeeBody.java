package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.TaskEmployee;

public record TaskEmployeeBody(
        String user) {

    @JsonIgnore
    public TaskEmployee getTaskEmployee() {
        return new TaskEmployee()
                .setEmployee(user);
    }
}
