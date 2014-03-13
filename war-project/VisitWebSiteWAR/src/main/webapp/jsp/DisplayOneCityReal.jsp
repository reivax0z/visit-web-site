<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<%
// RETRIEVE THE MAIN OBJECT
CitiesVisitedDTO city = (CitiesVisitedDTO) request.getAttribute("city");
List<CountriesVisitedDTO> countries = (List<CountriesVisitedDTO>) request.getAttribute("countries");
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=city.getName() %></title>


    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/carousel/carousel.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	
	<script type="text/javascript">
		// Global variable for Google Maps API
		var position = new google.maps.LatLng(-33.870501, 151.210824);
	</script>

</head>
<body onload="initializeMapPosition(position, 5)">

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
                <li><a href="Home">Home</a></li>
                <li><a href="AboutMe">About Me</a></li>
            	<li class="active"><a href="#"><%=city.getName() %></a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=city.getCountry().getName() %> <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                  <%
                  for(CitiesVisitedDTO c : city.getCountry().getCities()){
                  %>
                    <li><a href="CityDetailsAction?city=<%= c.getName() %>"><%=c.getName() %></a></li>
                  <%
                  }
                  %>
                  </ul>
                </li>
                <%if(isLogged){ %>
	            <li><a href="AddNewCountryFormAction">Add a Country</a></li>
	            <li><a href="AddNewCityFormAction">Add a City</a></li>
                <li><a href="#about">Modify</a></li>
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
          
          <!-- TOP CONTENT -->
          
          <section id="id_top">
          <div class="row">
          <div class="jumbotron">

      <div class="row" style="text-align:center">
            <h1><%= city.getName() %></h1>
        <div class="col-xs-6 col-sm-6">
          <h2>By the numbers</h2>
		  <p>Established in <%= city.getFact().getEstablished() %></p>
		  <p>Area of <%= city.getFact().getArea() %> km&sup2;</p>
		  <p>Population of <%= city.getFact().getPopulation() %></p>
        </div><!-- /.col-lg-4 -->

        <div class="col-xs-6 col-sm-6">
          <h2>By the facts</h2>
		  <p>Currency: <%= city.getFact().getCurrency() %></p>
		  <p>Timezone: <%= city.getFact().getTimezone() %></p>
		  <p>Languages: <%= city.getFact().getLanguages() %></p>
        </div><!-- /.col-lg-4 -->

	  </div>
	  </section>
	  
	  <!-- /END TOP CONTENT -->
	  
	  
    <div class="marketing">
    

	<section id="id_intro">
          <div class="row">
          	<div class="col-xs-6 col-sm-6">
            <h2>Info</h2>
              <p><%= city.getAbout().getInfo() %></p>
              <p><a class="btn btn-large btn-primary" href="#id_pictures">See Gallery of <%= city.getName() %></a></p>
            </div>
            
          	<div class="col-xs-6 col-sm-6">
            <h2>Did You Know?</h2>
              <p><%= city.getAbout().getDidYouKnow() %></p>
              <p><a class="btn btn-large btn-primary" href="#id_videos">See Videos of <%= city.getName() %></a></p>
          	</div>
          </div>
      </section>


	
	  <!-- FEATURETTES -->

      <hr class="featurette-divider">

	  <section id="id_top_5">
	  
	  <div class="page-header">
      	<h1>Top 5</h1>
	  </div>
	  
	  <% 
	  int currIteration = 1;
	  for(TopFiveDTO top : city.getTopFives()){
	  %>
	  
      <div class="row featurette">
      <% 
      if(currIteration%2 == 0){ 
      %>
        <div class="col-md-7">
          <h2 class="featurette-heading">Must-Do n&deg;<%=currIteration %>: <span class="text-muted"><%= top.getName() %></span></h2>
          <p class="lead"><%= top.getInbrief() %></p>
		  <p class="lead"><%= top.getDescription() %></p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="data:image/png;base64," data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      <%
      }else{ 
      %>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="data:image/png;base64," data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">Must-Do n&deg;<%=currIteration %>: <span class="text-muted"><%= top.getName() %></span></h2>
          <p class="lead"><%= top.getInbrief() %></p>
		  <p class="lead"><%= top.getDescription() %></p>
        </div>
        <%
        } // close else
        %>
      </div>

      <hr class="featurette-divider">
      
      <%
      currIteration++;
      } // close for
      %>

	</section>
	

      <!-- /END FEATURETTES -->
	  
	  
	  <!-- PICTURE GALLERY -->
	  
	  <section id="id_pictures">
	  <div class="page-header">
		<h1>Picture Gallery</h1>
	  </div>
		<%
		String folder = "./img/" + city.getCountry().getName().toLowerCase() + "/" + city.getName().toLowerCase(); // Expl:"../img/australia/sydney/"
		File dir = new File(folder);
		File[] files = dir.listFiles(new FilenameFilter() {
		    public boolean accept(File directory, String fileName) {
		    	fileName = fileName.toLowerCase();
		        return fileName.endsWith(".jpg")
		        		|| fileName.endsWith(".png")
		        		|| fileName.endsWith(".jpeg");
		    }
		});
		if(files != null){
		for(File f : files){
 		%>
		<div class="col-sm-6 col-md-4">
		  <div class="thumbnail">
            <img class="img-rounded" src="<%= f.getAbsolutePath() %>" data-src="holder.js/300x300" alt="<%= f.getName() %>">
            <div class="caption">
		 	  <h3><%= f.getName() %></h3>
		    </div>
		  </div>
        </div>/.col-lg-3
        <%
		} } else{
			%>
			<h3>No images yet...</h3>
			<%
		}
		%>

      <hr class="featurette-divider">
      
	  </section>
	  
      <!-- /END PICTURE GALLERY -->
	  
	  <!-- VIDEO GALLERY -->
	  
	  <section id="id_videos">
	  <div class="page-header">
		<h1>Video Gallery</h1>
		</div>
		<% 
		for(VideoDTO v : city.getVideos()){
		%>
	  <div class="row">
	  <div class="col-md-9 col-sm-12">
	    <div class="media">
		   <iframe class="pull-left" width="560" height="315" src="https:<%= v.getLink() %>" frameborder="0" allowfullscreen></iframe>
	  	</div>
	  </div>
	  <div class="col-md-3 col-sm-12">
		<div class="media-body">
			<h4 class="media-heading"><%=v.getName() %></h4>
			<p><%=v.getDescription() %></p>
		 </div>
	  </div>
	  </div>
	  <hr />
	  <%
	  }
	  %>
	  </section>
	  
	  <!-- /END VIDEO GALLERY -->
	  
	  </div><!--/span-->
	  </div>

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="well sidebar-nav">
          	<h3><%=city.getName()%> overview</h3>
            <div id="map_position" style="height: 200px;"></div>
            <hr>
            <h3>Check also</h3>
            <ul class="nav">
            <%
            for(CountriesVisitedDTO country : countries){
            %>
              <li><%=country.getName() %></li>
              <%
              for(CitiesVisitedDTO cityC : country.getCities()){
              %>
              <li class="active"><a href="CityDetailsAction?city=<%= cityC.getName() %>"><%=cityC.getName() %></a></li>
              <%
              }
            }
            %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->

      <!-- FOOTER -->
      
      <jsp:include page="includes/footer.html"></jsp:include>
      
      <!-- /END FOOTER -->
</body>
</html>