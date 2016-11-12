package tr.com.cookingmood.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import tr.com.cookingmood.constants.RecipeTypes;

public class CommonFieldInterceptor extends HandlerInterceptorAdapter {
	@Value("${webdav.base}")
	private String webdavBase;

	public static final String PATH = "path";
	public static final String RECIPE_TYPES = "recipeTypes";
	public static final String WEBDAV_BASE = "webdavBase";

	@Override
	public void postHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler,
			final ModelAndView modelAndView) throws Exception {
		if (modelAndView != null) {
			modelAndView.getModelMap().addAttribute(RECIPE_TYPES, RecipeTypes.values());
			modelAndView.getModelMap().addAttribute(WEBDAV_BASE, webdavBase);
			modelAndView.getModelMap().addAttribute(PATH, request.getServletPath());
		}
	}
}