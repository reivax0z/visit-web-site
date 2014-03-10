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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <link href="./bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">

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
            <li><a href="CountryListAction">Home</a></li>
            <li><a href="#about">About Me</a></li>
            <li><a href="AddCountryFormAction">Add a Country</a></li>
            <li class="active"><a href="#contact">Add a City</a></li>
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
            <p>Easily add a new entry by completing the following fields.</p>
          </div>
          <div class="row">

			<form role="form" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="exampleInputEmail1">City Name</label>
			    <input type="text" name="city_name" class="form-control" id="exampleInputEmail1" placeholder="City name">
<!-- 			  	<input type="text" name="country" class="form-control" id="exampleInputEmail1" placeholder="Country ref"> -->
		  		<select class="form-control" name="country">
		  			<%for(CountriesVisitedDTO country : countries){ %>
					<option value="<%=country.getName()%>"><%=country.getName() %></option>
					<%} %>
				</select>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">About</label>
			    <input type="text" name="did_you_know" class="form-control" id="exampleInputPassword1" placeholder="Did you know">
			  	<input type="text" name="info" class="form-control" id="exampleInputPassword1" placeholder="Info">
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
			    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Name">
			  	<input type="text" class="form-control" id="exampleInputPassword1" placeholder="In brief">
			  	<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Desc">
			  </div>
			  <%} %>
			  <button id="addvideo1">Add Video</button>
			  <%for(int i=1; i<=2; i++){ %>
			  <div class="form-group" style="display:none" id="video<%=i%>">
			    <label for="exampleInputPassword1">Video nb <%=i %></label>
			    <input type="text" name="video_name_<%=i %>" class="form-control" id="exampleInputPassword1" placeholder="Name">
			  	<input type="text" name="video_desc_<%=i %>" class="form-control" id="exampleInputPassword1" placeholder="Desc">
			  	<input type="url" name="video_url_<%=i %>" class="form-control" id="exampleInputPassword1" placeholder="URL">
			  	<button id="remove1">Remove Video</button>
			  	<button id="addvideo2">Add Another Video</button>
			  </div>
			  <%} %>
			  <%for(int i=1; i<=4; i++){ %>
			  <div class="form-group">
			    <label for="exampleInputFile">Image Upload nb <%=i %></label>
			    <input type="file" name="image_<%=i %>" id="exampleInputFile">
			    <input type="text" name="image_name_<%=i %>" class="form-control" id="exampleInputPassword1" placeholder="Name">
			    <p class="help-block">Example block-level help text here.</p>
			  </div>
			  <%} %>
			  <button type="submit" class="btn btn-default">Submit</button>
			</form>
			
			</div>
			</div>
			</div>
			
			
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

	<script>
	$( "#addvideo1" ).click(function() {
	  $( "#video1" ).show( "slow" );
	});
// 		function showdiv(boxid) {
// 			document.getElementById(boxid).style.display = "none";
// 		}

// 		function hidediv(boxid) {
// 			document.getElementById(boxid).style.display = "block";
// 		}
	</script>

</body>
</html>