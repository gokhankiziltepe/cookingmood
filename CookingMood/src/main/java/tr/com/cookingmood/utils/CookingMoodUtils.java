package tr.com.cookingmood.utils;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.SecureRandom;
import java.util.Locale;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.StringUtils;

public class CookingMoodUtils {
	public static String getWebdavPath(String text) {
		text = text.toLowerCase(new Locale("tr", "TR"));
		String[] olds = { "Ğ", "ğ", "Ü", "ü", "Ş", "ş", "İ", "ı", "Ö", "ö", "Ç", "ç", " ", "-" };
		String[] news = { "G", "g", "U", "u", "S", "s", "I", "i", "O", "o", "C", "c", "_", "_" };
		for (int i = 0; i < olds.length; i++) {
			text = text.replace(olds[i], news[i]);
		}
		return text;
	}

	public static boolean isValidResourcePath(String text) {
		return StringUtils.endsWithIgnoreCase(text, ".jpeg") || StringUtils.endsWithIgnoreCase(text, ".jpg")
				|| StringUtils.endsWithIgnoreCase(text, ".png") || StringUtils.endsWithIgnoreCase(text, ".gif");
	}

	public static String getWebdavResourcePath(String text) {
		return text.replace("/webdav", "");
	}

	public static byte[] resizeImage(byte[] mainImageInBytes, String type) throws IOException {
		int resultSize = 500;
		if ("main".equalsIgnoreCase(type)) {
			resultSize = 400;
		} else if ("header".equalsIgnoreCase(type)) {
			resultSize = 800;
		} else if ("recipe".equalsIgnoreCase(type)) {
			resultSize = 600;
		}
		InputStream mainIn = new ByteArrayInputStream(mainImageInBytes);

		BufferedImage firstImage = ImageIO.read(mainIn);
		BufferedImage jpgInputImage = new BufferedImage(firstImage.getWidth(), firstImage.getHeight(),
				BufferedImage.TYPE_INT_RGB);
		jpgInputImage.createGraphics().drawImage(firstImage, 0, 0, Color.WHITE, null);

		int originWidth = jpgInputImage.getWidth();
		int originHeight = jpgInputImage.getHeight();

		if (originWidth <= resultSize && originHeight <= resultSize) {
			return imageToByteArray(jpgInputImage);
		}

		Scalr.Mode scaleMode = Scalr.Mode.AUTOMATIC;

		int maxSize = 0;
		if (originHeight > originWidth) {
			scaleMode = Scalr.Mode.FIT_TO_HEIGHT;
			maxSize = resultSize;
		} else if (originWidth >= originHeight) {
			scaleMode = Scalr.Mode.FIT_TO_WIDTH;
			maxSize = resultSize;
		}

		BufferedImage outputImage = Scalr.resize(jpgInputImage, Scalr.Method.QUALITY, scaleMode, maxSize);

		if (scaleMode.equals(Scalr.Mode.FIT_TO_WIDTH) && outputImage.getHeight() > resultSize) {
			outputImage = Scalr.resize(outputImage, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_HEIGHT, resultSize);
		} else if (scaleMode.equals(Scalr.Mode.FIT_TO_HEIGHT) && outputImage.getWidth() > resultSize) {
			outputImage = Scalr.resize(outputImage, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_WIDTH, resultSize);
		}

		firstImage.flush();
		jpgInputImage.flush();
		outputImage.flush();

		return imageToByteArray(outputImage);
	}

	private static byte[] imageToByteArray(BufferedImage jpgInputImage) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(jpgInputImage, "jpg", baos);
		baos.flush();
		byte[] imageInByte = baos.toByteArray();
		baos.close();
		return imageInByte;
	}

	private static final SecureRandom RANDOM = new SecureRandom();

	public static String generateRandomFileName() {
		String random = Long.toHexString(RANDOM.nextLong()).toUpperCase(Locale.ENGLISH);
		return random + ".jpg";
	}
}
