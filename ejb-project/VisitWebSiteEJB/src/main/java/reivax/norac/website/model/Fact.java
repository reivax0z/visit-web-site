package reivax.norac.website.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the facts database table.
 * 
 */
@Entity
@Table(name="facts")
@NamedQuery(name="Fact.findAll", query="SELECT f FROM Fact f")
public class Fact implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private BigDecimal area;

	private String currency;

	private String established;

	private String languages;

	private String name;

	private String population;

	private String timezone;

	//bi-directional many-to-one association to City
	@OneToMany(mappedBy="fact")
	private List<City> cities;

	public Fact() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public BigDecimal getArea() {
		return this.area;
	}

	public void setArea(BigDecimal area) {
		this.area = area;
	}

	public String getCurrency() {
		return this.currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getEstablished() {
		return this.established;
	}

	public void setEstablished(String established) {
		this.established = established;
	}

	public String getLanguages() {
		return this.languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPopulation() {
		return this.population;
	}

	public void setPopulation(String population) {
		this.population = population;
	}

	public String getTimezone() {
		return this.timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public List<City> getCities() {
		return this.cities;
	}

	public void setCities(List<City> cities) {
		this.cities = cities;
	}

	public City addCity(City city) {
		getCities().add(city);
		city.setFact(this);

		return city;
	}

	public City removeCity(City city) {
		getCities().remove(city);
		city.setFact(null);

		return city;
	}

}