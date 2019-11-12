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
				if(request.getParameter("msg")!=null){
					out.println("<div class='alert alert-danger'>");
					out.print(request.getParameter("msg"));
					out.println("</div>");
				}
				%>
				<div class="well well-lg">
					<h3> Registration Page</h3>
					<hr/>
					<form action="reg" method="post" enctype="multipart/form-data" >
						<label> Name </label>
						<input type="text" class="form-control" name="name">
						<label> Email </label>
						<input type="email" class="form-control" name="email">
						<label> Password </label>
						<input type="password" class="form-control" name="password">
						<label> Mobile </label>
						<input type="text" class="form-control" name="mobile">
						<label> Photo </label>
						<input type="file" class="form-control" name="photo"> 
						<hr/>
						<input type="submit" value="REGISTER" class="btn btn-success">
						<input type="reset" value="RESET" class="btn btn-danger">
					</form>
				</div>
			</div>
		</div>
		<%@include file="WEB-INF/jspf/footer.jsp" %>
	</div>
</body>
</html>