package tr.com.cookingmood.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import tr.com.cookingmood.model.FeedbackComment;

@Transactional
public interface FeedbackCommentRepository extends JpaRepository<FeedbackComment, Long> {
	List<FeedbackComment> findByLikedEntity_IdOrderByLikedEntity_CreateDateDesc(Long id);

	List<FeedbackComment> findByLikedEntity_IdAndActiveTrueOrderByLikedEntity_CreateDateDesc(Long id);
}
