package tms.entities.task.in.web;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import tms.errors.Errors;

import java.util.Arrays;

@Component
public class TaskUserTypeConverter implements Converter<String, TaskUserType> {

    @Override
    public TaskUserType convert(@NonNull String source) {
        try {
            TaskUserType.valueOf(source.toUpperCase());
        } catch (Exception e) {
            throw Errors.invalidEnumValue(Arrays.stream(TaskUserType.values())
                    .map(Enum::name)
                    .toList(), source);
        }
        return TaskUserType.valueOf(source.toUpperCase());
    }
}
