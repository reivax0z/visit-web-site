package reivax.norac.website.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the FACTS database table.
 * 
 */
@Entity
@Table(name="FACTS")
@NamedQuery(name="Fact.findAll", query="SELECT f FROM Fact f")
public class Fact implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private BigDecimal area;

	private String currency;

	private String established;

	private String languages;

	private String name;

	private String population;

	private String timezone;

	//bi-directional many-to-one association to City
	@ManyToOne
	private City city;

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

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

}