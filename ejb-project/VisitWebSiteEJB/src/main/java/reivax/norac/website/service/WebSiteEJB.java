package reivax.norac.website.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.model.Article;
import reivax.norac.website.model.Country;
import reivax.norac.website.utilities.Converter;

/**
 * Session Bean implementation class WebSiteEJB
 */
@Stateless
@LocalBean
public class WebSiteEJB implements WebSiteEJBRemote, WebSiteEJBLocal, ServicesInterface {

	@PersistenceUnit
    EntityManager em;
	
    /**
     * Default constructor. 
     */
    public WebSiteEJB() {
    }

    @Override
    public List<CitiesVisitedDTO> getAllCitiesFromDb(){
    	List<CountriesVisitedDTO> countries = getAllCountriesFromDb();
    	List<CitiesVisitedDTO> cities = new ArrayList<CitiesVisitedDTO>();
    	for(CountriesVisitedDTO country : countries){
    		cities.addAll(country.getCities());
    	}
    	return cities;
    }
    
    @Override
    public List<CountriesVisitedDTO> getAllCountriesFromDb(){
    	Query q = em.createNamedQuery("Country.findAll");
    	List<Country> cities = (List<Country>) q.getResultList();
    	return Converter.getCountriesDTOFromEntities(cities);
    }
    
    @Override
    public void addCountryToDb(CountriesVisitedDTO countryDTO){
    	Country entity = new Country();
    	entity.setInfo(countryDTO.getInfo());
    	entity.setName(countryDTO.getName());
    	em.persist(entity);
    	em.flush();
    }
    
    @Override
    public <T> T getFromDb(Class<T> t, Integer id){
    	return em.find(t, id);
    }


	@Override
	public List<ArticleDTO> getAllArticlesFromDb() {
		Query q = em.createNamedQuery("Article.findAll");
    	List<Article> articles = (List<Article>) q.getResultList();
    	return Converter.getArticlesDTOFromEntities(articles);
	}
}
