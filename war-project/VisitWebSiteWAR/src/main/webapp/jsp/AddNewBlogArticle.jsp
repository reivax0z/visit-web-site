<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<%
// RETRIEVE THE MAIN OBJECT
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">

	<title>Add a new Blog Article</title>
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
          <a class="navbar-brand" href="Home">Visit with Me</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="Home">Home</a></li>
            <li><a href="AboutMe">About Me</a></li>
            <li class="active"><a href="#">Add an Article</a></li>
            <li><a href="AddNewCountryFormAction">Add a Country</a></li>
            <li><a href="AddNewCityFormAction">Add a City</a></li>
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

			<form role="form" action="AddArticle" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Article Details</label>
			    <input type="text" name="title" class="form-control" id="exampleInputEmail1" placeholder="Title">
			  	<textarea name="intro" class="form-control" rows="2" placeholder="Introduction"></textarea>
 				<textarea name="conclusion" class="form-control" rows="2" placeholder="Conclusion"></textarea>
			  </div>
			  <script type="text/javascript">
			  var nbButtons = 0;
			  var maxArticles = 10;
			  var button = new Array();
			  button[0] = false;
			  button[1] = false;
			  button[2] = false;
			  button[3] = false;
			  button[4] = false;
			  button[5] = false;
			  button[6] = false;
			  button[7] = false;
			  button[8] = false;
			  button[9] = false;
			  
			  function addContent(){
				  for (var i = 0; i < button.length; i++) {
					    if(button[i] == false){
					    	showContent(i);
					    	button[i] = true;
					    	break;
					    }
					}
			  }
			  function showContent(id){
				  var doc = document.getElementById('content'+id);
				  doc.style.display = 'block';

				  nbButtons++;
				  if(nbButtons == maxArticles){
				  	document.getElementById('buttonAddInit').style.display = 'none';
				  }
				  var nbRemain = maxArticles-nbButtons;
				  document.getElementById('buttonAddInit').innerHTML = 'Add Content ('+nbRemain+' remaining)';
			  }
			  function removeContent(id){
				  var i = parseInt(id);
				  var doc = document.getElementById('content'+i);
				  doc.style.display = 'none';
				  button[i] = false;
				  
				  nbButtons--;
				  var nbRemain = maxArticles-nbButtons;
				  document.getElementById('buttonAddInit').innerHTML = 'Add Content ('+nbRemain+' remaining)';
				  document.getElementById('buttonAddInit').style.display = 'block';
			  }
			  </script>
			  <%for(int i=0; i<10; i++){ %>
			  <div class="form-group" id="content<%=i %>" style="display:none">
			    <label for="content_<%=i%>">Content nb <%=i+1 %></label>
			    <input type="text" name="title_part_<%=i%>" class="form-control" id="exampleInputEmail1" placeholder="Title">
 				<textarea name="content_part_<%=i%>" class="form-control" rows="5" placeholder="Content"></textarea>
 				<button type="button" onclick="removeContent('<%=i%>')">Remove Content</button>
			  </div>
			  <%} %>
			  <button type="button" id="buttonAddInit" onclick="addContent()">Add Content (10 remaining)</button>
			  <hr>
			  <button type="submit" class="btn btn-default">Submit New Article</button>
			</form>
			
			</div>
			</div>
			
			</div>
			
     <jsp:include page="includes/footer.html"></jsp:include>
     
</body>
</html>