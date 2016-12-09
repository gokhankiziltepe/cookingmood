package tr.com.cookingmood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.FooterContent;

@Transactional
public interface FooterContentRepository extends JpaRepository<FooterContent, Long> {
	List<FooterContent> findByActiveTrue();
}
