package reivax.norac.website.actions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;
import reivax.norac.website.utilities.Utils;

/**
 * Servlet implementation class ArticleServlet
 */
@WebServlet(name="/ArticleServlet", urlPatterns={"/ArticleDetailsAction"})
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB 
	WebSiteEJB articlesEJB;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processData(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processData(request, response);
	}
	
	private void processData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get back the city name from the request
		String blogDate = request.getParameter("date");

		
		// Get back all the articles from DB
		List<ArticleDTO> blogArticles = articlesEJB.getAllArticlesFromDb();
		

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
		
		// Forward the info to the appropriate JSP
		request.setAttribute("blogArticlesMapByDate", map);
		
		
		for(ArticleDTO a : blogArticles){
			if(a.getDate().equals(blogDate)){

				// Forward the info to the appropriate JSP
				request.setAttribute("article", a);
				request.getRequestDispatcher("jsp/BlogDisplayOneArticle.jsp").forward(request, response);
			}
		}
	}
}
