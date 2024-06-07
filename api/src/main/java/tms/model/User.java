package tms.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import tms.util.OnCreate;

import java.util.Objects;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
public class User {

    private String id;

    @NotBlank(message = "required")
    @Email(message = "email_constraint")
    @Size(max = 100, message = "size_constraint")
    private String email;

    @Size(max = 100, message = "size_constraint")
    private String name;

    @Size(max = 300, message = "size_constraint")
    private String image;

    @NotBlank(message = "required", groups = OnCreate.class)
    @Size(min = 8, max = 100, message = "size_constraint", groups = OnCreate.class)
    private String password;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(getId(), user.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }
}
