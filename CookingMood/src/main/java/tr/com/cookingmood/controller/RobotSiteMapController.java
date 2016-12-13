package tr.com.cookingmood.controller;

import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tr.com.cookingmood.sitemap.XmlUrl;
import tr.com.cookingmood.sitemap.XmlUrl.Priority;
import tr.com.cookingmood.sitemap.XmlUrlSet;

@Controller
public class RobotSiteMapController {
	static final Logger LOGGER = LoggerFactory.getLogger(RobotSiteMapController.class);
	@Value("${site.base}")
	private String siteBase;

	@RequestMapping(value = { "/robots", "/robot", "/robot.txt", "/robots.txt", "/null" }, method = RequestMethod.GET)
	public @ResponseBody void robot(HttpServletResponse response) {
		InputStream resourceAsStream = null;
		try {

			ClassLoader classLoader = getClass().getClassLoader();
			resourceAsStream = classLoader.getResourceAsStream("robots.txt");
			response.addHeader("Content-disposition", "filename=robots.txt");
			response.setContentType("text/plain");
			IOUtils.copy(resourceAsStream, response.getOutputStream());
			response.flushBuffer();
		} catch (Exception e) {
			LOGGER.error("Problem with displaying robots.txt", e);
		}
	}

	@RequestMapping(value = "/sitemap.xml", method = RequestMethod.GET)
	@ResponseBody
	public XmlUrlSet main() {
		XmlUrlSet xmlUrlSet = new XmlUrlSet();
		create(xmlUrlSet, "", Priority.HIGH);
		create(xmlUrlSet, "/tarif", Priority.HIGH);
		create(xmlUrlSet, "/blog", Priority.HIGH);
		create(xmlUrlSet, "/about-me", Priority.MEDIUM);
		create(xmlUrlSet, "/contact-me", Priority.MEDIUM);

		return xmlUrlSet;
	}

	private void create(XmlUrlSet xmlUrlSet, String link, Priority priority) {
		xmlUrlSet.addUrl(new XmlUrl(siteBase + link, priority));
	}

}
