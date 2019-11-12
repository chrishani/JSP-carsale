<%
	if(session.getAttribute("ROLE")==null || !session.getAttribute("ROLE").toString().equals("a")){
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
%>