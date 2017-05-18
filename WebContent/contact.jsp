<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" href="ThuVien/css/product.css" />
<link href="ThuVien/css/login.css" rel='stylesheet' type='text/css' />
<script type="text/javascript">
	var redirURL = 'https://google.com';
</script>
<body>
	<%@include file="header.jsp"%>
	<div id="main">
		<div class="container">
			<div class="login-card">
				<form action="Data/insert_contact.jsp" method="post">
					<input type="text" value="<%=username%>" class="form-control"
						name="username" /> 
						<textarea type="text" class="form-control"
						rows="4" name="message" ></textarea> <input type="submit"
						class="btn btn-primary" value="Gửi">
						   <font color="red" id="msgbox"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>