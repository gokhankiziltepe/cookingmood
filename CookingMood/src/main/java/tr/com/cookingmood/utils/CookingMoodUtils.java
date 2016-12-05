package tr.com.cookingmood.utils;

import org.springframework.util.StringUtils;

public class CookingMoodUtils {
	public static String getWebdavPath(String text) {
		String[] olds = { "Ğ", "ğ", "Ü", "ü", "Ş", "ş", "İ", "ı", "Ö", "ö", "Ç", "ç", " ", "-" };
		String[] news = { "G", "g", "U", "u", "S", "s", "I", "i", "O", "o", "C", "c", "_", "_" };
		for (int i = 0; i < olds.length; i++) {
			text = text.replace(olds[i], news[i]);
		}
		text = text.toLowerCase();
		return text;
	}

	public static boolean isValidResourcePath(String text) {
		return StringUtils.endsWithIgnoreCase(text, ".jpeg") || StringUtils.endsWithIgnoreCase(text, ".jpg")
				|| StringUtils.endsWithIgnoreCase(text, ".png") || StringUtils.endsWithIgnoreCase(text, ".gif");
	}

	public static String getWebdavResourcePath(String text) {
		return text.replace("/webdav", "");
	}

}
