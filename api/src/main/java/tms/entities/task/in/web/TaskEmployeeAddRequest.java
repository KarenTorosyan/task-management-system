package tms.entities.task.in.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import tms.entities.task.TaskEmployee;

public record TaskEmployeeAddRequest(
        @JsonProperty(required = true)
        @NotBlank(message = "{required}")
        @Size(min = 1, max = 100, message = "{size_constraint}")
        String employee) {

    @JsonIgnore
    public TaskEmployee getTaskEmployee() {
        return new TaskEmployee()
                .setEmployee(employee);
    }
}
