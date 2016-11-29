package tr.com.cookingmood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.FeedbackLike;
import tr.com.cookingmood.repository.FeedbackLikeRepository;

@Service
@Transactional(readOnly = true)
public class FeedbackLikeServiceImpl implements FeedbackLikeService {
	@Autowired
	private FeedbackLikeRepository repository;

	@Override
	@Transactional
	public FeedbackLike save(FeedbackLike feedbackLike) {
		return repository.save(feedbackLike);
	}

	@Override
	public int countByLikedEntity(Long id) {
		return repository.countByLikedEntity_Id(id);
	}

}
