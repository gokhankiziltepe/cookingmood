package tr.com.cookingmood.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tr.com.cookingmood.constants.BlogTypes;
import tr.com.cookingmood.constants.RecipeDifficulties;
import tr.com.cookingmood.constants.RecipeTypes;
import tr.com.cookingmood.model.BlogEntry;
import tr.com.cookingmood.model.RecipeEntry;
import tr.com.cookingmood.service.BlogEntryService;
import tr.com.cookingmood.service.RecipeEntryService;

@Controller
public class HomeController {
	@Autowired
	private BlogEntryService blogEntryService;
	@Autowired
	private RecipeEntryService recipeEntryService;

	@RequestMapping(value = "/sign-in", method = RequestMethod.GET)
	public String hello(Model model) {
		return "login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(Model model) {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("recipeEntries", recipeEntryService.findAll());
		modelMap.put("blogEntries", blogEntryService.findAll());
		return new ModelAndView("admin", modelMap);
	}

	@RequestMapping(value = "/admin/blog-entry", method = RequestMethod.GET)
	public ModelAndView blogEntry(@RequestParam(value = "id", required = false) Long id) {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("blogTypes", BlogTypes.values());
		if (id != null) {
			BlogEntry blogEntry = blogEntryService.findOne(id);
			modelMap.put("blogEntry", blogEntry);
		}
		return new ModelAndView("blog-entry", modelMap);
	}

	@RequestMapping(value = "/admin/recipe-entry", method = RequestMethod.GET)
	public ModelAndView recipeEntry(@RequestParam(value = "id", required = false) Long id) {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("recipeTypes", RecipeTypes.values());
		modelMap.put("recipeDifficulties", RecipeDifficulties.values());
		if (id != null) {
			RecipeEntry recipeEntry = recipeEntryService.findOne(id);
			modelMap.put("recipeEntry", recipeEntry);
		}
		return new ModelAndView("recipe-entry", modelMap);
	}

}
