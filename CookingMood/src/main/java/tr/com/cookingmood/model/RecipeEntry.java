package tr.com.cookingmood.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;

import tr.com.cookingmood.constants.RecipeTypes;
import tr.com.cookingmood.utils.CookingMoodUtils;

@SuppressWarnings("serial")
@Entity(name = "RECIPE_ENTRY")
public class RecipeEntry extends EntityBase {
	@Column(name = "HEADER")
	private String header;
	@Lob
	@Column(name = "INGREDIENTS", length = 100000)
	private String ingredients;
	@Lob
	@Column(name = "ENTRANCE", length = 100000)
	private String entrance;
	@Lob
	@Column(name = "RECIPE", length = 100000)
	private String recipe;

	@Enumerated(EnumType.STRING)
	@Column(name = "RECIPE_TYPE")
	private RecipeTypes recipeType;

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getEntrance() {
		return entrance;
	}

	public void setEntrance(String entrance) {
		this.entrance = entrance;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	

	public RecipeTypes getRecipeType() {
		return recipeType;
	}

	public void setRecipeType(RecipeTypes recipeType) {
		this.recipeType = recipeType;
	}

	public String getWebdavPath() {
		return CookingMoodUtils.getWebdavPath(this.header);
	}

}
