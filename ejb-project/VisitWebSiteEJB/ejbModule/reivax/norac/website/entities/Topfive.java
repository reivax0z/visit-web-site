package reivax.norac.website.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the TOPFIVE database table.
 * 
 */
@Entity
@NamedQuery(name="Topfive.findAll", query="SELECT t FROM Topfive t")
public class Topfive implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String description;

	private String inbrief;

	private String name;

	//bi-directional many-to-one association to City
	@ManyToOne
	private City city;

	public Topfive() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getInbrief() {
		return this.inbrief;
	}

	public void setInbrief(String inbrief) {
		this.inbrief = inbrief;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

}