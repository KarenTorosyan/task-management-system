package tms.out.sso;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import tms.model.User;

@Document(indexName = "users")
@Getter
@Setter
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class UserIndex {

    @Id
    @Field(type = FieldType.Keyword)
    private String id;

    @Field(type = FieldType.Keyword)
    private String email;

    @Field(type = FieldType.Text)
    private String name;

    @Field(type = FieldType.Keyword)
    private String image;

    public static UserIndex fromUser(User user) {
        return new UserIndex()
                .setId(user.getId())
                .setEmail(user.getEmail())
                .setName(user.getName())
                .setImage(user.getImage());
    }

    public User getUser() {
        return new User()
                .setId(id)
                .setEmail(email)
                .setName(name)
                .setImage(image);
    }
}
