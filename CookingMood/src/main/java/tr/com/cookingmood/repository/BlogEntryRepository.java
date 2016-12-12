package tr.com.cookingmood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.BlogEntry;

@Transactional
public interface BlogEntryRepository extends JpaRepository<BlogEntry, Long> {
	List<BlogEntry> findByActiveTrue();

	List<BlogEntry> findByWebdavPathAndActiveTrue(String webdavPath);
}
