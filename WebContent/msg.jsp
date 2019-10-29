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
					<h3>
						<%=request.getParameter("msg")  %>
					</h3>
					<hr/>
					
				</div>
			</div>
		</div>
		<%@include file="WEB-INF/jspf/footer.jsp" %>
	</div>
</body>
</html>