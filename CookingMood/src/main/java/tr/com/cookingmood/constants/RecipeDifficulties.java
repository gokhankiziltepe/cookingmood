package tr.com.cookingmood.constants;

public enum RecipeDifficulties {
	COK_KOLAY(1, "Çok Kolay"), KOLAY(2, "Kolay"), ORTA(3, "Orta"), ZOR(4, "Zor"), COK_ZOR(5, "Çok Zor");
	int status;
	String title;

	private RecipeDifficulties(int status, String title) {
		this.status = status;
		this.title = title;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
