package tms.out.sso;

import com.inversoft.error.Errors;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import tms.model.User;

import java.util.function.BiConsumer;
import java.util.function.Function;

public interface FusionAuthSearchEngine {

    Page<User> searchUsers(String query, Pageable pageable, Function<io.fusionauth.domain.User, User> converter, BiConsumer<Errors, Exception> errorHandler);

    Page<User> matchAll(Pageable pageable, Function<io.fusionauth.domain.User, User> converter, BiConsumer<Errors, Exception> errorHandler);
}
