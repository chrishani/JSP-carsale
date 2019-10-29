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
				<div class="well well-lg">
					<div class="row">
						<div class="col-md-4">
							<img src="images/default.png" class="img-thumbnail"/>
						</div>
						<div class="col-md-8">
							<h3> Title Goes Here</h3>
							<p> Description Goes Here </p>
							<span> Location Here </span> | <span> Price Here </span>
							<hr/>
							<a href="car/view.jsp" class="btn btn-info">VIEW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="WEB-INF/jspf/footer.jsp" %>
	</div>
</body>
</html>