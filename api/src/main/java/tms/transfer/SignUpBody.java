package tms.transfer;

import com.fasterxml.jackson.annotation.JsonIgnore;
import tms.model.User;

public record SignUpBody(
        String email,
        String password,
        String name
) {

    @JsonIgnore
    public User getUser() {
        return new User()
                .setEmail(email)
                .setPassword(password)
                .setName(name);
    }
}
