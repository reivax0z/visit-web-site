<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="reivax.norac.website.dto.*" %>

<%
// RETRIEVE THE MAIN OBJECT
ArticleDTO article = (ArticleDTO) request.getAttribute("article");
Boolean isLogged = request.getSession().getAttribute("isLogged") != null ? (Boolean)request.getSession().getAttribute("isLogged") : Boolean.FALSE;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visit with Me</title>


    <link href="/jsp/bootstrap-3.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/jsp/bootstrap-3.0.0/examples/offcanvas/offcanvas.css" rel="stylesheet">

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
            <li class="active"><a href="Blog">Travel Blog</a></li>
            <li><a href="AboutMe">About Me</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <%if(isLogged){ %>
            <li><a href="AddNewCountryFormAction">Add a Country</a></li>
            <li><a href="AddNewCityFormAction">Add a City</a></li>
            <li><a href="AddNewArticleFormAction">Add a Blog Article</a></li>
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
          <div class="jumbotron">
            <h1><%=article.getTitle() %></h1>
            <h2><%=article.getDate() %></h2>
            <p><%=article.getIntro() %></p>
          </div>
          <%
          for(ArticlePartDTO part : article.getArticleParts()){
          %>
          <div class="row"  style="text-align:justify;">
            <div class="col-lg-12">
          	<h2><%=part.getTitle() %></h2>
          	<p><%=part.getBody() %></p>
          	</div>
          </div><!--/row-->
          <%
          }
          %>
          <div class="row" style="text-align:justify;">
            <div class="col-lg-12">
          	<h2>Conclusion</h2>
          	<p><%=article.getConclusion() %></p>
          	</div>
          </div>
        </div><!--/span-->
        
       <jsp:include page="includes/right_block_blog.jsp"></jsp:include>

     <jsp:include page="includes/footer.html"></jsp:include>
  </body>
</html>
