package tr.com.cookingmood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.EntityBase;
import tr.com.cookingmood.repository.EntityBaseRepository;

@Service
@Transactional(readOnly = true)
public class EntityBaseServiceImpl implements EntityBaseService {

	@Autowired
	private EntityBaseRepository repository;

	@Override
	@Transactional
	public EntityBase save(EntityBase entityBase) {
		return repository.save(entityBase);
	}
}
