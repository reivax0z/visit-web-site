<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<%
// RETRIEVE THE MAIN OBJECT
List<CountriesVisitedDTO> countries = (List<CountriesVisitedDTO>) request.getAttribute("countries");
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visit with Me</title>


    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

	<script type="text/javascript">
		// Global variable for Google Maps API
		var positions = new Array();
		<%int j=0;%>
		for(var i=0; i<<%=countries.size()%>; i++){
			var lat = <%=countries.get(j).getLatitude()%>;
			var lon = <%=countries.get(j).getLongitude()%>;
			positions.push(new google.maps.LatLng(lat, lon));
			<%j++;%>
		}
	</script>

</head>
<body onload="initializeMapCountries(positions, 2)">
	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Visit with Me</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="Blog">Travel Blog</a></li>
            <li><a href="AboutMe">About Me</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <%if(isLogged){ %>
            <li><a href="AddNewCountryFormAction">Add a Country</a></li>
            <li><a href="AddNewCityFormAction">Add a City</a></li>
            <li><a href="AddNewArticleFormAction">Add a Blog Article</a></li>
            <%} else{ %>
            <li><a href="LoginFormAction">Log-In</a></li>
            <%} %>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->

    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
            <h1>Visit with me!</h1>
            <p>As I have come to travel to already multiple countries, I intend to show here what I've
            liked / disliked about those places.</p>
            <p>All the pictures and documents found on this website are my own property.</p>
            <p>I hope you'll like travelling with me!</p>
          </div>
          <div class="row">
          <%
          for(CountriesVisitedDTO country : countries){
          %>
            <div class="col-6 col-sm-6 col-lg-4">
              <h2><%=country.getName() %></h2>
              <p><%=country.getInfo() %></p>
              <%
              for(CitiesVisitedDTO city : country.getCities()){
              %>
              <p><a class="btn btn-default" href="CityDetailsAction?city=<%= city.getName() %>"><%=city.getName() %></a></p>
              <%
              }
              %>
            </div><!--/span-->
          <%
          }
          %>
          </div><!--/row-->
          <div class="row">
            <div class="col-lg-12" id="map_countries" style="height:500px;"></div>
          </div>
        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="well sidebar-nav">
            <ul class="nav">
            <%
            for(CountriesVisitedDTO country : countries){
            %>
              <li><%=country.getName() %></li>
              <%
              for(CitiesVisitedDTO city : country.getCities()){
              %>
              <li class="active"><a href="CityDetailsAction?city=<%= city.getName() %>"><%=city.getName() %></a></li>
              <%
              }
            }
            %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->

     <jsp:include page="includes/footer.html"></jsp:include>
  </body>
</html>
