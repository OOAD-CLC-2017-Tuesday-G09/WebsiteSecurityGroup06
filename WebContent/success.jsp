<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<body>
<%-- 	<center>
		<div class="container">
			<font color="blue" size="13px"><c:if
					test="${not empty param.errMsg}">
					<%=session.getAttribute("loginUser")%>
					<c:out value="${param.errMsg}" />
				</c:if></font>
	</center> --%>
	<%
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user"))
					userName = cookie.getValue();
			}
		}
		if (userName == null)
			response.sendRedirect("loginsession.jsp");
	%>
	<h3>
		Hi
		<%=userName%>, Login successful.
	</h3>
	<br>
	<form action="LogoutSesion" method="post">
		<input type="submit" value="Logout">
	</form>
	</div>
</body>
</html>