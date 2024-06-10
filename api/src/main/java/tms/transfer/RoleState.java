package tms.transfer;

import tms.model.Role;

public record RoleState(Integer id, String name, String description) {

    public static RoleState from(Role role) {
        return new RoleState(role.getId(), role.getName(), role.getDescription());
    }
}
