package tr.com.cookingmood.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tr.com.cookingmood.constants.BlogTypes;
import tr.com.cookingmood.constants.RecipeTypes;
import tr.com.cookingmood.model.FooterContent;
import tr.com.cookingmood.service.FooterContentService;

public class CommonFieldInterceptor extends HandlerInterceptorAdapter {
	@Value("${webdav.base}")
	private String webdavBase;
	@Autowired
	private FooterContentService footerContentService;

	public static final String PATH = "path";
	public static final String RECIPE_TYPES = "recipeTypes";
	public static final String BLOG_TYPES = "blogTypes";
	public static final String WEBDAV_BASE = "webdavBase";
	public static final String FOOTER_CONTENTS = "footerContents";

	@Override
	public void postHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler,
			final ModelAndView modelAndView) throws Exception {
		String servletPath = request.getServletPath();
		if (modelAndView != null) {
			modelAndView.getModelMap().addAttribute(RECIPE_TYPES, RecipeTypes.values());
			modelAndView.getModelMap().addAttribute(BLOG_TYPES, BlogTypes.values());
			modelAndView.getModelMap().addAttribute(WEBDAV_BASE, webdavBase);
			modelAndView.getModelMap().addAttribute(PATH, servletPath);

			if (servletPath.indexOf("/admin") < 0) {
				List<FooterContent> selectedItems = new ArrayList<>();
				List<FooterContent> footerContents = footerContentService.findAllActives();
				if (!CollectionUtils.isEmpty(footerContents) && footerContents.size() > 3) {
					final int[] ints = new Random().ints(0, footerContents.size()).distinct().limit(3).toArray();
					for (int index : ints) {
						selectedItems.add(footerContents.get(index));
					}
					modelAndView.getModelMap().addAttribute(FOOTER_CONTENTS, selectedItems);
				} else {
					modelAndView.getModelMap().addAttribute(FOOTER_CONTENTS, footerContents);
				}
			}
		}
	}
}