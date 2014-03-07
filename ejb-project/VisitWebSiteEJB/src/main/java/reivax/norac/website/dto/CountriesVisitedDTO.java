package reivax.norac.website.dto;

import java.util.List;

public class CountriesVisitedDTO {

	private int id;
	private String name;
	private String info;
	private List<CitiesVisitedDTO> cities;
	
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
	public List<CitiesVisitedDTO> getCities() {
		return cities;
	}
	public void setCities(List<CitiesVisitedDTO> cities) {
		this.cities = cities;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
