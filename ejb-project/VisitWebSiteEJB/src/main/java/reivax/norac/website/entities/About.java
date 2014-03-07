package reivax.norac.website.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the ABOUT database table.
 * 
 */
@Entity
@NamedQuery(name="About.findAll", query="SELECT a FROM About a")
public class About implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String didyouknow;

	private String info;

	private String name;

	//bi-directional many-to-one association to City
	@ManyToOne
	private City city;

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

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

}