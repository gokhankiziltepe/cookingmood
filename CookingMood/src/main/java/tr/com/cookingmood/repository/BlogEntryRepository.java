package tr.com.cookingmood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.BlogEntry;

@Transactional
public interface BlogEntryRepository extends JpaRepository<BlogEntry, Long> {

}
