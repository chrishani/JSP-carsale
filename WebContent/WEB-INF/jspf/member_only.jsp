<%
	if(session.getAttribute("ROLE")==null || !session.getAttribute("ROLE").toString().equals("u")){
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
	%>