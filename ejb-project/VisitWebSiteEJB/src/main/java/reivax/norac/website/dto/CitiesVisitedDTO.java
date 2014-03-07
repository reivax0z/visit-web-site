package reivax.norac.website.dto;

import java.util.List;

public class CitiesVisitedDTO {

	private int id;
	private String name;
	private CountriesVisitedDTO country;
	
	private List<TopFiveDTO> topFives;
	private List<VideoDTO> videos;
	private AboutDTO about;
	private FactDTO fact;
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
	public AboutDTO getAbout() {
		return about;
	}
	public void setAbout(AboutDTO about) {
		this.about = about;
	}
	public FactDTO getFact() {
		return fact;
	}
	public void setFact(FactDTO fact) {
		this.fact = fact;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
