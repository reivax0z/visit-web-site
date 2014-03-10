package reivax.norac.website.actions;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;

/**
 * Servlet implementation class AddCountryServlet
 */
@WebServlet(name="/AddCountry", urlPatterns={"/AddCountryAction"})
public class AddCountryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	@EJB 
	WebSiteEJB countriesEJB;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCountryServlet() {
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
		String name = request.getParameter("name");
		String info = request.getParameter("info");
		
		if(name != null && info != null){
		
			CountriesVisitedDTO dto = new CountriesVisitedDTO();
			dto.setInfo(info);
			dto.setName(name);

			countriesEJB.addCountry(dto);
		}
		
		request.getRequestDispatcher("Home").forward(request, response);
	}

}
