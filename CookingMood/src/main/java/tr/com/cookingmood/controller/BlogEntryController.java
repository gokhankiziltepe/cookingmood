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

import tr.com.cookingmood.constants.BlogTypes;
import tr.com.cookingmood.model.BlogEntry;
import tr.com.cookingmood.service.BlogEntryService;

@Controller
public class BlogEntryController {
	static final Logger LOGGER = LoggerFactory.getLogger(BlogEntryController.class);
	@Autowired
	private BlogEntryService blogEntryService;

	@RequestMapping(value = "/admin/blog-entry/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> blogEntry(@RequestParam(value = "id", required = false) Long id,
			@RequestParam("blogHeader") String header, @RequestParam("blogContent") String content,
			@RequestParam("blogType") BlogTypes blogType, @RequestParam("blogTag") String blogTag) {
		BlogEntry blogEntry = null;
		if (id != null) {
			blogEntry = blogEntryService.findOne(id);
		} else {
			blogEntry = new BlogEntry();
		}
		blogEntry.setHeader(header);
		blogEntry.setText(content);
		blogEntry.setTags(blogTag);
		blogEntry.setBlogType(blogType);
		blogEntryService.save(blogEntry);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/blog-entry/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteBlogEntry(@RequestParam("id") Long id) {
		BlogEntry blogEntry = blogEntryService.findOne(id);
		blogEntry.setActive(false);
		blogEntryService.save(blogEntry);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/blog-entry/activate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> activateBlogEntry(@RequestParam("id") Long id) {
		BlogEntry blogEntry = blogEntryService.findOne(id);
		blogEntry.setActive(true);
		blogEntryService.save(blogEntry);
		return new HashMap<>();
	}

}
