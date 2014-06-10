package reivax.norac.website.caches;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.naming.NamingException;

import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;

public class CountryCache extends Cache<CountriesVisitedDTO> {
	
	private static CountryCache instance = new CountryCache();
	
	public static CountryCache getInstance(){
		return instance;
	}

	@Override
	protected List<CountriesVisitedDTO> refreshAllAction() {
		return webSiteEJB.getAllCountriesFromDb();
	}

	@Override
	protected void addAction(CountriesVisitedDTO element) {
		webSiteEJB.addCountryToDb(element);
	}
}
