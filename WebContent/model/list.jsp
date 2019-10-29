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
				String sql = "SELECT * FROM model INNER JOIN brand ON brand.id = model.brand_id";
				//3. Prepared Statement
				PreparedStatement ps = con.prepareStatement(sql);
				//4. Get Result Set by Execute PS
				ResultSet rs = ps.executeQuery();
				
				%>
				<div class="well well-lg">
					<h3> Model List </h3>
					<a href="add.jsp" class="btn btn-success"> + </a>
					<hr/>
					<table class="table">
						<tr>
							<th> ID </th>
							<th> BRAND </th>
							<th> NAME </th>
							<th> OPTIONS </th> 
						</tr>
						<% 
						while(rs.next()){
						%>
						<tr>
							<td> <%=rs.getInt("model.id") %> </td>
							<td> <%=rs.getString("brand.name") %> </td>
							<td> <%=rs.getString("model.name") %> </td>
							<td>
								<a href="edit.jsp?id=<%=rs.getInt("model.id") %>" class="btn btn-warning">EDIT</a> 
								<a href="delete.jsp?id=<%=rs.getInt("model.id") %>" class="btn btn-danger">DELETE</a> 
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