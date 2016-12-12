package tr.com.cookingmood.constants;

public enum BlogTypes {
	KESIFLER(1, "Keşifler"), RUTINLER(2, "Rutinler");
	int status;
	String title;

	private BlogTypes(int status, String title) {
		this.status = status;
		this.title = title;
	}

	public int getStatus() {
		return status;
	}

	public String getName() {
		return name();
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
