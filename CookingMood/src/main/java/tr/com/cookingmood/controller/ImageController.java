package tr.com.cookingmood.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.sardine.Sardine;
import com.github.sardine.SardineFactory;

import tr.com.cookingmood.utils.CookingMoodUtils;

@Controller
public class ImageController {
	static final Logger LOGGER = LoggerFactory.getLogger(ImageController.class);

	@Value("${webdav.path}")
	private String webdavPath;
	@Value("${webdav.username}")
	private String webdavUsername;
	@Value("${webdav.password}")
	private String webdavPassword;

	@RequestMapping(value = "/admin/image/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteImage(@RequestParam("path") String path) throws IOException {
		Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
		sardine.delete(webdavPath + path);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/image/put", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> putImage(@RequestParam("imageFile") MultipartFile file,
			@RequestParam("resourceId") Long resourceId, @RequestParam("imageType") String type) throws IOException {
		Sardine sardine = SardineFactory.begin(webdavUsername, webdavPassword);
		StringBuilder path = new StringBuilder();
		path.append(webdavPath + "/images");
		if (!sardine.exists(path.toString())) {
			sardine.createDirectory(path.toString());
		}
		path.append("/" + type);
		if (!sardine.exists(path.toString())) {
			sardine.createDirectory(path.toString());
		}
		path.append("/" + resourceId);
		if (!sardine.exists(path.toString())) {
			sardine.createDirectory(path.toString());
		}

		path.append("/" + CookingMoodUtils.generateRandomFileName());
		sardine.put(path.toString(), CookingMoodUtils.resizeImage(file.getBytes(), type));
		return new HashMap<>();
	}

}
