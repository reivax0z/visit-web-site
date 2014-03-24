package reivax.norac.website.utilities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.ArticlePartDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.dto.TopFiveDTO;
import reivax.norac.website.dto.VideoDTO;
import reivax.norac.website.model.*;
import reivax.norac.website.service.WebSiteEJB;

@LocalBean
@Stateless
public class Converter {
	
	@EJB 
	WebSiteEJB countriesEJB;
	
	/*
	 * Entities --> DTO
	 */

	public static List<CountriesVisitedDTO> getCountriesDTOFromEntities(List<Country> entities){
		List<CountriesVisitedDTO> toReturn = new ArrayList<CountriesVisitedDTO>();
		for(Country country : entities){
			toReturn.add(getCountryDTOFromEntity(country));
		}
		return toReturn;
	}
	
	public static CountriesVisitedDTO getCountryDTOFromEntity(Country entity){
		CountriesVisitedDTO toReturn = new CountriesVisitedDTO();
		toReturn.setId(entity.getId());
		toReturn.setInfo(entity.getInfo());
		toReturn.setName(entity.getName());
		toReturn.setLatitude(entity.getLatitude().doubleValue());
		toReturn.setLongitude(entity.getLongitude().doubleValue());
		
		toReturn.setCities(getCitiesDTOFromEntities(entity.getCities()));
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
		toReturn.setId(entity.getId());
		toReturn.setCountryID(entity.getCountry().getId());
		
		toReturn.setDidYouKnow(entity.getDidyouknow());
		toReturn.setInfo(entity.getInfo());
		toReturn.setLatitude(entity.getLatitude().doubleValue());
		toReturn.setLongitude(entity.getLongitude().doubleValue());
		
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
		toReturn.setId(entity.getId());
		return toReturn;
	}
	
	public static VideoDTO getVideoDTOFromEntity(Video entity){
		VideoDTO toReturn = new VideoDTO();
		toReturn.setName(entity.getName());
		toReturn.setDescription(entity.getDescription());
		toReturn.setLink(entity.getLink());
		toReturn.setId(entity.getId());
		return toReturn;
	}
	
	public static List<ArticleDTO> getArticlesDTOFromEntities(List<Article> entities){
		List<ArticleDTO> toReturn = new ArrayList<ArticleDTO>();
		for(Article article : entities){
			toReturn.add(getArticleDTOFromEntity(article));
		}
		return toReturn;
	}
	
	public static ArticleDTO getArticleDTOFromEntity(Article entity){
		ArticleDTO toReturn = new ArticleDTO();
		toReturn.setDate(entity.getDate());
		toReturn.setId(entity.getId());
		toReturn.setTitle(entity.getTitle());
		toReturn.setIntro(entity.getIntro());
		toReturn.setConclusion(entity.getConclusion());
		toReturn.setArticleParts(getArticlesPartDTOFromEntities(entity.getArticleParts()));
		
		return toReturn;
	}
	
	public static List<ArticlePartDTO> getArticlesPartDTOFromEntities(List<ArticlePart> entities){
		List<ArticlePartDTO> toReturn = new ArrayList<ArticlePartDTO>();
		for(ArticlePart part : entities){
			toReturn.add(getArticlePartDTOFromEntity(part));
		}
		return toReturn;
	}
	
	public static ArticlePartDTO getArticlePartDTOFromEntity(ArticlePart entity){
		ArticlePartDTO toReturn = new ArticlePartDTO();

		toReturn.setId(entity.getId());
		toReturn.setTitle(entity.getTitle());
		toReturn.setBody(entity.getBody());
		
		return toReturn;
	}
	
	
	/*
	 * DTO --> Entities
	 */
	
	public static Country getCountryFromDTO(CountriesVisitedDTO dto){
		Country toReturn = new Country();
		
		toReturn.setId(dto.getId());
		
		// Possible modifications
		toReturn.setName(dto.getName());
		toReturn.setLatitude(BigDecimal.valueOf(dto.getLatitude()));
		toReturn.setLongitude(BigDecimal.valueOf(dto.getLongitude()));
		toReturn.setInfo(dto.getInfo());
		
		return toReturn;
	}
	
	public  City getCityFromDTO(CitiesVisitedDTO dto){
		City toReturn = new City();
		
		toReturn.setId(dto.getId());
		
		if(dto.getCountryID() != 0){
			toReturn.setCountry(countriesEJB.getFromDb(Country.class, dto.getCountryID()));
		}
		
		toReturn.setVideos(getVideoFromDTO(dto.getVideos()));
		for(Video v: toReturn.getVideos()){
			v.setCity(toReturn);
		}
		toReturn.setTopfives(getTopfiveFromDTO(dto.getTopFives()));
		for(Topfive t : toReturn.getTopfives()){
			t.setCity(toReturn);
		}
		
		// Possible modifications
		toReturn.setName(dto.getName());
		toReturn.setArea(BigDecimal.valueOf(dto.getArea()));
		toReturn.setCurrency(dto.getCurrency());
		toReturn.setEstablished(dto.getEstablished());
		toReturn.setLanguages(dto.getLanguages());
		toReturn.setPopulation(dto.getPopulation());
		toReturn.setTimezone(dto.getTimezone());
		toReturn.setLatitude(BigDecimal.valueOf(dto.getLatitude()));
		toReturn.setLongitude(BigDecimal.valueOf(dto.getLongitude()));

		toReturn.setDidyouknow(dto.getDidYouKnow());
		toReturn.setInfo(dto.getInfo());
		
		return toReturn;
	}
	
	public static List<Video> getVideoFromDTO(List<VideoDTO> dtos){
		ArrayList<Video> videos = new ArrayList<Video>();
		for(VideoDTO dto : dtos){
			Video toReturn = new Video();
			
			// Possible modifications
			toReturn.setDescription(dto.getDescription());
			toReturn.setLink(dto.getLink());
			toReturn.setName(dto.getName());
			toReturn.setId(dto.getId());
			videos.add(toReturn);
		}
		return videos;
	}
	
	public static List<Topfive> getTopfiveFromDTO(List<TopFiveDTO> dtos){
		ArrayList<Topfive> topfives = new ArrayList<Topfive>();
		for(TopFiveDTO dto : dtos){
			Topfive toReturn = new Topfive();

			// Possible modifications
			toReturn.setDescription(dto.getDescription());
			toReturn.setName(dto.getName());
			toReturn.setInbrief(dto.getInbrief());
			toReturn.setId(dto.getId());
			topfives.add(toReturn);
		}
		return topfives;
	}
	
	public static Article getArticleFromDTO(ArticleDTO articleDTO){
		Article entity = new Article();
    	entity.setDate(articleDTO.getDate());
    	entity.setIntro(articleDTO.getIntro());
    	entity.setConclusion(articleDTO.getConclusion());
    	entity.setTitle(articleDTO.getTitle());
    	entity.setId(articleDTO.getId());
    	
    	ArrayList<ArticlePart> parts = new ArrayList<ArticlePart>();
    	for(ArticlePartDTO p : articleDTO.getArticleParts()){
    		parts.add(getArticlePartFromDTO(p));
    	}
    	entity.setArticleParts(parts);
    	for(ArticlePart p : entity.getArticleParts()){
    		p.setArticle(entity);
    	}
    	return entity;
	}
	
	public static ArticlePart getArticlePartFromDTO(ArticlePartDTO dto){
		ArticlePart part = new ArticlePart();
		part.setId(dto.getId());
		part.setBody(dto.getBody());
		part.setTitle(dto.getTitle());
		return part;
	}
}
