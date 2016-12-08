package tr.com.cookingmood.service;

import java.util.List;

import tr.com.cookingmood.model.FeedbackComment;

public interface FeedbackCommentService {
	FeedbackComment save(FeedbackComment feedbackComment);

	List<FeedbackComment> findByLikedEntity(Long id);

	List<FeedbackComment> findByLikedEntityAll(Long id);

	FeedbackComment findOne(Long id);
}
