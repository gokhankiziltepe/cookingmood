package tr.com.cookingmood.service;

import tr.com.cookingmood.model.EntityBase;

public interface EntityBaseService {

	EntityBase save(EntityBase entityBase);

	EntityBase findOne(Long id);

}
