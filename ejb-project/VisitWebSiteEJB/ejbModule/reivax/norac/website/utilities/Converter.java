package reivax.norac.website.utilities;

import java.util.ArrayList;
import java.util.List;

import reivax.norac.website.dto.AboutDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.dto.FactDTO;
import reivax.norac.website.dto.TopFiveDTO;
import reivax.norac.website.dto.VideoDTO;
import reivax.norac.website.entities.About;
import reivax.norac.website.entities.City;
import reivax.norac.website.entities.Country;
import reivax.norac.website.entities.Fact;
import reivax.norac.website.entities.Topfive;
import reivax.norac.website.entities.Video;

public class Converter {

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
		
		if(!entity.getAbouts().isEmpty())
			toReturn.setAbout(getAboutDTOFromEntity(entity.getAbouts().get(0)));
		
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
		
		if(!entity.getFacts().isEmpty())
			toReturn.setFact(getFactDTOFromEntity(entity.getFacts().get(0)));
		
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
}
