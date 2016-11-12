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

import tr.com.cookingmood.constants.RecipeDifficulties;
import tr.com.cookingmood.constants.RecipeTypes;
import tr.com.cookingmood.model.RecipeEntry;
import tr.com.cookingmood.service.RecipeEntryService;

@Controller
public class RecipeEntryController {
	static final Logger LOGGER = LoggerFactory.getLogger(RecipeEntryController.class);
	@Autowired
	private RecipeEntryService recipeEntryService;

	@RequestMapping(value = "/admin/recipe-entry/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> recipeEntry(@RequestParam(value = "id", required = false) Long id,
			@RequestParam("recipeHeader") String recipeHeader,
			@RequestParam("recipeIngredient") String recipeIngredient,
			@RequestParam("recipeEntrance") String recipeEntrance, @RequestParam("recipeRecipe") String recipeRecipe,
			@RequestParam("recipeType") RecipeTypes recipeType,
			@RequestParam("recipeDifficulty") RecipeDifficulties recipeDifficulty,
			@RequestParam("recipeTool") String recipeTool, @RequestParam("recipeTag") String recipeTag,
			@RequestParam("recipeDuration") int recipeDuration) {
		RecipeEntry recipeEntry = null;
		if (id != null) {
			recipeEntry = recipeEntryService.findOne(id);
		} else {
			recipeEntry = new RecipeEntry();
		}
		recipeEntry.setHeader(recipeHeader);
		recipeEntry.setTags(recipeTag);
		recipeEntry.setIngredients(recipeIngredient);
		recipeEntry.setTools(recipeTool);
		recipeEntry.setEntrance(recipeEntrance);
		recipeEntry.setRecipe(recipeRecipe);
		recipeEntry.setRecipeType(recipeType);
		recipeEntry.setRecipeDifficulty(recipeDifficulty);
		recipeEntry.setDurationInMinutes(recipeDuration);
		recipeEntryService.save(recipeEntry);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/recipe-entry/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteRecipeEntry(@RequestParam("id") Long id) {
		RecipeEntry recipeEntry = recipeEntryService.findOne(id);
		recipeEntry.setActive(false);
		recipeEntryService.save(recipeEntry);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/recipe-entry/activate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> activateRecipeEntry(@RequestParam("id") Long id) {
		RecipeEntry recipeEntry = recipeEntryService.findOne(id);
		recipeEntry.setActive(true);
		recipeEntryService.save(recipeEntry);
		return new HashMap<>();
	}

}
