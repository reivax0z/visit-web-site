package reivax.norac.website.dto;

import java.util.List;

public class CitiesVisitedDTO {

	private int id;
	private String name;
	private CountriesVisitedDTO country;
	
	private Double latitude;
	private Double longitude;
	
	private String didYouKnow;
	private String info;
	
	private Double area;
	private String currency;
	private String established;
	private String languages;
	private String population;
	private String timezone;
	
	private List<TopFiveDTO> topFives;
	private List<VideoDTO> videos;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CountriesVisitedDTO getCountry() {
		return country;
	}
	public void setCountry(CountriesVisitedDTO country) {
		this.country = country;
	}
	public List<TopFiveDTO> getTopFives() {
		return topFives;
	}
	public void setTopFives(List<TopFiveDTO> topFives) {
		this.topFives = topFives;
	}
	public List<VideoDTO> getVideos() {
		return videos;
	}
	public void setVideos(List<VideoDTO> videos) {
		this.videos = videos;
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
	public String getDidYouKnow() {
		return didYouKnow;
	}
	public void setDidYouKnow(String didYouKnow) {
		this.didYouKnow = didYouKnow;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Double getArea() {
		return area;
	}
	public void setArea(Double area) {
		this.area = area;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getEstablished() {
		return established;
	}
	public void setEstablished(String established) {
		this.established = established;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getPopulation() {
		return population;
	}
	public void setPopulation(String population) {
		this.population = population;
	}
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
}
