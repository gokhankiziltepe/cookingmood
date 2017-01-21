package tr.com.cookingmood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import tr.com.cookingmood.model.BlogEntry;
import tr.com.cookingmood.repository.BlogEntryRepository;

@Service
@Transactional(readOnly = true)
public class BlogEntryServiceImpl implements BlogEntryService {

	@Autowired
	private BlogEntryRepository repository;

	@Override
	@Transactional
	public BlogEntry save(BlogEntry blogEntry) {
		return repository.save(blogEntry);
	}

	@Override
	public List<BlogEntry> findAll() {
		return repository.findAll();
	}

	@Override
	public BlogEntry findOne(Long id) {
		return repository.findOne(id);
	}

	@Override
	public List<BlogEntry> findAllActives() {
		return repository.findByActiveTrueOrderByItemOrderAsc();
	}

	@Override
	public BlogEntry findByWebdavPath(String webdavPath) {
		List<BlogEntry> result = repository.findByWebdavPathAndActiveTrueOrderByItemOrderAsc(webdavPath);
		if (!CollectionUtils.isEmpty(result)) {
			return result.get(0);
		}
		return null;
	}
}
