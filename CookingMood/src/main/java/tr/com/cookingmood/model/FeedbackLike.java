package tr.com.cookingmood.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity(name = "FEEDBACK_LIKE")
public class FeedbackLike extends EntityBase {

	@ManyToOne(cascade = CascadeType.MERGE, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "ENTITY_BASE_ID")
	private EntityBase likedEntity;

	public EntityBase getLikedEntity() {
		return likedEntity;
	}

	public void setLikedEntity(EntityBase likedEntity) {
		this.likedEntity = likedEntity;
	}

}
