<%@page import="reivax.norac.website.util.CommonsUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>
<%@ page import="reivax.norac.website.util.*" %>

<%
// RETRIEVE THE MAIN OBJECT
List<CountriesVisitedDTO> countries = (List<CountriesVisitedDTO>) request.getAttribute("countries");
CitiesVisitedDTO city = (CitiesVisitedDTO) request.getSession().getAttribute("newCity");
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link href='http://fonts.googleapis.com/css?family=UnifrakturMaguntia' rel='stylesheet' type='text/css'>

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
    
    <link rel="shortcut icon" href="<%=Commons.IMG_ICON_ADDRESS%>">

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
            <li><a href="Home"><span class="glyphicon glyphicon-globe"></span> Travel Tips</a></li>
            <li><a href="Blog"><span class="glyphicon glyphicon-comment"></span> Travel Blog</a></li>
            <li><a href="AboutMe"><span class="glyphicon glyphicon-user"></span> About Me</a></li>
          </ul>
         <%@include file="includes/header_menu_admin.jsp" %>
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

			<form role="form" action="AddCityPreviewAction" method="post" class="shadow padding20">
			  <div class="form-group">
			    <label for="exampleInputEmail1">City Name</label>
			    <input type="text" name="city_name" class="form-control" id="exampleInputEmail1" placeholder="City name" value="<%=city!=null?city.getName():"" %>">
		  		<input type="text" name="city_lat" class="form-control" id="exampleInputEmail1" placeholder="Latitude" value="<%=city!=null?city.getLatitude():"" %>">
		  		<input type="text" name="city_long" class="form-control" id="exampleInputEmail1" placeholder="Longitude" value="<%=city!=null?city.getLongitude():"" %>">
		  		<select class="form-control" name="country">
		  			<%for(CountriesVisitedDTO country : countries){ %>
					<option <%= (city!=null && CommonsUtils.getCountryById(city.getCountryID(), countries).getName().equals(country.getName()))?"selected":"" %> value="<%=country.getName()%>"><%=country.getName() %></option>
					<%} %>
				</select>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">About</label>
			    <textarea name="did_you_know" class="form-control" rows="5" placeholder="Did you know?"><%=city!=null?city.getDidYouKnow():"" %></textarea>
			  	<textarea name="info" class="form-control" rows="5" placeholder="Info"><%=city!=null?city.getInfo():"" %></textarea>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Facts</label>
			    <input type="text" name="area" class="form-control" id="exampleInputPassword1" placeholder="Area" value="<%=city!=null?city.getArea():"" %>">
			  	<input type="text" name="currency" class="form-control" id="exampleInputPassword1" placeholder="Currency" value="<%=city!=null?city.getCurrency():"" %>">
			    <input type="text" name="established" class="form-control" id="exampleInputPassword1" placeholder="Established" value="<%=city!=null?city.getEstablished():"" %>">
			  	<input type="text" name="languages" class="form-control" id="exampleInputPassword1" placeholder="Languages" value="<%=city!=null?city.getLanguages():"" %>">
			    <input type="text" name="population" class="form-control" id="exampleInputPassword1" placeholder="Population" value="<%=city!=null?city.getPopulation():"" %>">
			  	<input type="text" name="timezone" class="form-control" id="exampleInputPassword1" placeholder="Timezone" value="<%=city!=null?city.getTimezone():"" %>">
			  </div>
			  <%for(int i=0; i<5; i++){ 
			  TopFiveDTO top = (city!=null && (city.getTopFives()!=null && city.getTopFives().size()>i))?city.getTopFives().get(i):null;
			  %>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Top Five nb <%=i+1 %></label>
			    <input type="text" name="top_id_<%=i %>" value="<%=top!=null?top.getId():0%>" style="display:none">
			    <input name="top_name_<%=i %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="Name" value="<%=top!=null?top.getName():"" %>">
			  	<input name="top_brief_<%=i %>" type="text" class="form-control" id="exampleInputPassword1" placeholder="In brief" value="<%=top!=null?top.getInbrief():"" %>">
			  	<textarea name="top_info_<%=i %>" class="form-control" rows="5" placeholder="Description"><%=top!=null?top.getDescription():"" %></textarea>
			  </div>
			  <%} %>
			  <%for(int i=0; i<2; i++){ 
			  VideoDTO video = (city!=null && city.getVideos()!=null && city.getVideos().size()>i)?city.getVideos().get(i):null;
			  %>
			  <div class="form-group" <%if(video==null){ %>style="display:none"<%} %> id="video<%=i %>">
			    <label for="exampleInputPassword1">Video nb <%=i+1 %></label>
			    <input type="text" name="video_id_<%=i %>" value="<%=video!=null?video.getId():0%>" style="display:none">
			    <input type="text" name="video_name_<%=i %>" class="form-control" id="video_name_<%=i %>" placeholder="Name" value="<%=video!=null?video.getName():"" %>">
			  	<textarea name="video_desc_<%=i %>" class="form-control" rows="5" id="video_desc_<%=i %>" placeholder="Description"><%=video!=null?video.getDescription():"" %></textarea>
			  	<input type="url" name="video_url_<%=i %>" class="form-control" id="video_url_<%=i %>" placeholder="URL" value="<%=video!=null?video.getLink():"" %>">
			  	<button type="button" class="btn btn-default" onclick="removeVideo('<%=i%>')">Remove Video Link</button>
			  </div>
			  <%} %>
	  	 	  <button type="button" class="btn btn-default" id="buttonAddInit" onclick="addVideo()">Add Video Link (<%=(city!=null&&city.getVideos()!=null)?""+(2-city.getVideos().size()):"2" %> remaining)</button>
			  <hr>
			  <button type="submit" class="btn btn-primary" style="float: right;">Preview City</button>
			  <br>
			</form>
			
			</div>
			</div>
			</div>
			</div>
			
	<%} %>
			
     <jsp:include page="includes/footer.html"></jsp:include>
</body>
</html>