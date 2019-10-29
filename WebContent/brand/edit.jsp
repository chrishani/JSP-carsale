<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
				String id = "";
				String name = "";
				if(request.getParameter("id")!=null){
					id = request.getParameter("id");
					Connection con = DB.getCon();
					String sql = "SELECT * FROM brand WHERE id=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, id);
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						name = rs.getString("name");
					}
				}
				
				%>
				<div class="well well-lg">
					<h3> Brand Update </h3>
					<hr/>
					<form action="../brand_update" method="post" >
						<label> ID </label>
						<input type="text" class="form-control" name="id" value="<%=id %>" readonly="readonly">
						<label> Name </label>
						<input type="text" class="form-control" name="name" value="<%=name %>">
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