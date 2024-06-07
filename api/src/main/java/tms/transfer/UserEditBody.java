package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.User;

public record UserEditBody(String name) {

    @JsonIgnore
    public User modify(User user) {
        return user.setName(name);
    }
}
