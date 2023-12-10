package tms.entities.task.in.web;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import tms.entities.task.TaskPriority;
import tms.errors.Errors;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class TaskPriorityJsonDeserializer extends JsonDeserializer<TaskPriority> {

    @Override
    public TaskPriority deserialize(JsonParser p, DeserializationContext context) throws IOException {
        String value = p.getValueAsString();
        try {
            return TaskPriority.valueOf(value.toUpperCase());
        } catch (Exception e) {
            List<String> available = Arrays.stream(TaskPriority.values())
                    .map(Enum::name)
                    .toList();
            throw Errors.invalidEnumValue(available, value);
        }
    }
}
