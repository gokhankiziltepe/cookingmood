package tr.com.cookingmood.service;

import java.util.List;

import tr.com.cookingmood.model.BlogEntry;

public interface BlogEntryService {

	BlogEntry save(BlogEntry entityBase);
	
	List<BlogEntry> findAll();

	BlogEntry findOne(Long id);

}
