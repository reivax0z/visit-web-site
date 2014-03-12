<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
// RETRIEVE THE MAIN OBJECT
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visit with Me</title>


    <link href="./bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">

</head>
<body>
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
            <li><a href="Blog">My Blog</a></li>
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
              <h2>Technologies used</h2>
              <p>This website uses Glassfish Server 4, with EJB for the back end DB management, 
              JSP for the front end. Plans to use Hibernate and Struts are underway.
              The website also uses Maven for compiling and dependencies.
              The CSS design and responsiveness is based on Bootstrap framework.</p>
            </div><!--/span-->
            <div class="col-6 col-sm-12 col-lg-6">
              <h2>About me</h2>
              <p>Almost 3 years of experience as a software engineering consultant, 
              implementing and maintaining solutions for banking and airline industries. 
              Challenging in terms of scalability, quick delivery and worldwide use, 
              those experiences allowed me to get more confidence on the project delivery 
              cycle and its management.</p>
              <p>You can find my resume online here:
              <a href="http://www.linkedin.com/in/xavierwilfriddimitrycaron/">My Resume</a></p>
            </div><!--/span-->
          </div><!--/row-->
        </div><!--/span-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="well sidebar-nav">
            <ul class="nav">My interests
              <li>Software Engineering</li>
              <li>Tennis</li>
              <li>Travels of course</li>
              <li>Landscape photography</li>
              <li>Sports in general</li>
              <li>Guitar</li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->

     <jsp:include page="includes/footer.html"></jsp:include>
  </body>
</html>
