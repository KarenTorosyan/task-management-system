package tms.entities.task.in.web;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import tms.entities.task.TaskPriority;
import tms.errors.EnumConflictException;

import java.io.IOException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;

@ExtendWith(MockitoExtension.class)
public class TaskPriorityJsonDeserializerTest {

    @Mock
    private JsonParser jsonParser;

    @Mock
    private DeserializationContext deserializationContext;

    @DisplayName("deserialize defined UPPERCASE value to task priority when value any of TaskPriority types")
    @Test
    void shouldDeserializeDefinedUppercaseValueToTaskPriorityWhenValueAnyOfTaskPriorityTypes() throws IOException {
        given(jsonParser.getValueAsString())
                .willReturn(TaskPriority.HIGH.name());
        assertThat(new TaskPriorityJsonDeserializer()
                .deserialize(jsonParser, deserializationContext))
                .isEqualTo(TaskPriority.HIGH);
    }

    @DisplayName("deserialize defined LOWERCASE value to task priority when value any of TaskPriority types")
    @Test
    void shouldDeserializeDefinedLowerCaseValueToTaskPriorityWhenValueAnyOfTaskPriorityTypes() throws IOException {
        given(jsonParser.getValueAsString())
                .willReturn(TaskPriority.HIGH.name().toLowerCase());
        assertThat(new TaskPriorityJsonDeserializer()
                .deserialize(jsonParser, deserializationContext))
                .isEqualTo(TaskPriority.HIGH);
    }

    @DisplayName("throw error when defined value isn't of TaskPriority types")
    @Test
    void throwErrorWhenDefinedValueIsNotAnyOfTaskPriorityTypes() throws IOException {
        String value = "value";
        given(jsonParser.getValueAsString())
                .willReturn(value);
        assertThatThrownBy(() -> new TaskPriorityJsonDeserializer()
                .deserialize(jsonParser, deserializationContext))
                .isInstanceOf(EnumConflictException.class);
    }
}
