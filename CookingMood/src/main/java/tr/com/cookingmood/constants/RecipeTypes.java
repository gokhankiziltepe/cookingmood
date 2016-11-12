package tr.com.cookingmood.constants;

public enum RecipeTypes {
	TARTLAR(1, "Tartlar"), CIKOLATALAR(2, "Çikolatalar"), KEKLER(1, "Kekler"), PASTALAR(2, "Pastalar"), SUTLU_TATLILAR(
			1, "Sütlü Tatlılar"), KURABIYELER(2, "Kurabiyeler"), CHEESECAKELER(1, "Cheesecakeler");
	int status;
	String title;

	private RecipeTypes(int status, String title) {
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
