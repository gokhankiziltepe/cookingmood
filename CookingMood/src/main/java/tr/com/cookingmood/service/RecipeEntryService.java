package tr.com.cookingmood.service;

import java.util.List;

import tr.com.cookingmood.model.RecipeEntry;

public interface RecipeEntryService {

	RecipeEntry save(RecipeEntry entityBase);

	List<RecipeEntry> findAll();

	RecipeEntry findOne(Long id);

}
