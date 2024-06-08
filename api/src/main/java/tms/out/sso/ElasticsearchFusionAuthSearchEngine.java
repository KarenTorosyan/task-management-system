package tms.out.sso;

import com.inversoft.error.Errors;
import com.inversoft.rest.ClientResponse;
import io.fusionauth.client.FusionAuthClient;
import io.fusionauth.domain.api.user.SearchRequest;
import io.fusionauth.domain.api.user.SearchResponse;
import io.fusionauth.domain.search.Sort;
import io.fusionauth.domain.search.SortField;
import io.fusionauth.domain.search.UserSearchCriteria;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import tms.model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.Function;

@ConditionalOnProperty(name = "sso.search-engine", havingValue = "elasticsearch", matchIfMissing = true)
@Component
@RequiredArgsConstructor
public class ElasticsearchFusionAuthSearchEngine implements FusionAuthSearchEngine {

    private final FusionAuthClient fusionAuthClient;

    @Override
    public Page<User> searchUsers(String query, Pageable pageable, Function<io.fusionauth.domain.User, User> converter, BiConsumer<Errors, Exception> errorHandler) {
        UserSearchCriteria userSearchCriteria = new UserSearchCriteria();
        userSearchCriteria.query = """
                {
                    "bool": {
                        "should": [
                            {
                                "term": {
                                    "id": {
                                        "value": "%query%"
                                    }
                                }
                            },
                            {
                                "term": {
                                    "email": {
                                        "value": "%query%"
                                    }
                                }
                            },
                            {
                                "match": {
                                    "fullName": {
                                        "query": "%query%"
                                    }
                                }
                            }
                        ]
                    }
                }
                """.replaceAll("%query%", query);
        userSearchCriteria.startRow = Math.toIntExact(pageable.getOffset());
        userSearchCriteria.numberOfResults = pageable.getPageSize();
        userSearchCriteria.sortFields = pageable.getSort().stream()
                .map(sort -> new SortField(sort.getProperty(), Sort.valueOf(sort.getDirection().name().toLowerCase())))
                .toList();

        ClientResponse<SearchResponse, Errors> response = fusionAuthClient.searchUsersByQuery(new SearchRequest(userSearchCriteria));

        List<User> users = new ArrayList<>(0);

        if (response.wasSuccessful()) {
            users.addAll(response.successResponse.users.stream()
                    .map(converter)
                    .toList());
        }

        errorHandler.accept(response.errorResponse, response.exception);

        return new PageImpl<>(users, pageable, response.successResponse.total);
    }
}
