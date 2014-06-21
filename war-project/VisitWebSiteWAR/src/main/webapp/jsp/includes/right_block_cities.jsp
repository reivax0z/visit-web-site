<%@ page import="java.util.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<ul class="nav">
<%
for(CountriesVisitedDTO country : countries){
%>
  <li><%=country.getName() %></li>
  <%
  for(CitiesVisitedDTO city_it : country.getCities()){
  %>
  <li class="active"><a href="CityDetailsAction?city=<%= city_it.getName() %>"><%=city_it.getName() %></a></li>
  <%
  }
}
%>
</ul>