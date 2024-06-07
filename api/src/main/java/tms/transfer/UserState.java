package tms.transfer;

import tms.model.User;

public record UserState(
        String id,
        String email,
        String name,
        String image
) {

    public static UserState from(User user) {
        return new UserState(
                user.getId(),
                user.getEmail(),
                user.getName(),
                user.getImage());
    }
}
