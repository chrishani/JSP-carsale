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
				if(request.getParameter("msg")!=null){
					out.println("<div class='alert alert-danger'>");
					out.print(request.getParameter("msg"));
					out.println("</div>");
				}
				
				Connection con = DB.getCon();
				String sql1 = "SELECT * FROM brand";
				PreparedStatement ps1 = con.prepareStatement(sql1);
				ResultSet rs1 = ps1.executeQuery();
				
				String sql2 = "SELECT * FROM model";
				PreparedStatement ps2 = con.prepareStatement(sql2);
				ResultSet rs2 = ps2.executeQuery();
				%>
				<div class="well well-lg">
					<h3> Car Add </h3>
					<hr/>
					<form action="../car_add" method="post" enctype="multipart/form-data">
						<label> Brand </label>
						<select name="brand_id" class="form-control">
							<% while(rs1.next()){ %>
							<option value="<%=rs1.getInt("id") %>"><%=rs1.getString("name") %></option>
							<% } %>
						</select>
						
						<label> Model </label>
						<select name="model_id" class="form-control">
							<% while(rs2.next()){ %>
							<option value="<%=rs2.getInt("id") %>"><%=rs2.getString("name") %></option>
							<% } %>
						</select>
						
						<label> Title </label>
						<input type="text" class="form-control" name="title">
						<label> Description </label>
						<textarea  class="form-control" name="description"></textarea>
						<label> Price </label>
						<input type="number" class="form-control" name="price">
						<label> Milage </label>
						<input type="number" class="form-control" name="milage">
						<label> Fuel Type </label>
						<input type="text" class="form-control" name="fuel_type">
						<label> Location </label>
						<input type="text" class="form-control" name="location">
						<label> Year </label>
						<input type="number" class="form-control" name="year">
						<label> Photo </label>
						<input type="file" class="form-control" name="photo">
						<hr/>
						<input type="submit" value="SAVE" class="btn btn-success">
						<input type="reset" value="RESET" class="btn btn-danger">
					</form>
				</div>
			</div>
		</div>
		<%@include file="../WEB-INF/jspf/footer.jsp" %>
	</div>
</body>
</html>