package tr.com.cookingmood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.FeedbackComment;
import tr.com.cookingmood.repository.FeedbackCommentRepository;

@Service
@Transactional(readOnly = true)
public class FeedbackCommentServiceImpl implements FeedbackCommentService {
	@Autowired
	private FeedbackCommentRepository repository;

	@Override
	@Transactional
	public FeedbackComment save(FeedbackComment feedbackComment) {
		return repository.save(feedbackComment);
	}

	@Override
	public List<FeedbackComment> findByLikedEntity(Long id) {
		return repository.findByLikedEntity_IdAndActiveTrueOrderByCreateDateDesc(id);
	}

	@Override
	public FeedbackComment findOne(Long id) {
		return repository.findOne(id);
	}

	@Override
	public List<FeedbackComment> findByLikedEntityAll(Long id) {
		return repository.findByLikedEntity_IdOrderByCreateDateDesc(id);
	}

}
