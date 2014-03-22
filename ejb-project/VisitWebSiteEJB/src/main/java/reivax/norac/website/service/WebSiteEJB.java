package reivax.norac.website.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Session;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.ArticlePartDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.model.Article;
import reivax.norac.website.model.ArticlePart;
import reivax.norac.website.model.City;
import reivax.norac.website.model.Country;
import reivax.norac.website.utilities.Converter;
import reivax.norac.website.utilities.HibernateUtil;

/**
 * Session Bean implementation class WebSiteEJB
 */
@Stateless
@LocalBean
public class WebSiteEJB implements WebSiteEJBRemote, WebSiteEJBLocal, ServicesInterface {

	//	@PersistenceContext(unitName="VisitWebSiteManager")
	//    EntityManager em;
	@EJB
	Converter converter;

	/**
	 * Default constructor. 
	 */
	public WebSiteEJB() {
	}

	@Override
	public List<CitiesVisitedDTO> getAllCitiesFromDb(){
//		List<CountriesVisitedDTO> countries = getAllCountriesFromDb();
//		List<CitiesVisitedDTO> cities = new ArrayList<CitiesVisitedDTO>();
//		for(CountriesVisitedDTO country : countries){
//			cities.addAll(country.getCities());
//		}
//		return cities;
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<City> cities = session.getNamedQuery("City.findAll").list();

		HibernateUtil.shutdown();

		return Converter.getCitiesDTOFromEntities(cities);
	}

	@Override
	public List<CountriesVisitedDTO> getAllCountriesFromDb(){

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Country> countries = session.getNamedQuery("Country.findAll").list();

		HibernateUtil.shutdown();

		return Converter.getCountriesDTOFromEntities(countries);
	}

	@Override
	public void addCountryToDb(CountriesVisitedDTO countryDTO){
		Country entity = new Country();
		entity.setInfo(countryDTO.getInfo());
		entity.setName(countryDTO.getName());

		Session session = HibernateUtil.getSessionFactory().openSession();

		session.beginTransaction();

		session.save(entity);
		session.getTransaction().commit();

		HibernateUtil.shutdown();
	}

	@Override
	public void addArticleToDb(ArticleDTO articleDTO){

		// Delegate this into the Converter class
		Article entity = Converter.getArticleFromDTO(articleDTO);

		Session session = HibernateUtil.getSessionFactory().openSession();

		session.beginTransaction();

		session.save(entity);
		session.getTransaction().commit();

		HibernateUtil.shutdown();
	}

	@Override
	public <T> T getFromDb(Class<T> t, Integer id){

		Session session = HibernateUtil.getSessionFactory().openSession();
		return (T) session.get(t, id);
	}


	@Override
	public List<ArticleDTO> getAllArticlesFromDb() {

		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Article> articles = session.getNamedQuery("Article.findAll").list();

		HibernateUtil.shutdown();
		return Converter.getArticlesDTOFromEntities(articles);
	}

	@Override
	public void updateArticleToDb(ArticleDTO articleDTO) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();

		// Remove older entry
		Article a = (Article) session.get(Article.class, articleDTO.getId());
		session.delete(a);

		session.getTransaction().commit();

		session.beginTransaction();

		Article entity = Converter.getArticleFromDTO(articleDTO);

		// Add the new version
		session.save(entity);

		session.getTransaction().commit();

		HibernateUtil.shutdown();
	}

	@Override
	public void addCityToDb(CitiesVisitedDTO cityDTO) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();

		City entity = converter.getCityFromDTO(cityDTO);

		// Add the new version
		session.save(entity);

		session.getTransaction().commit();

		HibernateUtil.shutdown();
	}

	@Override
	public void updateCityToDb(CitiesVisitedDTO cityDTO) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();

		// Remove older entry
		City c = (City) session.get(City.class, cityDTO.getId());
		session.delete(c);

		session.getTransaction().commit();

		session.beginTransaction();

		City entity = converter.getCityFromDTO(cityDTO);

		// Add the new version
		session.save(entity);

		session.getTransaction().commit();

		HibernateUtil.shutdown();
	}

	@Override
	public void updateCountryToDb(CountriesVisitedDTO countryDTO) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();

		// Remove older entry
		Country country = converter.getCountryFromDTO(countryDTO);
		
		session.merge(country);

		session.getTransaction().commit();

		HibernateUtil.shutdown();
	}
}
