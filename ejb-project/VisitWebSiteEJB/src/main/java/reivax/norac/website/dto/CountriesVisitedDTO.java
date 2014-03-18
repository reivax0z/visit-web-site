package reivax.norac.website.dto;

import java.util.List;

public class CountriesVisitedDTO {

	private int id;
	private String name;
	private String info;
	private List<CitiesVisitedDTO> cities;
	
	private Double latitude;
	private Double longitude;
	
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
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
}
