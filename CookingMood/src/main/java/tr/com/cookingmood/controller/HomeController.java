package tr.com.cookingmood.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.sardine.DavResource;
import com.github.sardine.Sardine;
import com.github.sardine.SardineFactory;

import tr.com.cookingmood.constants.BlogTypes;
import tr.com.cookingmood.constants.RecipeDifficulties;
import tr.com.cookingmood.constants.RecipeTypes;
import tr.com.cookingmood.model.BlogEntry;
import tr.com.cookingmood.model.FeedbackComment;
import tr.com.cookingmood.model.FooterContent;
import tr.com.cookingmood.model.RecipeEntry;
import tr.com.cookingmood.service.BlogEntryService;
import tr.com.cookingmood.service.FeedbackCommentService;
import tr.com.cookingmood.service.FooterContentService;
import tr.com.cookingmood.service.RecipeEntryService;
import tr.com.cookingmood.utils.CookingMoodUtils;

@Controller
public class HomeController {
	@Autowired
	private BlogEntryService blogEntryService;
	@Autowired
	private RecipeEntryService recipeEntryService;
	@Autowired
	private FooterContentService footerContentService;
	@Autowired
	private FeedbackCommentService feedbackCommentService;

	@Value("${webdav.path}")
	private String webdavPath;
	@Value("${webdav.username}")
	private String webdavUsername;
	@Value("${webdav.password}")
	private String webdavPassword;

	@RequestMapping(value = "/sign-in", method = RequestMethod.GET)
	public String hello(Model model) {
		return "login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(Model model) {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("recipeEntries", recipeEntryService.findAll());
		modelMap.put("blogEntries", blogEntryService.findAll());
		modelMap.put("footerContents", footerContentService.findAll());
		return new ModelAndView("admin", modelMap);
	}

	@RequestMapping(value = "/admin/blog-entry", method = RequestMethod.GET)
	public ModelAndView blogEntry(@RequestParam(value = "id", required = false) Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("blogTypes", BlogTypes.values());
		if (id != null) {
			BlogEntry blogEntry = blogEntryService.findOne(id);
			modelMap.put("blogEntry", blogEntry);
			List<String> headerImagePaths = new ArrayList<>();
			Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
			List<DavResource> resources = sardine.list(webdavPath + "/images/header/" + id);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					headerImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("headerImagePaths", headerImagePaths);
		}
		return new ModelAndView("blog-entry", modelMap);
	}

	@RequestMapping(value = "/admin/recipe-entry", method = RequestMethod.GET)
	public ModelAndView recipeEntry(@RequestParam(value = "id", required = false) Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("recipeTypes", RecipeTypes.values());
		modelMap.put("recipeDifficulties", RecipeDifficulties.values());
		if (id != null) {
			RecipeEntry recipeEntry = recipeEntryService.findOne(id);
			modelMap.put("recipeEntry", recipeEntry);
			List<String> headerImagePaths = new ArrayList<>();
			Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
			List<DavResource> resources = sardine.list(webdavPath + "/images/header/" + id);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					headerImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("headerImagePaths", headerImagePaths);
		}
		return new ModelAndView("recipe-entry", modelMap);
	}

	@RequestMapping(value = "/admin/footer-content", method = RequestMethod.GET)
	public ModelAndView footerContent(@RequestParam(value = "id", required = false) Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		if (id != null) {
			FooterContent entry = footerContentService.findOne(id);
			modelMap.put("footerContent", entry);
		}
		return new ModelAndView("footer-content", modelMap);
	}

	@RequestMapping(value = "/admin/comment-entry", method = RequestMethod.GET)
	public ModelAndView commentEntry(@RequestParam(value = "id", required = false) Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		List<FeedbackComment> comments = feedbackCommentService.findByLikedEntityAll(id);
		modelMap.put("comments", comments);
		return new ModelAndView("comment-entry", modelMap);
	}

	@RequestMapping(value = "/admin/image-entry", method = RequestMethod.GET)
	public ModelAndView imageEntry(@RequestParam(value = "id") Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("resourceId", id);

		Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
		List<String> headerImagePaths = new ArrayList<>();
		String headerImagePath = webdavPath + "/images/header/" + id;
		if (sardine.exists(headerImagePath)) {
			List<DavResource> resources = sardine.list(headerImagePath);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					headerImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("headerImagePaths", headerImagePaths);
		}
		List<String> recipeImagePaths = new ArrayList<>();
		String recipeImagePath = webdavPath + "/images/recipe/" + id;
		if (sardine.exists(recipeImagePath)) {
			List<DavResource> resources = sardine.list(recipeImagePath);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					recipeImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("recipeImagePaths", recipeImagePaths);
		}
		List<String> mainImagePaths = new ArrayList<>();
		String mainImagePath = webdavPath + "/images/main/" + id;
		if (sardine.exists(mainImagePath)) {
			List<DavResource> resources = sardine.list(mainImagePath);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					mainImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("mainImagePaths", mainImagePaths);
		}
		return new ModelAndView("image-entry", modelMap);
	}

}
