package reivax.norac.website.utilities;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class FlickrHelper {


	private static final String KEY = "b9a23c77afdb6c9392bf22d1ec0ed16f";
	private static final String SECRET = "e76ca57df1b50821";
	private static final String REST_URL = "http://api.flickr.com/services/rest/?method=";
	private static final String SETS_LIST_METHOD = "flickr.photosets.getList";
	private static final String PHOTOS_LIST_METHOD = "flickr.photosets.getPhotos";
	private static final String PARAM_API = "&api_key=";
	private static final String PARAM_USER = "&user_id=";
	private static final String PARAM_SET = "&photoset_id=";
	private static final String URL_TO_PHOTO = "http://static.flickr.com/";/* + servers[i] + "/" + ids[i] + "_" + secrets[i] + ".jpg";*/

	private static final String USER_ID = "38794461@N03";
	
	private static String getBackURL(String server, String id, String secret){
		return URL_TO_PHOTO + server + "/" + id + "_" + secret + ".jpg";
	}

	private static Map<String, String> getAllPhotoSetsFromFlickr(){
		Map<String, String> setsCitiesByIds = new HashMap<String, String>();

		String urlSetString = REST_URL + SETS_LIST_METHOD + PARAM_API + KEY + PARAM_USER + USER_ID;
		try {
			URL url = new URL(urlSetString);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/xml");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}

			//Get and parse
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(conn.getInputStream());
			doc.getDocumentElement().normalize();
			conn.disconnect();

			//Set
			NodeList nList = doc.getElementsByTagName("photoset");

			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);

				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;

					String setId = eElement.getAttribute("id");
					String setName = eElement.getElementsByTagName("title").item(0).getTextContent();

					setsCitiesByIds.put(setId, setName.toLowerCase());
				}
			}
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		return setsCitiesByIds;
	}

	private static Map<String, Map<String, String>> getAllPhotosURLByCityFromFlickr(Map<String, String> sets){
		Map<String, Map<String, String>> urlsByCityName = new HashMap<String, Map<String, String>>();

		String urlPhotosString = REST_URL + PHOTOS_LIST_METHOD + PARAM_API + KEY + PARAM_SET;

		for(Map.Entry<String, String> entry: sets.entrySet()){
			try {
				URL url = new URL(urlPhotosString + entry.getKey());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Accept", "application/xml");

				if (conn.getResponseCode() != 200) {
					throw new RuntimeException("Failed : HTTP error code : "
							+ conn.getResponseCode());
				}

				//Get and parse
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(conn.getInputStream());
				doc.getDocumentElement().normalize();
				conn.disconnect();

				//Set
				NodeList nList = doc.getElementsByTagName("photo");

				for (int temp = 0; temp < nList.getLength(); temp++) {

					Node nNode = nList.item(temp);

					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;

						String photoId = eElement.getAttribute("id");
						String secret = eElement.getAttribute("secret");
						String server = eElement.getAttribute("server");
						String caption = eElement.getAttribute("title");

						// Build back URL:
						String urlPhoto = getBackURL(server, photoId, secret);
						
						if(!urlsByCityName.containsKey(entry.getValue())){
							urlsByCityName.put(entry.getValue(), new HashMap<String, String>());
						}
						urlsByCityName.get(entry.getValue()).put(urlPhoto, caption);
					}
				}
			} catch (IOException | ParserConfigurationException | SAXException e) {
				e.printStackTrace();
			}
		}
		return urlsByCityName;
	}
	
	public static Map<String, Map<String, String>> getURLsFromFlickr(){
		return getAllPhotosURLByCityFromFlickr(getAllPhotoSetsFromFlickr());
	}

	public static void main(String[] args){

		Map<String, Map<String, String>> photos = getURLsFromFlickr();

		System.out.println(photos);
	}
}
