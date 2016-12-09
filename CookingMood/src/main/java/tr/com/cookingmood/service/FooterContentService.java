package tr.com.cookingmood.service;

import java.util.List;

import tr.com.cookingmood.model.FooterContent;

public interface FooterContentService {

	FooterContent save(FooterContent entityBase);

	List<FooterContent> findAll();

	List<FooterContent> findAllActives();

	FooterContent findOne(Long id);

}
