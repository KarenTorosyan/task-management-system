package tms.out.index.elasticsearch;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import tms.model.Task;
import tms.model.TaskPriority;
import tms.model.TaskStatus;

import java.util.Objects;

@Document(indexName = "tasks")
@Getter
@Setter
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TaskDocument {

    @Id
    private Long id;

    @Field(name = "title", type = FieldType.Keyword)
    private String title;

    @Field(name = "description", type = FieldType.Text)
    private String description;

    @Field(name = "status", type = FieldType.Keyword)
    private TaskStatus status;

    @Field(name = "priority", type = FieldType.Keyword)
    private TaskPriority priority;

    @Field(name = "user", type = FieldType.Keyword)
    private String user;

    public static TaskDocument from(Task task) {
        return new TaskDocument()
                .setId(task.getId())
                .setTitle(task.getTitle())
                .setDescription(task.getDescription())
                .setStatus(task.getStatus())
                .setPriority(task.getPriority())
                .setUser(task.getUser());
    }

    public Task getTask() {
        return new Task()
                .setId(id)
                .setTitle(title)
                .setDescription(description)
                .setStatus(status)
                .setPriority(priority)
                .setUser(user);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TaskDocument that = (TaskDocument) o;
        return Objects.equals(getId(), that.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}
