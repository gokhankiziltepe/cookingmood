package tr.com.cookingmood.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.sardine.DavResource;
import com.github.sardine.Sardine;
import com.github.sardine.SardineFactory;

import tr.com.cookingmood.model.BlogEntry;
import tr.com.cookingmood.model.FeedbackComment;
import tr.com.cookingmood.model.RecipeEntry;
import tr.com.cookingmood.service.BlogEntryService;
import tr.com.cookingmood.service.FeedbackCommentService;
import tr.com.cookingmood.service.FeedbackLikeService;
import tr.com.cookingmood.service.RecipeEntryService;
import tr.com.cookingmood.utils.CookingMoodUtils;

@Controller
public class SiteController {
	@Autowired
	private RecipeEntryService recipeEntryService;
	@Autowired
	private BlogEntryService blogEntryService;
	@Autowired
	private FeedbackCommentService feedbackCommentService;
	@Autowired
	private FeedbackLikeService feedbackLikeService;

	@Value("${webdav.path}")
	private String webdavPath;
	@Value("${webdav.username}")
	private String webdavUsername;
	@Value("${webdav.password}")
	private String webdavPassword;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		Map<String, Object> modelMap = new HashMap<>();
		return new ModelAndView("home", modelMap);
	}

	@RequestMapping(value = "/about-me", method = RequestMethod.GET)
	public ModelAndView aboutMe() {
		Map<String, Object> modelMap = new HashMap<>();
		return new ModelAndView("about-me", modelMap);
	}

	@RequestMapping(value = "/contact-me", method = RequestMethod.GET)
	public ModelAndView contactMe() {
		Map<String, Object> modelMap = new HashMap<>();
		return new ModelAndView("contact-me", modelMap);
	}

	@RequestMapping(value = "/recipe", method = RequestMethod.GET)
	public ModelAndView recipes(@RequestParam(name = "searchText", required = false) String searchText)
			throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		List<RecipeEntry> activeRecipes = new ArrayList<>();
		if (StringUtils.isEmpty(searchText)) {
			activeRecipes = recipeEntryService.findAllActives();
		} else {
			activeRecipes = recipeEntryService.findBySearchText(searchText);
		}
		if (!CollectionUtils.isEmpty(activeRecipes)) {
			modelMap.put("recipes", activeRecipes);
			Map<Long, Object> likeMap = new HashMap<>();
			Map<Long, String> imageMap = new HashMap<>();
			for (RecipeEntry item : activeRecipes) {
				int countByLikedEntity = feedbackLikeService.countByLikedEntity(item.getId());
				likeMap.put(item.getId(), countByLikedEntity);

				Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
				String url = webdavPath + "/images/main/" + item.getId();
				if (sardine.exists(url)) {
					List<DavResource> resources = sardine.list(url);
					for (DavResource res : resources) {
						String path = res.getPath();
						if (CookingMoodUtils.isValidResourcePath(path)) {
							imageMap.put(item.getId(), res.getHref().getPath());
							break;
						}
					}
				}
			}
			modelMap.put("likeMap", likeMap);
			modelMap.put("imageMap", imageMap);
		}
		return new ModelAndView("recipes", modelMap);
	}

	@RequestMapping(value = "/recipe/{id}", method = RequestMethod.GET)
	public ModelAndView recipeDetail(@PathVariable("id") Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		RecipeEntry recipeEntry = recipeEntryService.findOne(id);
		modelMap.put("recipeDetail", recipeEntry);
		modelMap.put("entityBaseId", id);

		List<FeedbackComment> comments = feedbackCommentService.findByLikedEntity(id);
		modelMap.put("comments", comments);

		Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);

		String url = webdavPath + "/images/header/" + recipeEntry.getId();
		if (sardine.exists(url)) {
			List<String> headerImagePaths = new ArrayList<>();
			List<DavResource> resources = sardine.list(url);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					headerImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("headerImagePaths", headerImagePaths);
		}
		url = webdavPath + "/images/recipe/" + recipeEntry.getId();
		if (sardine.exists(url)) {
			List<String> recipeImagePaths = new ArrayList<>();
			List<DavResource> resources = sardine.list(url);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					recipeImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("recipeImagePaths", recipeImagePaths);
		}
		return new ModelAndView("recipe-detail", modelMap);
	}

	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public ModelAndView blogs() throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		List<BlogEntry> activeBlogs = blogEntryService.findAllActives();

		if (!CollectionUtils.isEmpty(activeBlogs)) {
			modelMap.put("blogs", activeBlogs);
			Map<Long, Object> likeMap = new HashMap<>();
			Map<Long, String> imageMap = new HashMap<>();
			for (BlogEntry item : activeBlogs) {
				int countByLikedEntity = feedbackLikeService.countByLikedEntity(item.getId());
				likeMap.put(item.getId(), countByLikedEntity);

				Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
				String url = webdavPath + "/images/main/" + item.getId();
				if (sardine.exists(url)) {
					List<DavResource> resources = sardine.list(url);
					for (DavResource res : resources) {
						String path = res.getPath();
						if (CookingMoodUtils.isValidResourcePath(path)) {
							imageMap.put(item.getId(), res.getHref().getPath());
							break;
						}
					}
				}
			}
			modelMap.put("likeMap", likeMap);
			modelMap.put("imageMap", imageMap);
		}
		return new ModelAndView("blogs", modelMap);
	}

	@RequestMapping(value = "/blog/{id}", method = RequestMethod.GET)
	public ModelAndView blogDetail(@PathVariable("id") Long id) throws IOException {
		Map<String, Object> modelMap = new HashMap<>();
		BlogEntry blogEntry = blogEntryService.findOne(id);
		modelMap.put("blogDetail", blogEntry);
		modelMap.put("entityBaseId", id);

		List<FeedbackComment> comments = feedbackCommentService.findByLikedEntity(id);
		modelMap.put("comments", comments);

		Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);

		String url = webdavPath + "/images/header/" + blogEntry.getId();
		if (sardine.exists(url)) {
			List<String> headerImagePaths = new ArrayList<>();
			List<DavResource> resources = sardine.list(url);
			for (DavResource res : resources) {
				String path = res.getPath();
				if (CookingMoodUtils.isValidResourcePath(path)) {
					headerImagePaths.add(CookingMoodUtils.getWebdavResourcePath(path));
				}
			}
			modelMap.put("headerImagePaths", headerImagePaths);
		}

		return new ModelAndView("blog-detail", modelMap);
	}

}
