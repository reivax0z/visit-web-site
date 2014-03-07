package reivax.norac.website.dto;

public class AboutDTO {

	private int id;
	private String didYouKnow;
	private String name;
	private String info;
	public String getDidYouKnow() {
		return didYouKnow;
	}
	public void setDidYouKnow(String didYouKnow) {
		this.didYouKnow = didYouKnow;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
