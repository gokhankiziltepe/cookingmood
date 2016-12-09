package tr.com.cookingmood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.FooterContent;
import tr.com.cookingmood.repository.FooterContentRepository;

@Service
@Transactional(readOnly = true)
public class FooterContentServiceImpl implements FooterContentService {

	@Autowired
	private FooterContentRepository repository;

	@Override
	@Transactional
	public FooterContent save(FooterContent entry) {
		return repository.save(entry);
	}

	@Override
	public List<FooterContent> findAll() {
		return repository.findAll();
	}

	@Override
	public FooterContent findOne(Long id) {
		return repository.findOne(id);
	}

	@Override
	public List<FooterContent> findAllActives() {
		return repository.findByActiveTrue();
	}
}
