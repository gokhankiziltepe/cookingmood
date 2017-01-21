package tr.com.cookingmood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.RecipeEntry;

@Transactional
public interface RecipeEntryRepository extends JpaRepository<RecipeEntry, Long> {

	List<RecipeEntry> findByActiveTrueOrderByItemOrderAsc();

	List<RecipeEntry> findByHeaderContainingIgnoreCaseOrTagsContainingIgnoreCaseOrderByItemOrderAsc(String header, String tags);

	List<RecipeEntry> findByWebdavPathAndActiveTrueOrderByItemOrderAsc(String webdavPath);

}
