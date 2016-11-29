package tr.com.cookingmood.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;

import tr.com.cookingmood.constants.BlogTypes;
import tr.com.cookingmood.utils.CookingMoodUtils;

@SuppressWarnings("serial")
@Entity(name = "BLOG_ENTRY")
public class BlogEntry extends EntityBase {
	@Column(name = "HEADER")
	private String header;
	@Lob
	@Column(name = "TEXT", length = 100000)
	private String text;

	@Enumerated(EnumType.STRING)
	@Column(name = "BLOG_TYPE")
	private BlogTypes blogType;

	@Column(name = "TAGS", length = 1024)
	private String tags;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public BlogTypes getBlogType() {
		return blogType;
	}

	public void setBlogType(BlogTypes blogType) {
		this.blogType = blogType;
	}

	public String getWebdavPath() {
		return CookingMoodUtils.getWebdavPath(this.header);
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

}
