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
<script type="text/javascript">
	var redirURL = 'https://google.com';
</script>
<body>
	<%@include file="header.jsp"%>
	<div id="main">
		<div class="container">
			<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			     url="jdbc:mysql://localhost:3306/websitesecurity"
			     user="root"  password="0123"/>
			<sql:query dataSource="${snapshot}" var="result">
			SELECT * FROM user WHERE username="${sessionScope['username']}"
	</sql:query>
			<div id="content">
			        
					<div id="site-wrapper" style="float: left">
						<table class="table table-striped">
							<thead>
								<th>Tên Tài Khoản</th>
								<th>Số dư tài khoản</th>
							</thead>
							<tbody>
								<tr>
								 <c:forEach var="row" items="${result.rows}">
									<form action="#" method="post">
								   <td><c:out  value="${row.username}"/></td>
								      <td><c:out  value="${row.sodutaikhoan}"/></td>
									</form>
									</c:forEach>
								</tr>
						</table>
			</div>
			<%@include file="footer.jsp"%>
</body>
</html>