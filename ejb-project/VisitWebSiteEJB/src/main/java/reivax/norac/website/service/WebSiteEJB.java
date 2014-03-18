package reivax.norac.website.service;

import java.util.ArrayList;
import java.util.List;

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

    	Session session = HibernateUtil.getSessionFactory().openSession();
    	List<Country> cities = session.getNamedQuery("Country.findAll").list();
//    	Query q = em.createNamedQuery("Country.findAll");
//    	List<Country> cities = (List<Country>) q.getResultList();
    	return Converter.getCountriesDTOFromEntities(cities);
    }
    
    @Override
    public void addCountryToDb(CountriesVisitedDTO countryDTO){
    	Country entity = new Country();
    	entity.setInfo(countryDTO.getInfo());
    	entity.setName(countryDTO.getName());
//    	em.persist(entity);
//    	em.flush();
    	
    	Session session = HibernateUtil.getSessionFactory().openSession();
    	 
        session.beginTransaction();
 
        session.save(entity);
        session.getTransaction().commit();
    }
    
    @Override
    public void addArticleToDb(ArticleDTO articleDTO){
    	// Delegate this into the Converter class
    	Article entity = new Article();
    	entity.setDate(articleDTO.getDate());
    	entity.setIntro(articleDTO.getIntro());
    	entity.setConclusion(articleDTO.getConclusion());
    	entity.setTitle(articleDTO.getTitle());
    	
    	ArrayList<ArticlePart> parts = new ArrayList<ArticlePart>();
    	for(ArticlePartDTO p : articleDTO.getArticleParts()){
    		ArticlePart part = new ArticlePart();
    		part.setBody(p.getBody());
    		part.setTitle(p.getTitle());
    		parts.add(part);
    	}
    	entity.setArticleParts(parts);
    	for(ArticlePart p : entity.getArticleParts()){
    		p.setArticle(entity);
    	}
    	
//    	em.persist(entity);
//    	em.flush();
    	

    	Session session = HibernateUtil.getSessionFactory().openSession();
    	 
        session.beginTransaction();
 
        session.save(entity);
        session.getTransaction().commit();
    }
    
    @Override
    public <T> T getFromDb(Class<T> t, Integer id){

    	Session session = HibernateUtil.getSessionFactory().openSession();
    	return (T) session.get(t, id);
//    	return em.find(t, id);
    }


	@Override
	public List<ArticleDTO> getAllArticlesFromDb() {

    	Session session = HibernateUtil.getSessionFactory().openSession();
    	List<Article> articles = session.getNamedQuery("Country.findAll").list();
    	
//		Query q = em.createNamedQuery("Article.findAll");
//    	List<Article> articles = (List<Article>) q.getResultList();
    	return Converter.getArticlesDTOFromEntities(articles);
	}
}
