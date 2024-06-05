package tms.util;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.domain.Page;

import java.util.Collection;

@Getter
@Setter
public class PageOf<T> {

    private Collection<T> content;
    private int page;
    private int size;
    private int total;
    private int totalPages;
    private boolean first;
    private boolean last;

    public PageOf(Page<T> page) {
        this.content = page.getContent();
        this.page = page.getNumber();
        this.size = page.getSize();
        this.total = page.getTotalPages();
        this.first = page.isFirst();
        this.last = page.isLast();
    }
}
