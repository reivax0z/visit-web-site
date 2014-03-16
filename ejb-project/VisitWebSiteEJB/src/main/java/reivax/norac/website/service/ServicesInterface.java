package reivax.norac.website.service;

import java.util.List;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;

public interface ServicesInterface {

	// Generic getter from ID
	public <T> T getFromDb(Class<T> t, Integer id);
	
	// Insert
	public void addCountryToDb(CountriesVisitedDTO countryDTO);
	public void addArticleToDb(ArticleDTO articleDTO);
	
	// Specific getters
	public List<CountriesVisitedDTO> getAllCountriesFromDb();
	public List<CitiesVisitedDTO> getAllCitiesFromDb();
	public List<ArticleDTO> getAllArticlesFromDb();
}
