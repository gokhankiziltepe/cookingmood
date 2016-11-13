package tr.com.cookingmood.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.github.sardine.DavResource;
import com.github.sardine.Sardine;
import com.github.sardine.SardineFactory;

import tr.com.cookingmood.model.FeedbackComment;
import tr.com.cookingmood.model.RecipeEntry;
import tr.com.cookingmood.service.FeedbackCommentService;
import tr.com.cookingmood.service.RecipeEntryService;
import tr.com.cookingmood.utils.CookingMoodUtils;

@Controller
public class SiteController {
	@Autowired
	private RecipeEntryService recipeEntryService;
	@Autowired
	private FeedbackCommentService feedbackCommentService;

	@Value("${webdav.path}")
	private String webdavPath;
	@Value("${webdav.username}")
	private String webdavUsername;
	@Value("${webdav.password}")
	private String webdavPassword;

	@RequestMapping(value = "/recipe", method = RequestMethod.GET)
	public ModelAndView admin() {
		Map<String, Object> modelMap = new HashMap<>();
		return new ModelAndView("recipe", modelMap);
	}

	@RequestMapping(value = "/recipe/{id}", method = RequestMethod.GET)
	public ModelAndView admin(@PathVariable("id") Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		RecipeEntry recipeEntry = recipeEntryService.findOne(id);
		modelMap.put("recipeDetail", recipeEntry);
		modelMap.put("entityBaseId", id);

		List<FeedbackComment> comments = feedbackCommentService.findByLikedEntity(id);
		modelMap.put("comments", comments);

		Sardine sardine = SardineFactory.begin("test", "test");

		List<String> headerImagePaths = new ArrayList<>();
		List<DavResource> resources = sardine
				.list(webdavPath + "/images/recipe/" + recipeEntry.getWebdavPath() + "/header");
		for (DavResource res : resources) {
			String path = res.getPath();
			if (CookingMoodUtils.isValidResourcePath(path)) {
				headerImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
			}
		}
		modelMap.put("headerImagePaths", headerImagePaths);

		List<String> recipeImagePaths = new ArrayList<>();
		resources = sardine.list(webdavPath + "/images/recipe/" + recipeEntry.getWebdavPath() + "/recipe");
		for (DavResource res : resources) {
			String path = res.getPath();
			if (CookingMoodUtils.isValidResourcePath(path)) {
				recipeImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
			}
		}
		modelMap.put("recipeImagePaths", recipeImagePaths);
		return new ModelAndView("recipe-detail", modelMap);
	}

}
