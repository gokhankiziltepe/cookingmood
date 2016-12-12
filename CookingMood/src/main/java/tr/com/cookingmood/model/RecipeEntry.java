package tr.com.cookingmood.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;

import tr.com.cookingmood.constants.RecipeDifficulties;
import tr.com.cookingmood.constants.RecipeTypes;

@SuppressWarnings("serial")
@Entity(name = "RECIPE_ENTRY")
public class RecipeEntry extends EntityBase {
	@Column(name = "HEADER")
	private String header;
	@Column(name = "WEBDAV_PATH")
	private String webdavPath;
	@Lob
	@Column(name = "INGREDIENTS", length = 50000)
	private String ingredients;
	@Lob
	@Column(name = "TOOLS", length = 50000)
	private String tools;
	@Lob
	@Column(name = "ENTRANCE", length = 50000)
	private String entrance;
	@Lob
	@Column(name = "RECIPE", length = 50000)
	private String recipe;

	@Column(name = "TAGS", length = 1024)
	private String tags;

	@Column(name = "DURATION")
	private int durationInMinutes;

	@Enumerated(EnumType.STRING)
	@Column(name = "RECIPE_TYPE")
	private RecipeTypes recipeType;

	@Enumerated(EnumType.STRING)
	@Column(name = "RECIPE_DIFFICULTY")
	private RecipeDifficulties recipeDifficulty;

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

	public RecipeDifficulties getRecipeDifficulty() {
		return recipeDifficulty;
	}

	public void setRecipeDifficulty(RecipeDifficulties recipeDifficulty) {
		this.recipeDifficulty = recipeDifficulty;
	}

	public RecipeTypes getRecipeType() {
		return recipeType;
	}

	public void setRecipeType(RecipeTypes recipeType) {
		this.recipeType = recipeType;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public int getDurationInMinutes() {
		return durationInMinutes;
	}

	public void setDurationInMinutes(int durationInMinutes) {
		this.durationInMinutes = durationInMinutes;
	}

	public String getTools() {
		return tools;
	}

	public void setTools(String tools) {
		this.tools = tools;
	}

	public String getWebdavPath() {
		return webdavPath;
	}

	public void setWebdavPath(String webdavPath) {
		this.webdavPath = webdavPath;
	}

}
