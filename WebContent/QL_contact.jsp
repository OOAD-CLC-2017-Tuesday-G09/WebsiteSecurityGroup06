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
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/websitesecurity?useUnicode=true&characterEcoding=utf-8"
			user="root" password="0123" />
		<sql:query dataSource="${snapshot}" var="result">
			SELECT * FROM contact
	</sql:query>
	<div id="main">
		<div class="container">
			<table class="table table-striped">
				<thead>
					<th>ID</th>
					<th>UserName</th>
					<th>message</th>
				</thead>
				<tbody>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><c:out value="${row.id}" /></td>
							<td><c:out value="${row.username}" /></td>
							<td>${row.message}</td>
						</tr>
					</c:forEach>
					</table>
		</div>
	</div>
	<a href="http://localhost:8080/Group09_WebSecurity/Data/delete_product.jsp?ma_san_pham=1">nhấn</a>
	<%@include file="footer.jsp"%>
</body>
</html>