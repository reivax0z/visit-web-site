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
import reivax.norac.website.util.CommonsUtils;

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
		String lat = request.getParameter("latitude");
		String lon = request.getParameter("longitude");

		CountriesVisitedDTO editCountry = (CountriesVisitedDTO) request.getSession().getAttribute("editCountry");
		
		if(name != null && info != null){
			CountriesVisitedDTO dto = new CountriesVisitedDTO();
			dto.setInfo(info);
			dto.setName(name);
			dto.setLatitude(Double.valueOf(lat));
			dto.setLongitude(Double.valueOf(lon));

			if(editCountry != null){
				dto.setId(editCountry.getId());
				countriesEJB.updateCountryToDb(dto);
			} else{
				countriesEJB.addCountryToDb(dto);
			}
		}
		
		CommonsUtils.cleanSession(request);
		
		request.getRequestDispatcher("Home").forward(request, response);
	}

}
