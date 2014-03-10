package reivax.norac.website.utilities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import reivax.norac.website.dto.AboutDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.dto.FactDTO;
import reivax.norac.website.dto.TopFiveDTO;
import reivax.norac.website.dto.VideoDTO;
import reivax.norac.website.model.*;

@LocalBean
@Stateless
public class Converter {
	
	@PersistenceContext(unitName="VisitWebSiteManager")
    EntityManager em;

	public static List<CountriesVisitedDTO> getCountriesDTOFromEntities(List<Country> entities){
		List<CountriesVisitedDTO> toReturn = new ArrayList<CountriesVisitedDTO>();
		for(Country country : entities){
			toReturn.add(getCountryDTOFromEntity(country));
		}
		return toReturn;
	}
	
	public static CountriesVisitedDTO getCountryDTOFromEntity(Country entity){
		CountriesVisitedDTO toReturn = new CountriesVisitedDTO();
		toReturn.setInfo(entity.getInfo());
		toReturn.setName(entity.getName());
		toReturn.setCities(getCitiesDTOFromEntities(entity.getCities()));
		
		for(CitiesVisitedDTO city : toReturn.getCities()){
			city.setCountry(toReturn);
		}
		return toReturn;
	}
	
	public static List<CitiesVisitedDTO> getCitiesDTOFromEntities(List<City> entities){
		List<CitiesVisitedDTO> toReturn = new ArrayList<CitiesVisitedDTO>();
		for(City city : entities){
			toReturn.add(getCityDTOFromEntity(city));
		}
		return toReturn;
	}
	
	public static CitiesVisitedDTO getCityDTOFromEntity(City entity){
		CitiesVisitedDTO toReturn = new CitiesVisitedDTO();

		toReturn.setName(entity.getName());
		
		toReturn.setAbout(getAboutDTOFromEntity(entity.getAbout()));
		
		List<VideoDTO> videos = new ArrayList<VideoDTO>();
		for(Video video : entity.getVideos()){
			videos.add(getVideoDTOFromEntity(video));
		}
		toReturn.setVideos(videos);
		
		List<TopFiveDTO> topFives = new ArrayList<TopFiveDTO>();
		for(Topfive topFive : entity.getTopfives()){
			topFives.add(getTopFiveDTOFromEntity(topFive));
		}
		toReturn.setTopFives(topFives);
		
		toReturn.setFact(getFactDTOFromEntity(entity.getFact()));
		
		return toReturn;
	}
	
	public static AboutDTO getAboutDTOFromEntity(About entity){
		AboutDTO toReturn = new AboutDTO();
		toReturn.setDidYouKnow(entity.getDidyouknow());
		toReturn.setInfo(entity.getInfo());
		toReturn.setName(entity.getName());
		return toReturn;
	}
	
	public static FactDTO getFactDTOFromEntity(Fact entity){
		FactDTO toReturn = new FactDTO();
		toReturn.setArea(entity.getArea().doubleValue());
		toReturn.setCurrency(entity.getCurrency());
		toReturn.setEstablished(entity.getEstablished());
		toReturn.setLanguages(entity.getLanguages());
		toReturn.setName(entity.getName());
		toReturn.setPopulation(entity.getPopulation());
		toReturn.setTimezone(entity.getTimezone());
		return toReturn;
	}
	
	public static TopFiveDTO getTopFiveDTOFromEntity(Topfive entity){
		TopFiveDTO toReturn = new TopFiveDTO();
		toReturn.setName(entity.getName());
		toReturn.setDescription(entity.getDescription());
		toReturn.setInbrief(entity.getInbrief());
		return toReturn;
	}
	
	public static VideoDTO getVideoDTOFromEntity(Video entity){
		VideoDTO toReturn = new VideoDTO();
		toReturn.setName(entity.getName());
		toReturn.setDescription(entity.getDescription());
		toReturn.setLink(entity.getLink());
		return toReturn;
	}
	
	public City getCityFromDTO(CitiesVisitedDTO dto){
		City toReturn = new City();
		
		toReturn.setVideos(getVideoFromDTO(dto.getVideos()));
		toReturn.setAbout(getAboutFromDTO(dto.getAbout()));
		toReturn.setFact(getFactFromDTO(dto.getFact()));
		toReturn.setTopfives(getTopfiveFromDTO(dto.getTopFives()));
		// Get back from DB
		Country country = new Country();
		if(dto.getCountry().getId() != 0)
			country = em.find(Country.class, dto.getCountry().getId());
		toReturn.setCountry(country);
		
		return toReturn;
	}
	
	public List<Video> getVideoFromDTO(List<VideoDTO> dtos){
		ArrayList<Video> videos = new ArrayList<Video>();
		for(VideoDTO dto : dtos){
			// Get back from DB
			Video toReturn = new Video();
			if(dto.getId() != 0)
				toReturn = em.find(Video.class, dto.getId());
			// Possible modifications
			toReturn.setDescription(dto.getDescription());
			toReturn.setLink(dto.getLink());
			toReturn.setName(dto.getName());
			videos.add(toReturn);
		}
		return videos;
	}
	
	public List<Topfive> getTopfiveFromDTO(List<TopFiveDTO> dtos){
		ArrayList<Topfive> topfives = new ArrayList<Topfive>();
		for(TopFiveDTO dto : dtos){
			// Get back from DB
			Topfive toReturn = new Topfive();
			if(dto.getId() != 0)
				toReturn = em.find(Topfive.class, dto.getId());
			// Possible modifications
			toReturn.setDescription(dto.getDescription());
			toReturn.setName(dto.getName());
			toReturn.setInbrief(dto.getInbrief());
			topfives.add(toReturn);
		}
		return topfives;
	}
	
	public Fact getFactFromDTO(FactDTO dto){
		// Get back from DB
		Fact toReturn = new Fact();
		if(dto.getId() != 0)
			toReturn = em.find(Fact.class, dto.getId());
		// Possible modifications
		toReturn.setName(dto.getName());
		toReturn.setArea(BigDecimal.valueOf(dto.getArea()));
		toReturn.setCurrency(dto.getCurrency());
		toReturn.setEstablished(dto.getEstablished());
		toReturn.setLanguages(dto.getLanguages());
		toReturn.setPopulation(dto.getPopulation());
		toReturn.setTimezone(dto.getTimezone());
		return toReturn;
	}
	
	public About getAboutFromDTO(AboutDTO dto){
		// Get back from DB
		About toReturn = new About();
		if(dto.getId() != 0)
			toReturn = em.find(About.class, dto.getId());
		// Possible modifications
		toReturn.setName(dto.getName());
		toReturn.setDidyouknow(dto.getDidYouKnow());
		toReturn.setInfo(dto.getInfo());
		return toReturn;
	}
}
