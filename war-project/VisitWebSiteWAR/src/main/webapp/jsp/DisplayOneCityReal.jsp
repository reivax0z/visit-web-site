<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<%
// RETRIEVE THE MAIN OBJECT
CitiesVisitedDTO city = (CitiesVisitedDTO) request.getAttribute("city");
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=city.getName() %></title>


    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/carousel/carousel.css" rel="stylesheet">

</head>
<body>

	<!-- NAVBAR -->

	<div class="navbar-wrapper">
      <div class="container">

        <div class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">Visit with Me</a>
            </div>
            <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#"><%=city.getName() %></a></li>
                <li><a href="Home">Home</a></li>
                <li><a href="#about">About Me</a></li>
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
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- /END NAVBAR -->

	
	<!-- CAROUSEL -->
	
	<section id="id_carousel">
    <div id="myCarousel" class="carousel slide">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="data:image/png;base64," data-src="holder.js/100%x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Info</h1>
              <p><%= city.getAbout().getInfo() %></p>
              <p><a class="btn btn-large btn-primary" href="#id_pictures">See Gallery of <%= city.getName() %></a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/png;base64," data-src="holder.js/100%x500/auto/#777:#7a7a7a/text:Second slide" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Did You Know?</h1>
              <p><%= city.getAbout().getDidYouKnow() %></p>
              <p><a class="btn btn-large btn-primary" href="#id_videos">See Videos of <%= city.getName() %></a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->
	</section>

    <!-- /END CAROUSEL -->
    

    <div class="container marketing">
    
    
    <!-- TOP CONTENT -->

	<section id="id_intro">
      <!-- Three columns of text below the carousel -->
      <div class="row" style="text-align:center">
        <div class="col-lg-6">
          <img class="img-circle" src="data:image/png;base64," data-src="holder.js/140x140" alt="Generic placeholder image">
          <h2><%= city.getName() %>, by the numbers</h2>
		  <p>Established in <%= city.getFact().getEstablished() %></p>
		  <p>Area of <%= city.getFact().getArea() %> km&sup2;</p>
		  <p>Population of <%= city.getFact().getPopulation() %></p>
          <p><a class="btn btn-default" href="#id_pictures">Check Out Photos of <%= city.getName() %></a></p>
        </div><!-- /.col-lg-4 -->

        <div class="col-lg-6">
          <img class="img-circle" src="data:image/png;base64," data-src="holder.js/140x140" alt="Generic placeholder image">
          <h2><%= city.getName() %> Facts</h2>
		  <p>Local Currency: <%= city.getFact().getCurrency() %></p>
		  <p>Timezone: <%= city.getFact().getTimezone() %></p>
		  <p>Languages: <%= city.getFact().getLanguages() %></p>
          <p><a class="btn btn-default" href="#id_videos">Check Out Videos of <%= city.getName() %></a></p>
        </div><!-- /.col-lg-4 -->

	  </div>
	  </section>
	  
	  <!-- /END TOP CONTENT -->

	
	  <!-- FEATURETTES -->

      <hr class="featurette-divider">

	  <section id="id_top_5">
	  
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
	    <div class="media">
		   <iframe class="pull-left" width="560" height="315" src="https:<%= v.getLink() %>" frameborder="0" allowfullscreen></iframe>
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

      <hr class="featurette-divider">
      
	  </section>
	  
	  <!-- /END VIDEO GALLERY -->

      <!-- FOOTER -->
      
      <footer>
        <p class="pull-right"><a href="CountryList">Home</a> &middot; <a href="#">Back to top</a></p>
        <p>&copy; 2013 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
      
      <!-- /END FOOTER -->

    </div><!-- /.container -->

    <script src="./bootstrap-3.0.0/assets/js/jquery.js"></script>
    <script src="./bootstrap-3.0.0/dist/js/bootstrap.min.js"></script>
    <script src="./bootstrap-3.0.0/assets/js/holder.js"></script>

</body>
</html>