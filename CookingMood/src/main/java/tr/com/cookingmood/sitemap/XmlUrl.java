package tr.com.cookingmood.sitemap;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

@XmlAccessorType(value = XmlAccessType.NONE)
@XmlRootElement(name = "url", namespace = "http://www.sitemaps.org/schemas/sitemap/0.9")
public class XmlUrl {
	public enum Priority {
		HIGH("1.0"), MEDIUM("0.5");

		private String value;

		Priority(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}
	}

	@XmlElement(namespace = "http://www.sitemaps.org/schemas/sitemap/0.9")
	private String loc;

	@XmlElement(namespace = "http://www.sitemaps.org/schemas/sitemap/0.9")
	private String lastmod = new DateTime().toString(DateTimeFormat.forPattern("yyyy-MM-dd"));

	@XmlElement(namespace = "http://www.sitemaps.org/schemas/sitemap/0.9")
	private String changefreq = "daily";

	@XmlElement(namespace = "http://www.sitemaps.org/schemas/sitemap/0.9")
	private String priority;

	public XmlUrl() {
	}

	public XmlUrl(String loc, Priority priority) {
		this.loc = loc;
		this.priority = priority.getValue();
	}

	public String getLoc() {
		return loc;
	}

	public String getPriority() {
		return priority;
	}

	public String getChangefreq() {
		return changefreq;
	}

	public String getLastmod() {
		return lastmod;
	}
}