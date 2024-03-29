<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.industrialmaster.carsale.db.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../WEB-INF/jspf/head.jsp" %>
</head>
<body>
	<%@include file="../WEB-INF/jspf/member_only.jsp" %>
	<div class="container">
		<%@include file="../WEB-INF/jspf/header.jsp" %>
		<div class="row">
			<div class="col-md-3">
				<%@include file="../WEB-INF/jspf/sidebar.jsp" %>
			</div>
			<div class="col-md-9">
				<%
				//1. DB Connection
				Connection con = DB.getCon();
				//2. SQL Statement
				
				String sql = "SELECT * FROM car INNER JOIN model ON car.model_id=model.id "+
							"INNER JOIN brand ON model.brand_id=brand.id WHERE car.member_id=?";
				//3. Prepared Statement
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, session.getAttribute("ID").toString());
				
				//4. Get Result Set by Execute PS
				ResultSet rs = ps.executeQuery();
				
				%>
				<div class="well well-lg">
					<h3> My Car List </h3>
					<hr/>
					<table class="table">
						<tr>
							<th> ID </th>
							<th> PHOTO </th>
							<th> BRAND </th>
							<th> MODEL </th>
							<th> TITLE </th>
							<th> OPTIONS </th> 
						</tr>
						<%
						while(rs.next()){
						%>
						<tr>
							<td> <%=rs.getInt("car.id") %> </td>
							<td> <img src="<%=request.getContextPath() %>/<%=rs.getString("car.photo")%>" width="100" class="img img-thumbnail"/> </td>
							<td> <%=rs.getString("brand.name") %> </td>
							<td> <%=rs.getString("model.name") %> </td>
							<td> <%=rs.getString("car.title") %> </td>
							<td>
								<a href="edit.jsp?id=<%=rs.getInt("car.id") %>" class="btn btn-warning">EDIT</a> 
								<a href="delete.jsp?id=<%=rs.getInt("car.id") %>" class="btn btn-danger">SOLD</a> 
							</td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
			</div>
		</div>
		<%@include file="../WEB-INF/jspf/footer.jsp" %>
	</div>
</body>
</html>