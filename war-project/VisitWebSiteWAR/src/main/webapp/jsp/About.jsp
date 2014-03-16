<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="reivax.norac.website.util.*" %>

<%
// RETRIEVE THE MAIN OBJECT
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
		var position = new google.maps.LatLng(-37.820698, 144.957393);
	</script>

</head>
<body onload="initializeMapPosition(position, 3)">
	<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="Home">Visit with Me</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="Home">Home</a></li>
            <li><a href="Blog">Travel Blog</a></li>
            <li class="active"><a href="#">About Me</a></li>
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
            <h1>Why this website?</h1>
            <p>To comunicate my passion for travels.</p>
            <p>At the same time, I use this website to keep up-to-date with software 
            engineering technologies.</p>
          </div>
          <div class="row">
            <div class="col-6 col-sm-12 col-lg-6">
              <h2>About me</h2>
              <p>Almost 3 years of experience as a software engineering consultant, 
              implementing and maintaining solutions for banking and airline industries. 
              Challenging in terms of scalability, quick delivery and worldwide use, 
              those experiences allowed me to get more confidence on the project delivery 
              cycle and its management.</p>
              <p>You can find my detailed online resume here:
              <a href="http://www.linkedin.com/in/xavierwilfriddimitrycaron/">My Resume</a></p>
            </div><!--/span-->
            <div class="col-6 col-sm-12 col-lg-6">
              <h2>My passions / Interests?</h2>
              <p>Long story short: sports, travels & technology.</p>
              <ul>
              <li>Tennis</li>
              <li>Travels</li>
              <li>Landscape Photography</li>
              <li>Guitar</li>
              <li>Software Engineering</li>
              <li>Big Data</li>
              <li>Technology</li>
              <li>Management</li>
              </ul>
            </div>
          </div>
          <div class="row">
          	<div class="col-6 col-sm-12 col-lg-6">
              <h2>Technologies used</h2>
              <p>This website uses Glassfish Server 4, with EJB for the back end DB management, 
              JSP for the front end. Plans to use Hibernate (currently JPA + EntityManager) 
              and Struts are underway.
              </p>
              <p>The website also uses Maven for compiling and dependencies, the 
              integration is done using Jenkins and the versioning is done via Git.
              The deployment / hosting is on Cloudbees.com</p>
              <p>The CSS design and responsiveness is based on Bootstrap framework.
              I've also used the Google Maps API, following a workshop provided by Google 
              in my university.</p>
            </div><!--/span-->
            <div class="col-6 col-sm-12 col-lg-6">
              <h2>Other Projects</h2>
              <p>I am also currently developing 2 Android apps to help travellers, especially 
              when they are overseas.</p>
              <p>Those projects take some time to develop, not necessary because of 
              their complexity, but more because of the small amount of time I can 
              spend on them.</p>
            </div><!--/span-->
          </div><!--/row-->
        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="well sidebar-nav" style="text-align:center;">
          	<h3>Xavier CARON</h3>        	
  			<img alt="Profile Picture" src="<%= Commons.IMG_PROFILE_ADDRESS %>" class="img-responsive img-circle">
 			<hr> 
            <h3>Where am I now?</h3>
            <div id="map_position" style="height: 200px;"></div>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->

     <jsp:include page="includes/footer.html"></jsp:include>
    
  </body>
</html>
