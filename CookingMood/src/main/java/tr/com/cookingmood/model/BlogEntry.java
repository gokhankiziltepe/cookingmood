package tr.com.cookingmood.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;

import tr.com.cookingmood.constants.BlogTypes;

@SuppressWarnings("serial")
@Entity(name = "BLOG_ENTRY")
public class BlogEntry extends EntityBase {
	@Column(name = "HEADER")
	private String header;

	@Column(name = "WEBDAV_PATH")
	private String webdavPath;

	@Lob
	@Column(name = "TEXT", length = 100000)
	private String text;

	@Enumerated(EnumType.STRING)
	@Column(name = "BLOG_TYPE")
	private BlogTypes blogType;

	@Column(name = "TAGS", length = 1024)
	private String tags;

	@Column(name = "ITEM_ORDER")
	private Integer itemOrder;

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

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getWebdavPath() {
		return webdavPath;
	}

	public void setWebdavPath(String webdavPath) {
		this.webdavPath = webdavPath;
	}

	public Integer getItemOrder() {
		return itemOrder;
	}

	public void setItemOrder(Integer itemOrder) {
		this.itemOrder = itemOrder;
	}

}
