package reivax.norac.website.actions;


import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;	
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reivax.norac.website.dto.CountriesVisitedDTO;
import reivax.norac.website.service.WebSiteEJB;
import reivax.norac.website.util.CommonsUtils;

/**
 * Servlet implementation class CountriesServlet
 */
@WebServlet(name="/CountryList", urlPatterns={"/CountryListAction", "/Home"})
public class CountriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB 
	WebSiteEJB countriesEJB;

    /**
     * Default constructor. 
     */
    public CountriesServlet() {
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
		// Get back all the countries from DB
		List<CountriesVisitedDTO> countries = countriesEJB.getAllCountriesFromDb();
		
		CommonsUtils.cleanSession(request);
		
		// Forward the info to the appropriate JSP
		request.setAttribute("countries", countries);
		request.getRequestDispatcher("jsp/DisplayCountries.jsp").forward(request, response);
	}
	
}
