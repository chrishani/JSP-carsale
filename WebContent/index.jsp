<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.industrialmaster.carsale.db.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="WEB-INF/jspf/head.jsp" %>
</head>
<body>
	<div class="container">
		<%@include file="WEB-INF/jspf/header.jsp" %>
		<div class="row">
			<div class="col-md-3">
				<%@include file="WEB-INF/jspf/sidebar.jsp" %>
			</div>
			<div class="col-md-9"> 
					<% 
					Connection con = DB.getCon(); 
					String sql = "SELECT * FROM car INNER JOIN model ON car.model_id=model.id "+
								"INNER JOIN brand ON model.brand_id=brand.id"; 
					PreparedStatement ps = con.prepareStatement(sql); 
					ResultSet rs = ps.executeQuery(); 
					while(rs.next()){
					%>
					<div class="well well-lg">
						<div class="row">
							<div class="col-md-4">
								<img src="<%=request.getContextPath() %>/<%=rs.getString("car.photo")%>" class="img-thumbnail"/>
							</div>
							<div class="col-md-8">
								<h3> <%=rs.getString("car.title")%> </h3>
								<p> <%=rs.getString("car.description")%> </p>
								<span> <%=rs.getString("car.location")%> </span> | <span> <%=rs.getString("car.price")%> </span>
								<hr/>
								<a href="car/view.jsp?id=<%=rs.getString("car.id")%>" class="btn btn-info">VIEW</a>
							</div>
						</div>
					</div>
					<%
					}
					%>
			</div>
		</div>
		<%@include file="WEB-INF/jspf/footer.jsp" %>
	</div>
</body>
</html>