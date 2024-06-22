package tms.util;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.domain.Page;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

@Getter
@Setter
public class PageOf<T> {

    private Collection<T> content;
    private int page;
    private int size;
    private long total;
    private int totalPages;
    private boolean first;
    private boolean last;
    private List<Sorted> sorted = new LinkedList<>();

    public record Sorted(String property, String direction) {
    }

    public PageOf(Page<T> page) {
        this.content = page.getContent();
        this.page = page.getNumber();
        this.size = page.getSize();
        this.total = page.getTotalElements();
        this.totalPages = page.getTotalPages();
        this.first = page.isFirst();
        this.last = page.isLast();
        page.getSort().stream().forEach(order -> this.sorted.add(new Sorted(order.getProperty(), order.getDirection().name())));
    }
}
