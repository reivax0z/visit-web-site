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

import reivax.norac.website.caches.ArticleCache;
import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;
import reivax.norac.website.util.CommonsUtils;
import reivax.norac.website.utilities.Utils;

/**
 * Servlet implementation class ArticleServlet
 */
@WebServlet(name="/ArticleServlet", urlPatterns={"/ArticleDetailsAction"})
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		
		String blogYear = request.getParameter("year");
		String blogMonth = request.getParameter("month");
		
		// Get back all the articles from DB
		List<ArticleDTO> blogArticles = ArticleCache.getInstance().getAll();
		
		Map<String, Map<String, List<ArticleDTO>>> map = CommonsUtils.getArticlesMapByYearByMonth(blogArticles);
		request.setAttribute("blogArticlesMapByDate", map);
		
		if(blogDate != null && !blogDate.isEmpty()){
			for(ArticleDTO a : blogArticles){
				if(a.getDate().equals(blogDate)){

					// Forward the info to the appropriate JSP
					request.setAttribute("article", a);
					request.getRequestDispatcher("jsp/BlogDisplayOneArticle.jsp").forward(request, response);
				}
			}
		} else{
			request.setAttribute("articles", map.get(blogYear).get(blogMonth));
			request.setAttribute("month", CommonsUtils.getMonthAndYear(blogMonth, blogYear));
			request.getRequestDispatcher("jsp/BlogDisplayMonthArticles.jsp").forward(request, response);
		}
	}
}
