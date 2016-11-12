package tr.com.cookingmood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.EntityBase;

@Transactional
public interface EntityBaseRepository extends JpaRepository<EntityBase, Long> {

}
