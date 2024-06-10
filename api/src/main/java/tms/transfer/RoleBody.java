package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.Role;

public record RoleBody(
        String name,
        String description,
        boolean superRole,
        boolean defaultRole) {

    @JsonIgnore
    public Role getRole() {
        return new Role()
                .setName(name)
                .setDescription(description)
                .setSuperRole(superRole)
                .setDefaultRole(defaultRole);
    }

    @JsonIgnore
    public Role modify(Role role) {
        return role.setName(name)
                .setDescription(description)
                .setSuperRole(superRole)
                .setDefaultRole(defaultRole);
    }
}
