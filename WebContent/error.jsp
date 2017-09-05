<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page -Learn Today</title>
</head>
<body>
<div class="container">
<!-- Header section -->
<header>
<%@ include file="Headerjsp.jsp" %>
</header>

<article>
	<div class="alert alert-danger">
	<%
	  String imageUrl = config.getInitParameter("imageUrl");
	  String errorMessage = config.getInitParameter("errorMessage");
	  out.println("<center><img src='" + imageUrl + "' alt='" + errorMessage + "'/>");
	  out.println("<h1>Oops!...<br>" + errorMessage + "<h1></center>");
	
	
	%>
	</div>
</article>

<!-- Footer section -->
<footer>
<%@ include file="footer.jsp" %>
</footer>

</div>
</body>
</html>