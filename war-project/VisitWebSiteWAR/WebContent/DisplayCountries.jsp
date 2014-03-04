<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<%
// RETRIEVE THE MAIN OBJECT
List<CountriesVisitedDTO> countries = (List<CountriesVisitedDTO>) request.getAttribute("countries");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visit with Us</title>


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
          <a class="navbar-brand" href="#">Visit with Us</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
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
            <h1>Hello, world!</h1>
            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
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
              <p><a class="btn btn-default" href="CityDetails?city=<%= city.getName() %>"><%=city.getName() %></a></p>
              <%
              }
              %>
            </div><!--/span-->
          <%
          }
          %>
          </div><!--/row-->
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
              <li class="active"><a href="CityDetails?city=<%= city.getName() %>"><%=city.getName() %></a></li>
              <%
              }
            }
            %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>

    </div><!--/.container-->



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./bootstrap-3.0.0/assets/js/jquery.js"></script>
    <script src="./bootstrap-3.0.0/dist/js/bootstrap.min.js"></script>
    <script src="./bootstrap-3.0.0/examples/offcanvas/offcanvas.js"></script>
  </body>
</html>
