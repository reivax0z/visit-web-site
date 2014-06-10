<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="reivax.norac.website.util.*" %>

<%
// RETRIEVE THE MAIN OBJECT
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="description" content="Visit with Me - Travel tips and a traveller blog">
<meta name="keywords" content="Xavier CARON, travel, blog, resume">
<title>Xavier CARON - Resum&eacute;</title>

	<link href='http://fonts.googleapis.com/css?family=Yesteryear|UnifrakturMaguntia' rel='stylesheet' type='text/css'>


    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">
    
    <link rel="shortcut icon" href="<%=Commons.IMG_ICON_ADDRESS%>">
	
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	
	<script type="text/javascript">
		// Global variable for Google Maps API
		var position = new google.maps.LatLng(-37.820698, 144.957393);
	</script>
	
    <!-- Gravatar API -->
    <script src="/jsp/bootstrap-3.0.0/js/gravatarhelper.js"></script>
	
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
            <li><a href="Home"><span class="glyphicon glyphicon-globe"></span> Travel Tips</a></li>
            <li><a href="Blog"><span class="glyphicon glyphicon-comment"></span> Travel Blog</a></li>
            <li class="active"><a href="/About"><span class="glyphicon glyphicon-user"></span> About Me</a></li>
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
          <div class="jumbotron shadow background-grey">
            <h1>Summary</h1>
            <p id="about_me_summary"></p>
		  </div>
		  
		  <div class="page-header">
	      	<h1><span class="glyphicon glyphicon-tag"></span> Work Experiences</h1>
		  </div>
		  
          <div class="row">
            <div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>Software Engineering Consultant </h2>
              <h3>Air France <small>Oct 2013 - Feb 2014</small></h3>
              <p>Working on the B2C (Business-to-Consumer) e-commerce internet site www.airfrance.com which allows users to book / cancel / modify their flights and membership information. The web site is developed in Java JEE and uses web services to call other third-party applications, such as Amadeus.</p>
				<ul>
				<li>The maintenance tasks on this project allowed me to work in cooperation with the business team and the incident team based in Paris.</li>
				<li>Worked in pair with another engineer to develop a new feature on the website.</li></ul>
              </div>
            </div><!--/span-->
            
            <div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>Software Engineering Consultant</h2>
              <h3>Amundi Asset Management <small>Oct 2011 - Oct 2013</small></h3>
			  <p>Working on the OMS (Order Management System) of the Amundi Asset Management company, which enables traders and managers to create / send / place / integrate orders through the financial environment (via fix protocol for instance).</p>
				<ul>
				<li>Development of new important features on the application, including a new order creation process for the London branch, a constraints system fed by daily batch and a pre-trade constraints monitoring tool</li>
				<li>Improvement of the application performances by developing a configurable stress test and monitoring regressions via Unit Tests and continuous integration (JProfiler, Hudson)</li>
				<li>Other activities include many evolutions and bug fixes on the software (both Client and Server side), support team for the production technical problems and system trainer of new teammates</li></ul>
            </div>
            </div>
          	
          	<div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>Software Engineer Intern</h2>
              <h3>Misys <small>Mar 2011 - Sep 2011</small></h3>
              <p>Working inside the GUI team of the Kondor+ Software (Trade and Risk Management System).</p>
				<ul>
				<li>Development of a configuration upgrading tool which aimed at tracing all the graphical evolution that appeared between 2 versions of the company software's product and update the users configurations regarding those changes, since the users could build their own personal interfaces.</li>
				<li>The tool is now used by both the engineering teams and the end user. </li></ul>
              </div>
            </div><!--/span-->
            
            <div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>Student Software Developer</h2>
              <h3>StatPro <small>Sep 2010 - Feb 2011</small></h3>
              <p>Contributing, as a study project, to the open-source financial library Quantlib.</p>
				<ul>
				<li>Development of pricers for exotic options.</li>
				<li>Implementation of a pricing engine for spread options.</li>
				<li>Development of a specific user interface (GUI) for pricing simulations.</li></ul>
              </div>
            </div><!--/span-->
          </div><!--/row-->

		  <div class="page-header">
	      	<h1><span class="glyphicon glyphicon-book"></span> Education</h1>
		  </div>
		  
		  <div class="row">
            <div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>Master of Information Systems</h2>
              <h3>University of Melbourne <small>2014</small></h3>
              <p>This 1-year Master's degree in Information Systems (MIS) focuses on developing strong capability in supporting, managing and changing business processes through information and communications technology and information systems.</p>
              </div>
            </div><!--/span-->
            
            <div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>Master of Software Engineering</h2>
              <h3>Universit&eacute; de Nice-Sophia Antipolis <small>2006 - 2011</small></h3>
			  <p>A 5-year engineering degree, composed of: 
			  <ul>
					<li>a 4-year Bachelor's degree with a major in Computer Science, followed by</li> 
					<li>a 1-year Master's degree in Software Engineering & Mathematics applied to Finance.</li></ul>
            </div>
            </div>
            
            <div class="col-6 col-sm-12 col-lg-6">
              <div class="shadow padding20">
              <h2>International Student Exchange</h2>
              <h3>Trinity College Dublin <small>2009 - 2010</small></h3>
              <p>Computer Software Engineering. Grade "First".</p>
              </div>
            </div><!--/span-->
            
          </div>
        </div><!--/span-->
		
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="shadow">
          	<div class="sidebar-nav padding10">
    	      	<h3 style="font-family: 'Yesteryear', cursive;text-align:center;">Xavier Caron</h3>        	
  				<img id="about_me_picture" alt="Profile Picture" src="<%= Commons.IMG_PROFILE_ADDRESS %>" width="100px" height="100px" style="margin:auto" class="img-responsive img-circle">
	 			<p style="text-align:center;" ><a id="about_me_website" href="http://www.linkedin.com/in/xavierwilfriddimitrycaron/">LinkedIn</a></p>
 			</div>
		  </div>
          <div class="shadow">
          	<div class="sidebar-nav padding10">	
            	<h3 style="text-align:center;">Languages</h3>
	            <ul>
	            <li>French: Mother tongue</li>
				<li>English: Fluent - IELTS 8</li>
				<li>German: Limited working proficiency</li>
				</ul>
				<hr>
				<h3 style="text-align:center;">Programming Skills</h3>
				<ul>
				<li>Oracle Certified Java SE 6 Programmer</li>
				<li>Web (HTML 5, CSS 3, Javascript, jQuery)</li>
				<li>Android, SQL, C++, C#, PHP, Unix</li>
				</ul>
            </div>
          <!--/.well -->
          </div>
        </div>
      </div><!--/row-->

     <jsp:include page="includes/footer.html"></jsp:include>
     
     <script src="http://en.gravatar.com/xavierwcaron.json?callback=getGravatar" type="text/javascript"></script>
    
  </body>
</html>
