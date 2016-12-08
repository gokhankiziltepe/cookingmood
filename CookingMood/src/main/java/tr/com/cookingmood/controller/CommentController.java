package tr.com.cookingmood.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tr.com.cookingmood.model.EntityBase;
import tr.com.cookingmood.model.FeedbackComment;
import tr.com.cookingmood.service.EntityBaseService;
import tr.com.cookingmood.service.FeedbackCommentService;

@Controller
public class CommentController {
	static final Logger LOGGER = LoggerFactory.getLogger(CommentController.class);
	@Autowired
	private FeedbackCommentService feedbackCommentService;
	@Autowired
	private EntityBaseService entityBaseService;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/comment/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> saveComment(@RequestParam("commentText") String commentText,
			@RequestParam("commentName") String commentName, @RequestParam("commentEmail") String commentEmail,
			@RequestParam("commentEntityBaseId") Long commentEntityBaseId) {
		FeedbackComment comment = new FeedbackComment();
		comment.setText(commentText);
		comment.setName(commentName);
		comment.setEmail(commentEmail);
		EntityBase findOne = entityBaseService.findOne(commentEntityBaseId);
		comment.setLikedEntity(findOne);
		feedbackCommentService.save(comment);
		return new HashMap<>();
	}

	@RequestMapping(value = "/contact/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> saveContact(@RequestParam("name") String name,
			@RequestParam("message") String message, @RequestParam("email") String email) {
		SimpleMailMessage emailMessage = new SimpleMailMessage();

		emailMessage.setFrom("info@cookingmood.co");
		emailMessage.setTo("info@cookingmood.co");
		emailMessage.setSubject("İletişim Formu");

		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("Ad-Soyad: ");
		stringBuilder.append(name);
		stringBuilder.append("\n\n");

		stringBuilder.append("E-posta: ");
		stringBuilder.append(email);
		stringBuilder.append("\n\n");

		stringBuilder.append("Mesaj: ");
		stringBuilder.append(message);
		stringBuilder.append("\n\n");

		emailMessage.setText(stringBuilder.toString());
		mailSender.send(emailMessage);
		return new HashMap<>();
	}

	@RequestMapping(value = "/comment/get/{entityBaseId}", method = RequestMethod.GET)
	public ModelAndView getComment(@PathVariable("entityBaseId") Long entityBaseId) {
		Map<String, Object> modelMap = new HashMap<>();
		List<FeedbackComment> comments = feedbackCommentService.findByLikedEntity(entityBaseId);
		modelMap.put("comments", comments);
		return new ModelAndView("fragments/site/comment :: comment", modelMap);
	}

	@RequestMapping(value = "/admin/comment-entry/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteBlogEntry(@RequestParam("id") Long id) {
		FeedbackComment comment = feedbackCommentService.findOne(id);
		comment.setActive(false);
		feedbackCommentService.save(comment);
		return new HashMap<>();
	}

	@RequestMapping(value = "/admin/comment-entry/activate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> activateBlogEntry(@RequestParam("id") Long id) {
		FeedbackComment comment = feedbackCommentService.findOne(id);
		comment.setActive(true);
		feedbackCommentService.save(comment);
		return new HashMap<>();
	}
}
