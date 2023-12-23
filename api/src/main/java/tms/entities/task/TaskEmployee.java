package tms.entities.task;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.Accessors;

import java.util.Objects;

@Entity
@Table(name = "task_employees")
@Getter
@Setter
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = "task")
public class TaskEmployee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "task_id")
    private Task task;

    @Column(name = "employee")
    private String employee;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TaskEmployee taskEmployee = (TaskEmployee) o;
        return Objects.equals(getTask().getId(), taskEmployee.getTask().getId())
                && Objects.equals(getEmployee(), taskEmployee.getEmployee());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getTask().getId(), getEmployee());
    }
}
