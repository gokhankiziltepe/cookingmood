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

import tr.com.cookingmood.model.EntityBase;
import tr.com.cookingmood.model.FeedbackLike;
import tr.com.cookingmood.service.EntityBaseService;
import tr.com.cookingmood.service.FeedbackLikeService;

@Controller
public class LikeController {
	static final Logger LOGGER = LoggerFactory.getLogger(LikeController.class);
	@Autowired
	private FeedbackLikeService feedbackLikeService;
	@Autowired
	private EntityBaseService entityBaseService;

	@RequestMapping(value = "/like/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> saveComment(@RequestParam("likedEntityBaseId") Long likedEntityBaseId) {
		FeedbackLike like = new FeedbackLike();
		EntityBase findOne = entityBaseService.findOne(likedEntityBaseId);
		like.setLikedEntity(findOne);
		feedbackLikeService.save(like);
		return new HashMap<>();
	}
}
