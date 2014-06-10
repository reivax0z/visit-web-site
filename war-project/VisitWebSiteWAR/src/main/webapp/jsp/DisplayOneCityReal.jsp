<%@page import="org.apache.commons.net.ftp.FTPFile"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.net.ftp.*" %>
<%@ page import="reivax.norac.website.dto.*" %>
<%@ page import="reivax.norac.website.util.*" %>

<%
// RETRIEVE THE MAIN OBJECT
List<CountriesVisitedDTO> countries = (List<CountriesVisitedDTO>) request.getAttribute("countries");
CitiesVisitedDTO city = (CitiesVisitedDTO) request.getSession().getAttribute("newCity");
if(city == null){
	city = (CitiesVisitedDTO) request.getAttribute("city");
}
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
Boolean isEditMode = request.getSession().getAttribute("isEditMode") != null ? (Boolean)request.getSession().getAttribute("isEditMode") : Boolean.FALSE;
Map<String, Map<String, String>> photosUrls = (Map<String, Map<String, String>>) request.getAttribute("photosURLs");

CountriesVisitedDTO cityCountry = CommonsUtils.getCountryById(city.getCountryID(), countries);
String folder = Commons.FTP_PATH_TO_IMG + Commons.SEPARATOR + cityCountry.getName().toLowerCase() + Commons.SEPARATOR + city.getName().toLowerCase() + Commons.SEPARATOR;
String webLink = Commons.SITE_ADDRESS + folder;
String folderTop = folder + Commons.PATH_TOP;
String webLinkTop = Commons.SITE_ADDRESS + folderTop;
String backgroundImg = Commons.SITE_ADDRESS + folder + Commons.PATH_COVER;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="title" content="Visit with Me - <%=city.getName() %>">
<meta name="description" content="<%=city.getInfo()%>">
<meta name="keywords" content="Xavier CARON, travel, blog">
<title>Visit with Me - <%=city.getName() %></title>


	<link href='http://fonts.googleapis.com/css?family=UnifrakturMaguntia' rel='stylesheet' type='text/css'>

    <link href="/jsp/bootstrap-3.0.0/examples/carousel/carousel.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    
    <link rel="shortcut icon" href="<%=Commons.IMG_ICON_ADDRESS%>">
	
	<script type="text/javascript">
		// Global variable for Google Maps API
		var position = new google.maps.LatLng(<%=city.getLatitude()%>, <%=city.getLongitude()%>);
	</script>

</head>
<body onload="initializeMapPosition(position, 12)">

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
            <li><a href="Home"><span class="glyphicon glyphicon-globe"></span> Travel Tips</a></li>
            <li><a href="Blog"><span class="glyphicon glyphicon-comment"></span> Travel Blog</a></li>
            <li><a href="AboutMe"><span class="glyphicon glyphicon-user"></span> About Me</a></li>
            	<li class="active"><a href="#"><%=city.getName() %></a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
                <%if(isLogged){ %>
	            <li><a href="AddNewCountryFormAction"><span class="glyphicon glyphicon-plus-sign"></span> Country</a></li>
	            <li><a href="AddNewCityFormAction"><span class="glyphicon glyphicon-plus-sign"></span> City</a></li>
            	<li><a href="AddNewArticleFormAction"><span class="glyphicon glyphicon-plus-sign"></span> Blog Article</a></li>
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
        <div class="jumbotron shadow background-grey white" style="background: url('<%=backgroundImg %>') no-repeat center;background-size: cover;">
	  		<div class="row" style="text-align:center">
            	<h1 class="padding-bottom-big"><%=city.getName() %></h1>
	  		</div>
	  	</div>
	  </section>
	  
	  <!-- /END TOP CONTENT -->
	  
	  <section id="id_intro">
	      <div class="row">
	        <div class="col-md-6 col-sm-12">
	        <div class="shadow padding20" style="text-align:center">
	          <h2>By the numbers</h2>
			  <p>Established in <%= city.getEstablished() %></p>
			  <p>Area of <%= city.getArea() %> km&sup2;</p>
			  <p>Population of <%= city.getPopulation() %></p>
	        </div><!-- /.col-lg-4 -->
	        </div>
	
	        <div class="col-md-6 col-sm-12">
	        <div class="shadow padding20" style="text-align:center">
	           <h2>By the facts</h2>
			  <p>Currency: <%= city.getCurrency() %></p>
			  <p>Timezone: <%= city.getTimezone() %></p>
			  <p>Languages: <%= city.getLanguages() %></p>
	        </div><!-- /.col-lg-4 -->
	      </div>
	      </div>
	      
	      <div class="page-header">
	      	<h1><span class="glyphicon glyphicon-info-sign"></span> About <%=city.getName() %></h1>
		  </div>
	          
          <div class="row">
          	<div class="col-md-6 col-sm-12">
          	<div class="shadow padding20">
            <h2>Info</h2>
              <p><%= city.getInfo() %></p>
              <p><a class="btn btn-large btn-primary" href="#id_pictures">Check Photos of <%= city.getName() %></a></p>
            </div>
            </div>
            
          	<div class="col-md-6 col-sm-12">
            <div class="shadow padding20">
            <h2>Did You Know?</h2>
              <p><%= city.getDidYouKnow() %></p>
              <p><a class="btn btn-large btn-primary" href="#id_videos">Watch Videos of <%= city.getName() %></a></p>
          	</div>
          	</div>
          </div>
      </section>


	  <!-- FEATURETTES -->

	  <section id="id_top_5">
	  
	  <div class="page-header">
      	<h1><span class="glyphicon glyphicon-list"></span> Top 5</h1>
	  </div>
	  
	  <div class="col-md-12">
	  
	  <% 
	  int currIteration = 1;
	  for(TopFiveDTO top : city.getTopFives()){
	  %>
	  
      <div class="row shadow padding20">
      <% 
      if(currIteration%2 == 0){ 
      %>
        <div class="col-md-7">
          <h2 class="featurette-heading">Must-Do n&deg;<%=currIteration %>: <span class="text-muted"><%= top.getName() %></span></h2>
          <p class="lead"><%= top.getInbrief() %></p>
		  <p class="lead"><%= top.getDescription() %></p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="<%=webLinkTop + currIteration + Commons.IMG_EXTENSION %>" alt="<%=top.getName()%>">
        </div>
      <%
      }else{ 
      %>
        <div class="col-md-5">
          <img class="featurette-image img-responsive" src="<%=webLinkTop + currIteration + Commons.IMG_EXTENSION %>" alt="<%=top.getName()%>">
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

      <%
      currIteration++;
      } // close for
      %>
      </div>

	</section>
	

      <!-- /END FEATURETTES -->
      
       <!-- VIDEO GALLERY -->
	  
	  <section id="id_videos">
	  <div class="page-header">
		<h1><span class="glyphicon glyphicon-film"></span> Video Gallery</h1>
		</div>
		
		<div class="col-md-12">
	  
		<% 
		for(VideoDTO v : city.getVideos()){
		%>
	  <div class="row shadow padding10">
	  <div class="col-md-9 col-sm-12">
	    <div class="media">
		   <iframe class="pull-left" width="560" height="315" src="<%= v.getLink() %>" frameborder="0" allowfullscreen></iframe>
	  	</div>
	  </div>
	  <div class="col-md-3 col-sm-12">
		<div class="media-body">
			<h4 class="media-heading"><%=v.getName() %></h4>
			<p><%=v.getDescription() %></p>
		 </div>
	  </div>
	  </div>
	  <%
	  }
	  %>
	  </div>
	  </section>
	  
	  <!-- /END VIDEO GALLERY -->
	  
	  
	  <!-- PICTURE GALLERY -->
	  
	  <section id="id_pictures">
	  <div class="page-header">
		<h1><span class="glyphicon glyphicon-picture"></span> Picture Gallery</h1>
	  </div>
	  <div class="row">
	  
		<%
		Map<String, String> photosURLsAndCaptions = photosUrls.get(city.getName().toLowerCase());
		if(photosURLsAndCaptions != null){
			for(Map.Entry<String, String> entry: photosURLsAndCaptions.entrySet()){			
 		%>
		<div class="col-sm-12 col-md-6">
		  <div class="thumbnail shadow">
            <img class="img-rounded" src="<%= entry.getKey() %>" alt="<%= entry.getValue() %>">
            <div class="caption">
		 	  <h3><%= entry.getValue() %></h3>
		    </div>
		  </div>
        </div>
        <%
		}} /*}*/ else{
			%>
			<h3>No images yet...</h3>
			<%
		}
		%>
		</div>
		
		<%
		Map<String, String> countrysidePhotosURLsAndCaptions = photosUrls.get(CommonsUtils.getCountryById(city.getCountryID(), countries).getName().toLowerCase());
		if(countrysidePhotosURLsAndCaptions != null){
		%>
		
		<div class="page-header">
		<h1><span class="glyphicon glyphicon-picture"></span> Countryside Gallery</h1>
	  </div>
	  <div class="row">
	  
		<%
		for(Map.Entry<String, String> entry: countrysidePhotosURLsAndCaptions.entrySet()){			
 		%>
		<div class="col-sm-12 col-md-6">
		  <div class="thumbnail shadow">
            <img class="img-rounded" src="<%= entry.getKey() %>" alt="<%= entry.getValue() %>">
            <div class="caption">
		 	  <h3><%= entry.getValue() %></h3>
		    </div>
		  </div>
        </div>
        <%}	%>
		</div>
		<%} %>

	  </section>
	  
      <!-- /END PICTURE GALLERY -->
	  
	  
	  <%if(isLogged){ %>
        <hr>
        <form action="AddNewCityFormAction" method="post">
        	<input type="text" name="id" value="<%=city.getId()%>" style="display:none">
        	<button type="submit" class="btn btn-primary">Edit</button>
        </form>
	        <%if(isEditMode){ %>
        	<form action="AddCityAction" method="post">
	        	<button type="submit" class="btn btn-primary" style="float: right;">Save Modifications</button>
	        </form>
	        <%} %>
        <%} %>
	  
	  </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
              <div class="shadow">
          <div class="sidebar-nav padding20">
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
        </div>
      </div><!--/row-->

      <!-- FOOTER -->
      
      <jsp:include page="includes/footer.html"></jsp:include>
      
      <!-- /END FOOTER -->
</body>
</html>