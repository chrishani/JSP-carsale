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
				
				
				String id = ""; 
				
				if(request.getParameter("id")!=null){
					id = request.getParameter("id"); 
					String sql = "SELECT * FROM car WHERE id=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();
					if(rs.next()){ 
					
				
				%>
				<div class="well well-lg">
					<h3> Car Update </h3>
					<hr/>
					<form action="../car_update" method="post" >
						<label> Id </label>
						<input type="text" class="form-control" name="id" value="<%=id%>" readonly="readonly">
						<label> Brand </label>
						<select name="brand_id" class="form-control">
							<% while(rs1.next()){ 
								
							%>
							<option value="<%=rs1.getInt("id") %>"><%=rs1.getString("name") %></option>
							<% } %>
						</select>
						
						<label> Model </label>
						<select name="model_id" class="form-control">
							<% while(rs2.next()){
								String selected = "";
								if(rs2.getString("id").equals(rs.getString("model_id"))){
									selected = "selected";
								}
							%>
							<option  <%=selected %> value="<%=rs2.getInt("id") %>"><%=rs2.getString("name") %></option>
						
						</select>
						
						<label> Title </label>
						<input type="text" class="form-control" name="title" value="<%=rs.getString("title") %>">
						<label> Description </label>
						<textarea  class="form-control" name="description"><%=rs.getString("description") %></textarea>
						<label> Price </label>
						<input type="number" class="form-control" name="price"  value="<%=rs.getString("price") %>">
						<label> Milage </label>
						<input type="number" class="form-control" name="milage" value="<%=rs.getString("milage") %>">
						<label> Fuel Type </label>
						<input type="text" class="form-control" name="fuel_type" value="<%=rs.getString("fuel_type") %>">
						<label> Location </label>
						<input type="text" class="form-control" name="location" value="<%=rs.getString("location") %>">
						<label> Year </label>
						<input type="number" class="form-control" name="year" value="<%=rs.getString("year") %>">
						<label> Photo </label>
						<input type="file" class="form-control" name="photo" value="<%=rs.getString("phpto") %>">
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