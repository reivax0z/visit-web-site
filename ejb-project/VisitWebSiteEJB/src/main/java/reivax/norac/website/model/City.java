package reivax.norac.website.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the city database table.
 * 
 */
@Entity
@NamedQuery(name="City.findAll", query="SELECT c FROM City c")
public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;

	//bi-directional many-to-one association to About
	@ManyToOne
	private About about;

	//bi-directional many-to-one association to Country
	@ManyToOne
	private Country country;

	//bi-directional many-to-one association to Fact
	@ManyToOne
	private Fact fact;

	//bi-directional many-to-one association to Topfive
	@OneToMany(mappedBy="city")
	private List<Topfive> topfives;

	//bi-directional many-to-one association to Video
	@OneToMany(mappedBy="city")
	private List<Video> videos;

	public City() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public About getAbout() {
		return this.about;
	}

	public void setAbout(About about) {
		this.about = about;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Fact getFact() {
		return this.fact;
	}

	public void setFact(Fact fact) {
		this.fact = fact;
	}

	public List<Topfive> getTopfives() {
		return this.topfives;
	}

	public void setTopfives(List<Topfive> topfives) {
		this.topfives = topfives;
	}

	public Topfive addTopfive(Topfive topfive) {
		getTopfives().add(topfive);
		topfive.setCity(this);

		return topfive;
	}

	public Topfive removeTopfive(Topfive topfive) {
		getTopfives().remove(topfive);
		topfive.setCity(null);

		return topfive;
	}

	public List<Video> getVideos() {
		return this.videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public Video addVideo(Video video) {
		getVideos().add(video);
		video.setCity(this);

		return video;
	}

	public Video removeVideo(Video video) {
		getVideos().remove(video);
		video.setCity(null);

		return video;
	}

}