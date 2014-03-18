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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">
    
    	<script type="text/javascript">
	var nbButtons = 0;
	var maxVideos = 2;
	var button = new Array();
	button[0] = false;
	button[1] = false;
	</script>


    <script src="/jsp/bootstrap-3.0.0/js/cityhelper.js"></script>

	<title>Add a new City</title>
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
            <li><a href="Home">Home</a></li>
            <li><a href="Blog">Travel Blog</a></li>
            <li><a href="AboutMe">About Me</a></li>
          </ul>
          <%if(isLogged){ %>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="AddNewCountryFormAction">Add a Country</a></li>
            <li class="active"><a href="#">Add a City</a></li>
            <li><a href="AddNewArticleFormAction">Add a Blog Article</a></li>
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
          <div class="jumbotron">
            <p>Easily add a new entry by completing the following fields.</p>
          </div>
          <div class="row">
          	
          <div class="col-lg-12">

			<form role="form" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="exampleInputEmail1">City Name</label>
			    <input type="text" name="city_name" class="form-control" id="exampleInputEmail1" placeholder="City name">
		  		<input type="text" name="city_lat" class="form-control" id="exampleInputEmail1" placeholder="Latitude">
		  		<input type="text" name="city_long" class="form-control" id="exampleInputEmail1" placeholder="Longitude">
		  		<select class="form-control" name="country">
		  			<%for(CountriesVisitedDTO country : countries){ %>
					<option value="<%=country.getName()%>"><%=country.getName() %></option>
					<%} %>
				</select>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">About</label>
			    <textarea name="did_you_know" class="form-control" rows="5" placeholder="Did you know?"></textarea>
			  	<textarea name="info" class="form-control" rows="5" placeholder="Info"></textarea>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Facts</label>
			    <input type="text" name="area" class="form-control" id="exampleInputPassword1" placeholder="Area">
			  	<input type="text" name="currency" class="form-control" id="exampleInputPassword1" placeholder="Currency">
			    <input type="text" name="established" class="form-control" id="exampleInputPassword1" placeholder="Established">
			  	<input type="text" name="languages" class="form-control" id="exampleInputPassword1" placeholder="Languages">
			    <input type="text" name="population" class="form-control" id="exampleInputPassword1" placeholder="Population">
			  	<input type="text" name="timezone" class="form-control" id="exampleInputPassword1" placeholder="Timezone">
			  </div>
			  <%for(int i=1; i<=5; i++){ %>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Top Five nb <%=i %></label>
			    <input name="top_name_<%=i %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="Name">
			  	<input name="top_brief_<%=i %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="In brief">
			  	<textarea name="top_info_<%=i %>" class="form-control" rows="5" placeholder="Description"></textarea>
			  </div>
			  <%} %>
			  <%for(int i=0; i<2; i++){ %>
			  <div class="form-group" style="display:none" id="video<%=i %>">
			    <label for="exampleInputPassword1">Video nb <%=i+1 %></label>
			    <input type="text" name="video_name_<%=i %>" class="form-control" id="video_name_<%=i %>" placeholder="Name">
			  	<textarea name="video_desc_<%=i %>" class="form-control" rows="5" id="video_desc_<%=i %>" placeholder="Description"></textarea>
			  	<input type="url" name="video_url_<%=i %>" class="form-control" id="video_url_<%=i %>" placeholder="URL">
			  	<button type="button" class="btn btn-default" onclick="removeVideo('<%=i%>')">Remove Video Link</button>
			  </div>
			  <%} %>
	  	 	  <button type="button" class="btn btn-default" id="buttonAddInit" onclick="addVideo()">Add Video Link (2 remaining)</button>
			  <hr>
			  <button type="submit" class="btn btn-primary" style="float: right;">Submit New City</button>
			</form>
			
			</div>
			</div>
			</div>
			</div>
			
	<%} %>
			
     <jsp:include page="includes/footer.html"></jsp:include>
</body>
</html>