package tr.com.cookingmood.constants;

public enum BlogTypes {
	EXPLORE(1, "Keşifler"), ROUTINE(2, "Rutinler");
	int status;
	String title;

	private BlogTypes(int status, String title) {
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
