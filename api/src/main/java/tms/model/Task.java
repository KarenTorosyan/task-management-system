package tms.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.proxy.HibernateProxy;
import tms.util.AnyOf;

import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "tasks")
@Getter
@Setter
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = {"employees", "comments"})
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @JsonProperty(value = "id")
    private Long id;

    @Column(name = "title")
    @JsonProperty("title")
    @NotBlank(message = "required")
    @Size(min = 1, max = 100, message = "size_constraint")
    private String title;

    @Column(name = "description")
    @JsonProperty("description")
    @Size(max = 3000, message = "size_constraint")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    @JsonProperty("status")
    @AnyOf(TaskStatus.class)
    private TaskStatus status;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "priority")
    @JsonProperty("priority")
    @AnyOf(TaskPriority.class)
    private TaskPriority priority;

    @Column(name = "\"user\"")
    @JsonProperty("user")
    private String user;

    @OneToMany(mappedBy = "task")
    @JsonIgnore
    private Set<TaskEmployee> employees;

    @OneToMany(mappedBy = "task")
    @JsonIgnore
    private Set<TaskComment> comments;

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ?
                ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ?
                ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        Task task = (Task) o;
        return Objects.equals(getId(), task.getId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ?
                ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() :
                getClass().hashCode();
    }
}
