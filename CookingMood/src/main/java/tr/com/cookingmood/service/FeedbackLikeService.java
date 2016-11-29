package tr.com.cookingmood.service;

import tr.com.cookingmood.model.FeedbackLike;

public interface FeedbackLikeService {
	FeedbackLike save(FeedbackLike feedbackLike);

	int countByLikedEntity(Long id);
}
