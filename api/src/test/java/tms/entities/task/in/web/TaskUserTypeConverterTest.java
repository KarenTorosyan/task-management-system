package tms.entities.task.in.web;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import tms.errors.EnumConflictException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@SpringBootTest
@ContextConfiguration(classes = TaskUserTypeConverter.class)
public class TaskUserTypeConverterTest {

    @Autowired
    private TaskUserTypeConverter taskUserTypeConverter;

    @DisplayName("convert defined UPPERCASE value to any of TaskUserType types")
    @Test
    void shouldConvertDefinedUpperCaseValueToTaskUserType() {
        assertThat(taskUserTypeConverter.convert(TaskUserType.USER.name()))
                .isEqualTo(TaskUserType.USER);
    }

    @DisplayName("convert defined UPPERCASE value to any of TaskUserType types")
    @Test
    void shouldConvertDefinedLowerCaseValueToTaskUserType() {
        assertThat(taskUserTypeConverter.convert(TaskUserType.USER.name().toLowerCase()))
                .isEqualTo(TaskUserType.USER);
    }

    @DisplayName("throw error when convert defined value isn't any of TaskUserType types")
    @Test
    void shouldThrowErrorWhenConvertDefinedValueIsNotAnyOfTaskUserTypeTypes() {
        assertThatThrownBy(() -> taskUserTypeConverter.convert("value"))
                .isInstanceOf(EnumConflictException.class);
    }
}
