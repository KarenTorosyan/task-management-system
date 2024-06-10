package tms;

import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.transaction.support.TransactionOperations;
import tms.exception.EntityNotFoundException;
import tms.model.Role;
import tms.model.User;
import tms.out.persistence.RoleRepository;
import tms.out.persistence.UserRepository;
import tms.service.UserService;

import java.util.Objects;
import java.util.UUID;

@SpringBootApplication
@ConfigurationPropertiesScan
public class Starter {
    public static void main(String[] args) {
        SpringApplication.run(Starter.class, args);
    }

    @ConditionalOnProperty(value = "sso.provider", havingValue = "local")
    @Profile("!test")
    @Bean
    ApplicationRunner initState(RoleRepository roleRepository, UserService userService, UserRepository userRepository, TransactionOperations transaction) {
        return args -> {
            Role adminRole = transaction.execute(status -> roleRepository.findByName("admin")
                    .orElseGet(() -> roleRepository.save(new Role().setName("admin").setDescription("Super role").setSuperRole(true))));
            try {
                userService.getUserByEmail("pubappadm@outlook.com");
            } catch (EntityNotFoundException e) {
                User user = userService.signUp(new User()
                        .setId(UUID.randomUUID().toString())
                        .setEmail("pubappadm@outlook.com")
                        .setName("Admin")
                        .setPassword("password"));
                transaction.executeWithoutResult(status -> userRepository.addRole(user.getId(), Objects.requireNonNull(adminRole).getId()));
            }
        };
    }
}
