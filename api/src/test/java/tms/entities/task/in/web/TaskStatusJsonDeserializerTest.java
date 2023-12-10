package tms.entities.task.in.web;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import tms.entities.task.TaskStatus;
import tms.errors.EnumConflictException;

import java.io.IOException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.BDDMockito.given;

@ExtendWith(MockitoExtension.class)
public class TaskStatusJsonDeserializerTest {

    @Mock
    private JsonParser jsonParser;

    @Mock
    private DeserializationContext deserializationContext;

    @DisplayName("deserialize defined UPPERCASE value to task priority when value any of TaskStatus types")
    @Test
    void shouldDeserializeDefinedUppercaseValueToTaskPriorityWhenValueAnyOfTaskStatusTypes() throws IOException {
        given(jsonParser.getValueAsString())
                .willReturn(TaskStatus.PROCESS.name());
        assertThat(new TaskStatusJsonDeserializer()
                .deserialize(jsonParser, deserializationContext))
                .isEqualTo(TaskStatus.PROCESS);
    }

    @DisplayName("deserialize defined LOWERCASE value to task priority when value any of TaskStatus types")
    @Test
    void shouldDeserializeDefinedLowerCaseValueToTaskPriorityWhenValueAnyOfTaskStatusTypes() throws IOException {
        given(jsonParser.getValueAsString())
                .willReturn(TaskStatus.PROCESS.name().toLowerCase());
        assertThat(new TaskStatusJsonDeserializer()
                .deserialize(jsonParser, deserializationContext))
                .isEqualTo(TaskStatus.PROCESS);
    }

    @DisplayName("throw error when defined value isn't of TaskStatus types")
    @Test
    void throwErrorWhenDefinedValueIsNotAnyOfTaskStatusTypes() throws IOException {
        String value = "value";
        given(jsonParser.getValueAsString())
                .willReturn(value);
        assertThatThrownBy(() -> new TaskStatusJsonDeserializer()
                .deserialize(jsonParser, deserializationContext))
                .isInstanceOf(EnumConflictException.class);
    }
}
