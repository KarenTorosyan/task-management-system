package tms.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.proxy.HibernateProxy;
import tms.util.OnCreate;

import java.util.Objects;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Accessors(chain = true)
@ToString(exclude = {"sessions", "roles"})
@Entity
@Table(name = "users")
@NamedEntityGraph(name = "User", attributeNodes = @NamedAttributeNode("roles"))
public class User {

    @Id
    @Column(name = "id")
    @JsonProperty("id")
    private String id;

    @NotBlank(message = "required")
    @Email(message = "email_constraint")
    @Size(max = 100, message = "size_constraint")
    @Column(name = "email", unique = true)
    @JsonProperty("email")
    private String email;

    @Size(max = 100, message = "size_constraint")
    @Column(name = "name")
    @JsonProperty("name")
    private String name;

    @Size(max = 300, message = "size_constraint")
    @Column(name = "image")
    @JsonProperty("image")
    private String image;

    @NotBlank(message = "required", groups = OnCreate.class)
    @Size(min = 8, max = 100, message = "size_constraint", groups = OnCreate.class)
    @Column(name = "password")
    @JsonProperty("password")
    private String password;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Set<Session> sessions;

    @ManyToMany
    @JoinTable(name = "users_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    @JsonIgnore
    private Set<Role> roles;

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ? ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        User user = (User) o;
        return getId() != null && Objects.equals(getId(), user.getId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() : getClass().hashCode();
    }
}
