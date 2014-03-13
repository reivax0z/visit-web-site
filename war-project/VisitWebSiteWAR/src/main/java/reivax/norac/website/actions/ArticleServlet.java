package reivax.norac.website.actions;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.CitiesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;

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
		
		// Forward the info to the appropriate JSP
		request.setAttribute("blogArticles", blogArticles);
		
		for(ArticleDTO a : blogArticles){
			if(a.getDate().equals(blogDate)){

				// Forward the info to the appropriate JSP
				request.setAttribute("article", a);
				request.getRequestDispatcher("jsp/BlogDisplayOneArticle.jsp").forward(request, response);
			}
		}
		
//		request.getRequestDispatcher("jsp/Blog.jsp").forward(request, response);
	}


}
