<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>
<%@ page import="reivax.norac.website.util.*" %>

<%
// RETRIEVE THE MAIN OBJECT
List<CountriesVisitedDTO> countries = (List<CountriesVisitedDTO>) request.getAttribute("countries");
CountriesVisitedDTO editCountry = (CountriesVisitedDTO) request.getSession().getAttribute("editCountry");
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link href='http://fonts.googleapis.com/css?family=UnifrakturMaguntia' rel='stylesheet' type='text/css'>

    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">
    
    <link rel="shortcut icon" href="<%=Commons.IMG_ICON_ADDRESS%>">

	<title>Add a new Country</title>
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
          <a class="navbar-brand" href="CountryList">Visit with Me</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
       		<li><a href="Home"><span class="glyphicon glyphicon-globe"></span> Travel Tips</a></li>
            <li><a href="Blog"><span class="glyphicon glyphicon-comment"></span> Travel Blog</a></li>
            <li><a href="AboutMe"><span class="glyphicon glyphicon-user"></span> About Me</a></li>
          </ul>
          <%if(isLogged){ %>
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="#"><span class="glyphicon glyphicon-plus-sign"></span> Country</a></li>
            <li><a href="AddNewCityFormAction"><span class="glyphicon glyphicon-plus-sign"></span> City</a></li>
            <li><a href="AddNewArticleFormAction"><span class="glyphicon glyphicon-plus-sign"></span> Blog Article</a></li>
          </ul>
          <%} %>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->

    <div class="container">

	
    <%if(isLogged){ %>

      <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron shadow background-grey">
            <p>Easily add a new entry by completing the following fields.</p>
          </div>
          <div class="row">
          	
          <div class="col-lg-12">

			<form role="form" action="AddCountryAction" method="post" class="shadow padding20">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Country Details</label>
			    <input type="text" name="name" class="form-control" id="exampleInputEmail1" placeholder="Country name" value="<%=editCountry!=null?editCountry.getName():""%>">
			  	<textarea name="info" class="form-control" rows="5" placeholder="Info"><%=editCountry!=null?editCountry.getInfo():""%></textarea>
			  	<input type="text" name="latitude" class="form-control" id="exampleInputEmail1" placeholder="Latitude" value="<%=editCountry!=null?editCountry.getLatitude():""%>">
			  	<input type="text" name="longitude" class="form-control" id="exampleInputEmail1" placeholder="Longitude" value="<%=editCountry!=null?editCountry.getLongitude():""%>">
			  </div>
			  <hr>
			  <button type="submit" class="btn btn-primary" style="float: right;">Submit New Country</button>
			  <br>
			</form>
			
			</div>
			</div>
			</div>
			
			
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
              <div class="shadow">
          		<div class="sidebar-nav padding20">
				<p>Countries already recorded:</p>
	            <ul class="nav">
	            <%
	            for(CountriesVisitedDTO country : countries){
	            %>
	              <li><%=country.getName() %></li>
	              <%
	            }
	            %>
	            </ul>
         	 	</div><!--/.well -->
	          </div>
       	 	</div><!--/span-->
			
			</div>
			
			
	<%} %>
			
     <jsp:include page="includes/footer.html"></jsp:include>
			
</body>
</html>