package tms.entities.task;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.Accessors;

import java.util.Set;

@Entity
@Table(name = "tasks")
@Getter
@Setter
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(exclude = {"employees", "comments"})
@ToString(exclude = {"employees", "comments"})
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private TaskStatus status;

    @Enumerated(EnumType.STRING)
    @Column(name = "priority")
    private TaskPriority priority;

    @Column(name = "\"user\"")
    private String user;

    @OneToMany(mappedBy = "task")
    private Set<TaskEmployee> employees;

    @OneToMany(mappedBy = "task")
    private Set<TaskComment> comments;
}
