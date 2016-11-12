package tr.com.cookingmood.utils;

public class CookingMoodUtils {
	public static String getWebdavPath(String text) {
		String[] olds = { "Ğ", "ğ", "Ü", "ü", "Ş", "ş", "İ", "ı", "Ö", "ö", "Ç", "ç", " " };
		String[] news = { "G", "g", "U", "u", "S", "s", "I", "i", "O", "o", "C", "c", "_" };
		for (int i = 0; i < olds.length; i++) {
			text = text.replace(olds[i], news[i]);
		}
		text = text.toLowerCase();
		return text;
	}

}
