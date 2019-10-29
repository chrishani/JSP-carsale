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
				String sql = "SELECT * FROM brand";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				
				String id = "";
				String name = "";
				String brand_id = "";
				if(request.getParameter("id")!=null){
					id = request.getParameter("id"); 
					String sql1 = "SELECT * FROM model WHERE id=?";
					PreparedStatement ps1 = con.prepareStatement(sql1);
					ps1.setString(1, id);
					ResultSet rs1 = ps1.executeQuery();
					if(rs1.next()){
						name = rs1.getString("name");
						brand_id = rs1.getString("brand_id");
					}
				}
				
				
				%>
				<div class="well well-lg">
					<h3> Model Update </h3>
					<hr/>
					<form action="../model_update" method="post" >
						<label> Id </label>
						<input type="text" class="form-control" name="id" value="<%=id%>">
						<label> Brand </label>
						<select name="brand_id" class="form-control">
							<%
							while(rs.next()){
								String selected = "";
								if(rs.getString("id").equals(brand_id)){
									selected = "selected";
								}
							%>
							<option <%=selected %> value="<%=rs.getInt("id") %>"><%=rs.getString("name") %></option>
							<%
							}
							%>
						</select>
						<label> Name </label>
						<input type="text" class="form-control" name="name" value="<%=name%>">
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