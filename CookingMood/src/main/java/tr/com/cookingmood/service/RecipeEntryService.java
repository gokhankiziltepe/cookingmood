package tr.com.cookingmood.service;

import java.util.List;

import tr.com.cookingmood.model.BlogEntry;
import tr.com.cookingmood.model.RecipeEntry;

public interface RecipeEntryService {

	RecipeEntry save(RecipeEntry entityBase);

	List<RecipeEntry> findAll();

	List<RecipeEntry> findAllActives();

	RecipeEntry findOne(Long id);

	List<RecipeEntry> findBySearchText(String text);

	RecipeEntry findByWebdavPath(String webdavPath);
}
