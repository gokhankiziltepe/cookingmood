package tr.com.cookingmood.constants;

public enum RecipeTypes {
	TARTLAR(1, "Tartlar"), CIKOLATALAR(2, "Çikolatalar"), KEKLER(3, "Kekler"), PASTALAR(4, "Pastalar"), SUTLU_TATLILAR(
			5, "Sütlü Tatlılar"), KURABIYELER(6, "Kurabiyeler"), CHEESECAKELER(7, "Cheesecakeler"), DIGER(8, "Diğer");
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
