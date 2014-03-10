package reivax.norac.website.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the about database table.
 * 
 */
@Entity
@NamedQuery(name="About.findAll", query="SELECT a FROM About a")
public class About implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String didyouknow;

	private String info;

	private String name;

	//bi-directional many-to-one association to City
	@OneToMany(mappedBy="about")
	private List<City> cities;

	public About() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDidyouknow() {
		return this.didyouknow;
	}

	public void setDidyouknow(String didyouknow) {
		this.didyouknow = didyouknow;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<City> getCities() {
		return this.cities;
	}

	public void setCities(List<City> cities) {
		this.cities = cities;
	}

	public City addCity(City city) {
		getCities().add(city);
		city.setAbout(this);

		return city;
	}

	public City removeCity(City city) {
		getCities().remove(city);
		city.setAbout(null);

		return city;
	}

}