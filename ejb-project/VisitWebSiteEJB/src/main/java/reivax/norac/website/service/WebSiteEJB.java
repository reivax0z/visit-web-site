package reivax.norac.website.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.model.Country;
import reivax.norac.website.utilities.Converter;

/**
 * Session Bean implementation class WebSiteEJB
 */
@Stateless
@LocalBean
public class WebSiteEJB implements WebSiteEJBRemote, WebSiteEJBLocal {

	@PersistenceContext(unitName="VisitWebSiteEJB")
    EntityManager em;
	
    /**
     * Default constructor. 
     */
    public WebSiteEJB() {
        // TODO Auto-generated constructor stub
    }

    
    public List<CitiesVisitedDTO> getAllCitiesDetails(){
    	List<CountriesVisitedDTO> countries = getAllCountriesVisited();
    	List<CitiesVisitedDTO> cities = new ArrayList<CitiesVisitedDTO>();
    	for(CountriesVisitedDTO country : countries){
    		cities.addAll(country.getCities());
    	}
    	return cities;
    }
    
    public List<CountriesVisitedDTO> getAllCountriesVisited(){
    	Query q = em.createNamedQuery("Country.findAll");
    	List<Country> cities = (List<Country>) q.getResultList();
    	return Converter.getCountriesDTOFromEntities(cities);
    }
    
    public void addCountry(CountriesVisitedDTO countryDTO){
    	Country entity = new Country();
    	entity.setInfo(countryDTO.getInfo());
    	entity.setName(countryDTO.getName());
    	em.persist(entity);
    	em.flush();
    }
}
