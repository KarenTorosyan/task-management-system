package tms.in.web;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tms.config.swagger.annotation.*;
import tms.model.Role;
import tms.service.RoleService;
import tms.transfer.RoleBody;
import tms.transfer.RoleState;
import tms.util.PageOf;

import java.net.URI;

@ConditionalOnBean(RoleService.class)
@RestController
@RequiredArgsConstructor
@Tag(name = "Role")
public class RoleController {

    private final RoleService roleService;

    @PostMapping("/roles")
    @DocPostProtectedEntry(summary = "Create a role")
    ResponseEntity<Void> createRole(@RequestBody RoleBody body) {
        Role ready = roleService.createRole(body.getRole());
        URI location = URI.create("/roles/" + ready.getId());
        return ResponseEntity.created(location).build();
    }

    @PutMapping("/roles/{roleId}")
    @DocPutProtectedEntry(summary = "Edit a role")
    ResponseEntity<Void> editRole(@PathVariable Integer roleId,
                                  @RequestBody RoleBody body) {
        Role role = roleService.getRole(roleId);
        roleService.editRole(body.modify(role));
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/roles/{roleId}")
    @DocGetProtectedEntry(summary = "Get a role")
    ResponseEntity<RoleState> getRole(@PathVariable Integer roleId) {
        return ResponseEntity.ok(RoleState.from(roleService.getRole(roleId)));
    }

    @GetMapping("/roles/name/{name}")
    @DocGetProtectedEntry(summary = "Get role by name")
    ResponseEntity<RoleState> getRoleByName(@PathVariable String name) {
        return ResponseEntity.ok(RoleState.from(roleService.getRoleByName(name)));
    }

    @GetMapping("/roles")
    @DocGetProtectedEntry(summary = "Get roles")
    ResponseEntity<PageOf<RoleState>> getRoles(@DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(roleService.getRoles(pageable)
                .map(RoleState::from)));
    }

    @GetMapping("/roles/super")
    @DocGetProtectedEntry(summary = "Get super roles")
    ResponseEntity<PageOf<RoleState>> getSuperRoles(@DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(roleService.getSuperRoles(pageable)
                .map(RoleState::from)));
    }

    @GetMapping("/roles/defaults")
    @DocGetProtectedEntry(summary = "Get default roles")
    ResponseEntity<PageOf<RoleState>> getDefaultRoles(@DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(roleService.getDefaultRoles(pageable)
                .map(RoleState::from)));
    }

    @DeleteMapping("/roles/{roleId}")
    @DocDeleteProtectedEntry(summary = "Remove a role")
    ResponseEntity<Void> removeRole(@PathVariable Integer roleId) {
        roleService.revokeRole(roleService.getRole(roleId));
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/users/{userId}/roles/{roleId}")
    @DocPostProtectedEntry(summary = "Assign a role")
    ResponseEntity<Void> addRole(@PathVariable String userId, @PathVariable Integer roleId) {
        roleService.assignRole(userId, roleId);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/users/{userId}/roles/{roleId}")
    @DocDeleteProtectedEntry(summary = "Revoke a role")
    ResponseEntity<Void> removeRole(@PathVariable String userId, @PathVariable Integer roleId) {
        roleService.revokeRole(userId, roleId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/users/{userId}/roles")
    @DocGetProtectedEntriesPage(summary = "Get roles")
    ResponseEntity<PageOf<RoleState>> getUserRoles(@PathVariable String userId,
                                                   @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(roleService.getUserRoles(userId, pageable)
                .map(RoleState::from)));
    }
}
