package tr.com.cookingmood.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;

@SuppressWarnings("serial")
@Entity(name = "FOOTER_CONTENT")
public class FooterContent extends EntityBase {
	@Lob
	@Column(name = "HTML_CONTENT", length = 100000)
	private String htmlContent;

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

}
