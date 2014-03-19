package reivax.norac.website.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.utilities.Utils;

public class CommonsUtils {

	public static FTPFile[] getFilesFromFTPServer(String directory){
		FTPClient ftp = new FTPClient();
		try {
			ftp.connect(Commons.FTP_SERVER, 21);
			ftp.enterLocalPassiveMode();
			ftp.login(Commons.FTP_SERVER_USER, Commons.FTP_SERVER_PASS);
			int reply = ftp.getReplyCode();

			if(!FTPReply.isPositiveCompletion(reply)) {
				System.err.println("FTP server refused connection.");
				throw new Exception("Not able to connect");
			}
			
			String encodedDir = new String(directory.getBytes("UTF-8"), "ISO-8859-1");
			
			// get files
			FTPFile[] files = ftp.listFiles(encodedDir);

			ftp.logout();

			return files;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			if(ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch(IOException ioe) {
					// do nothing
				}
			}
		}
	}

	public static String getNameWithoutExtension(String name){
		try{
			String[] parts = name.split("\\.");
			return parts[0];
		} catch(Exception e){
			e.printStackTrace();
			return name;
		}
	}
	
	public static Map<String, Map<String, List<ArticleDTO>>> getArticlesMapByYearByMonth(List<ArticleDTO> blogArticles){
		Map<String, Map<String, List<ArticleDTO>>> map = new HashMap<String, Map<String, List<ArticleDTO>>>();
		for(ArticleDTO a : blogArticles){
			Date date = Utils.getDateFromStringDate(a.getDate());
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			String year = Integer.toString(c.get(Calendar.YEAR));
			if(!map.containsKey(year)){
				map.put(year, new HashMap<String, List<ArticleDTO>>());
			}
			String month = Integer.toString(c.get(Calendar.MONTH));
			if(!map.get(year).containsKey(month)){
				map.get(year).put(month, new ArrayList<ArticleDTO>());
			}
			map.get(year).get(month).add(a);
		}
		return map;
	}
	
	public static ArticleDTO getArticleById(Integer i, List<ArticleDTO> articles){
		for(ArticleDTO article : articles){
			if(article.getId() == i){
				return article;
			}
		}
		return null;
	}
	
	public static void cleanSession(HttpServletRequest request){
		request.getSession().removeAttribute("newArticle");
		request.getSession().removeAttribute("isEditMode");
	}
}
