 
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DateFormatSymbols" %>

<%@ page import="reivax.norac.website.dto.ArticleDTO" %>
 
 <%
 Map<String, Map<String, List<ArticleDTO>>> map = (HashMap<String, Map<String, List<ArticleDTO>>>) request.getAttribute("blogArticlesMapByDate");
 %>
 
 <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="well sidebar-nav">
          <h3>All articles</h3>
            <ul class="nav">
              <%
      		  String[] allMonths = new DateFormatSymbols().getMonths();
              
              for(Map.Entry<String, Map<String, List<ArticleDTO>>> entry : map.entrySet()){
              %>
              <li><%=entry.getKey()%></li>
              <ul class="list-group">
              <%
              for(Map.Entry<String, List<ArticleDTO>> entrySub : entry.getValue().entrySet()){ 
              %>
	              <li class="list-group-item">
					<span class="badge"><%=entrySub.getValue().size() %></span>
	              	<a href="ArticleDetailsAction?year=<%=entry.getKey() %>&month=<%= entrySub.getKey() %>">
	              		<%=allMonths[Integer.parseInt(entrySub.getKey())]%>
              		</a>
	              </li>
<!-- 	              <ul> -->
<%-- 	              <% --%>
<!-- // 	              for(int i=entrySub.getValue().size()-1; i>=0; i--){ -->
<!-- // 	            	  ArticleDTO a = entrySub.getValue().get(i); -->
<%--             	  %> --%>
<%-- 	              	<li class="active"><a href="ArticleDetailsAction?date=<%= a.getDate() %>"><%=a.getTitle()%></a></li> --%>
<%--               	  <% --%>
<!-- //               	  } -->
<%--               	  %> --%>
<!--               	  </ul> -->
              <%
              }
              %>
           	 </ul>
              <%
              }
            %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->