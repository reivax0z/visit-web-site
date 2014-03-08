package reivax.norac.website.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the CITY database table.
 * 
 */
@Entity
@NamedQuery(name="City.findAll", query="SELECT c FROM City c")
public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	//bi-directional many-to-one association to About
	@OneToMany(mappedBy="city")
	private List<About> abouts;

	//bi-directional many-to-one association to Country
	@ManyToOne
	private Country country;

	//bi-directional many-to-one association to Fact
	@OneToMany(mappedBy="city")
	private List<Fact> facts;

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

	public List<About> getAbouts() {
		return this.abouts;
	}

	public void setAbouts(List<About> abouts) {
		this.abouts = abouts;
	}

	public About addAbout(About about) {
		getAbouts().add(about);
		about.setCity(this);

		return about;
	}

	public About removeAbout(About about) {
		getAbouts().remove(about);
		about.setCity(null);

		return about;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public List<Fact> getFacts() {
		return this.facts;
	}

	public void setFacts(List<Fact> facts) {
		this.facts = facts;
	}

	public Fact addFact(Fact fact) {
		getFacts().add(fact);
		fact.setCity(this);

		return fact;
	}

	public Fact removeFact(Fact fact) {
		getFacts().remove(fact);
		fact.setCity(null);

		return fact;
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