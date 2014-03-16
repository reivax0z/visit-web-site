package reivax.norac.website.actions;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reivax.norac.website.dto.ArticleDTO;
import reivax.norac.website.dto.ArticlePartDTO;
import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;
import reivax.norac.website.utilities.Utils;

/**
 * Servlet implementation class AddArticleServlet
 */
@WebServlet(name="/AddArticleServlet", urlPatterns={"/AddArticleAction"})
public class AddArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB 
	WebSiteEJB articleEJB;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String intro = request.getParameter("intro");
		String conclusion = request.getParameter("conclusion");
		String date = Utils.getStringDateFromDate(new Date());
		
		ArrayList<ArticlePartDTO> parts = new ArrayList<ArticlePartDTO>();
		for(int i=0; i<10; i++){
			String titlePart = request.getParameter("title_part_"+i);
			String contentPart = request.getParameter("content_part_"+i);
			if(titlePart != null && !titlePart.isEmpty()){
				ArticlePartDTO dto = new ArticlePartDTO();
				dto.setTitle(titlePart);
				dto.setBody(contentPart);
				parts.add(dto);
			}
		}
		
		if(title != null && intro != null && conclusion != null){
		
			ArticleDTO dto = new ArticleDTO();
			dto.setTitle(title);
			dto.setDate(date);
			dto.setIntro(intro);
			dto.setConclusion(conclusion);
			dto.setArticleParts(parts);

			articleEJB.addArticleToDb(dto);
		}
		
		request.getRequestDispatcher("Blog").forward(request, response);
	}

}
