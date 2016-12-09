package tr.com.cookingmood.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tr.com.cookingmood.model.FooterContent;
import tr.com.cookingmood.service.FooterContentService;

@Controller
public class FooterContentController {
	static final Logger LOGGER = LoggerFactory.getLogger(FooterContentController.class);
	@Autowired
	private FooterContentService service;

	@RequestMapping(value = "/admin/footer-content/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> footerContent(@RequestParam(value = "id", required = false) Long id,
			@RequestParam("htmlContent") String htmlContent) {
		FooterContent entry = null;
		if (id != null) {
			entry = service.findOne(id);
		} else {
			entry = new FooterContent();
		}
		entry.setHtmlContent(htmlContent);
		service.save(entry);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/footer-content/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteFooterContent(@RequestParam("id") Long id) {
		FooterContent entry = service.findOne(id);
		entry.setActive(false);
		service.save(entry);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/footer-content/activate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> activateFooterContent(@RequestParam("id") Long id) {
		FooterContent entry = service.findOne(id);
		entry.setActive(true);
		service.save(entry);
		return new HashMap<>();
	}

}
