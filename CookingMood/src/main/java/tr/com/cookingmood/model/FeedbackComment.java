package tr.com.cookingmood.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity(name = "FEEDBACK_COMMENT")
public class FeedbackComment extends EntityBase {
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "NAME")
	private String name;
	@Column(name = "TEXT", length = 4096)
	private String text;
	@ManyToOne(cascade = CascadeType.MERGE, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "ENTITY_BASE_ID")
	private EntityBase likedEntity;

	public EntityBase getLikedEntity() {
		return likedEntity;
	}

	public void setLikedEntity(EntityBase likedEntity) {
		this.likedEntity = likedEntity;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}