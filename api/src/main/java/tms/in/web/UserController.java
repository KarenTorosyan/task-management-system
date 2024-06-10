package tms.in.web;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tms.config.security.BearerTokenExtractor;
import tms.config.security.RefreshTokenExtractor;
import tms.config.swagger.annotation.*;
import tms.model.AuthToken;
import tms.model.User;
import tms.service.FileTransferService;
import tms.service.UserService;
import tms.transfer.*;
import tms.util.PageOf;

import java.net.URI;
import java.nio.file.Path;

@RestController
@RequiredArgsConstructor
@Tag(name = "User")
public class UserController {

    private final UserService userService;
    private final FileTransferService fileTransferService;
    private final BearerTokenExtractor bearerTokenExtractor;
    private final RefreshTokenExtractor refreshTokenExtractor;

    @GetMapping("/users/current")
    @DocGetProtectedEntry(summary = "Get authenticated user")
    ResponseEntity<UserState> getUser() {
        return ResponseEntity.ok(UserState.from(userService.getUser()));
    }

    @GetMapping("/users/{user}")
    @DocGetPublicEntry(summary = "Get a user")
    ResponseEntity<UserState> getUser(@PathVariable("user") String user) {
        return ResponseEntity.ok(UserState.from(userService.getUser(user)));
    }

    @GetMapping("/users/email")
    @DocGetPublicEntry(summary = "Get user by attribute")
    ResponseEntity<UserState> getUserByEmail(@RequestParam(required = false) String email) {
        if (email != null) {
            return ResponseEntity.ok(UserState.from(userService.getUserByEmail(email)));
        }
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/users/signUp")
    @DocPostPublicEntry(summary = "Sign up")
    ResponseEntity<Void> signUp(@RequestBody SignUpBody body) {
        User user = body.getUser();
        User ready = userService.signUp(user);
        URI location = URI.create("/users/").resolve(ready.getId());
        return ResponseEntity.created(location).build();
    }

    @PostMapping("/users/signIn")
    @DocPostPublicEntry(summary = "Sign in")
    ResponseEntity<?> signIn(@RequestBody SignInBody body,
                             @RequestParam(defaultValue = "true") boolean cookies,
                             HttpServletResponse response) {
        AuthToken authToken = userService.signIn(body.email(), body.password());
        if (cookies) {
            bearerTokenExtractor.injectCookie(response, authToken.token());
            refreshTokenExtractor.injectCookie(response, authToken.refreshToken());
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(authToken);
    }

    @PostMapping("/users/signOut")
    @DocPostProtectedEntry(summary = "Sign out")
    ResponseEntity<Void> signOut(HttpServletRequest request,
                                 HttpServletResponse response) {
        String refreshToken = refreshTokenExtractor.extract(request);
        userService.signOut(refreshToken);
        bearerTokenExtractor.clearCookie(response);
        refreshTokenExtractor.clearCookie(response);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/users/refreshToken")
    @DocPostProtectedEntry(summary = "Refresh the token")
    ResponseEntity<?> refreshToken(HttpServletRequest request,
                                   @RequestParam(defaultValue = "true") boolean cookies,
                                   HttpServletResponse response) {
        String refreshToken = refreshTokenExtractor.extract(request);
        AuthToken authToken = userService.refreshToken(refreshToken);
        if (cookies) {
            bearerTokenExtractor.injectCookie(response, authToken.token());
            refreshTokenExtractor.injectCookie(response, authToken.refreshToken());
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(authToken);
    }

    @PostMapping(value = "/users/image", consumes = "multipart/form-data")
    @DocPostProtectedEntry(summary = "Set a user image")
    ResponseEntity<Void> setImage(@RequestPart MultipartFile image) {
        User user = userService.getUser();
        Path location = fileTransferService.transfer(image, path -> path);
        user.setImage(location.toString());
        userService.editUser(user);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/users/image")
    @DocGetProtectedEntry(summary = "Get a user image")
    ResponseEntity<byte[]> getImage() {
        User user = userService.getUser();
        if (user.getImage() == null) {
            return ResponseEntity.notFound().build();
        }
        String image = user.getImage();
        String ext = image.substring(image.lastIndexOf(".") + 1);
        byte[] content = fileTransferService.read(Path.of(image));
        return ResponseEntity.ok()
                .contentType(new MediaType("image", ext))
                .contentLength(content.length)
                .body(content);
    }

    @PutMapping("/users")
    @DocPutProtectedEntry(summary = "Edit a user")
    ResponseEntity<Void> editUser(@RequestBody UserEditBody body) {
        User user = userService.getUser();
        userService.editUser(body.modify(user));
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/users")
    @DocDeleteProtectedEntry(summary = "Remove account")
    ResponseEntity<Void> deleteUser() {
        User user = userService.getUser();
        String image = user.getImage();
        if (image != null) {
            fileTransferService.remove(Path.of(user.getImage()));
        }
        userService.removeUser(user);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/users")
    @DocGetProtectedEntriesPage(summary = "Get users",
            description = "This request requires admin access")
    ResponseEntity<PageOf<UserState>> getUsers(@DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(userService.getUsers(pageable)
                .map(UserState::from)));
    }

    @GetMapping("/users/search")
    @DocGetProtectedEntriesPage(summary = "Search users",
            description = "This request requires admin access")
    ResponseEntity<PageOf<UserState>> searchUsers(@RequestParam String query,
                                                  @DocInvisibleParam Pageable pageable) {
        return ResponseEntity.ok(new PageOf<>(userService.searchUsers(query, pageable)
                .map(UserState::from)));
    }

    @GetMapping("/users/sessions")
    @DocGetProtectedEntry(summary = "Get user sessions")
    ResponseEntity<PageOf<SessionState>> sessions(@DocInvisibleParam Pageable pageable,
                                                  HttpServletRequest request) {
        User user = userService.getUser();
        String refreshToken = refreshTokenExtractor.extract(request);
        return ResponseEntity.ok(new PageOf<>(userService.getSessions(user.getId(), pageable)
                .map(session -> SessionState.from(session, refreshToken))));
    }

    @DeleteMapping("/users/sessions{sessId}")
    @DocDeleteProtectedEntry(summary = "Delete a user session")
    ResponseEntity<Void> deleteSession(@PathVariable String sessId) {
        userService.removeSession(userService.getSession(sessId));
        return ResponseEntity.noContent().build();
    }
}
