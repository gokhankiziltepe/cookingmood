package tr.com.cookingmood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import tr.com.cookingmood.model.RecipeEntry;
import tr.com.cookingmood.repository.RecipeEntryRepository;

@Service
@Transactional(readOnly = true)
public class RecipeEntryServiceImpl implements RecipeEntryService {

	@Autowired
	private RecipeEntryRepository repository;

	@Override
	@Transactional
	public RecipeEntry save(RecipeEntry blogEntry) {
		return repository.save(blogEntry);
	}

	@Override
	public List<RecipeEntry> findAll() {
		return repository.findAll();
	}

	@Override
	public RecipeEntry findOne(Long id) {
		return repository.findOne(id);
	}

	@Override
	public List<RecipeEntry> findAllActives() {
		return repository.findByActiveTrue();
	}

	@Override
	public List<RecipeEntry> findBySearchText(String text) {
		return repository.findByHeaderContainingIgnoreCaseOrTagsContainingIgnoreCase(text, text);
	}

	@Override
	public RecipeEntry findByWebdavPath(String webdavPath) {
		List<RecipeEntry> result = repository.findByWebdavPathAndActiveTrue(webdavPath);
		if (!CollectionUtils.isEmpty(result)) {
			return result.get(0);
		}
		return null;
	}
}
