<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
 <link rel="stylesheet" type="text/css" href="ThuVien/css/login.css"/>
 <head>
 <!-- 		<script type="text/javascript">
 		function specialcharecter()
 		{
 		    var iChars = "!`@#$%^&*()+=-[]\\\';,./{}|\":<>?~_";   
 		    var data = document.getElementById("uname").value;
 		    for (var i = 0; i < data.length; i++)
 		    {      
 		        if (iChars.indexOf(data.charAt(i)) != -1)
 		        {    
 		            alert ("Your string has special characters. \nThese are not allowed.");
 		            document.getElementById("uname").value = "";
 		            return false; 
 		        } 
 		    }
 		}
		</script> -->
		<script>
$(document).ready(function()
{

});
</script>
 </head>
<body>
	<%@include file="header.jsp"%>

<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/websitesecurity?useUnicode=true&characterEcoding=utf-8"
			user="root" password="0123" />
		<sql:query dataSource="${snapshot}" var="result">
			SELECT * FROM customer
	</sql:query>
	<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Zip</th>
				</thead>
				<tbody>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><c:out value="${row.customerId}" /></td>
							<td><c:out value="${row.customerName}" /></td>
							<td><c:out value="${row.customerEmail}" /></td>
							<td><c:out value="${row.customerPhone}" /></td>
							<td><c:out value="${row.customerZip}" /></td>
						</tr>
					</c:forEach>
					
 <div class="login-card">
    <h1 style="color:blue">Đăng Nhập</h1><br>
  <form action="loginAuthenticate.jsp" name ="myform" method="POST" id="signupForm1" class="form-horizontal" onsubmit="return specialcharecter()">
    <input type="text" name="uname"  id="uname" placeholder="User Name"  required>
    <input type="password" name="pass" id="pass"  placeholder="PassWord" required>
      <input type="submit" class="login login-submit" onclick='return submit()' value="login"/>
  </form>
     <font color="red" id="msgbox"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font>
  <div class="login-help">
     <a href="#">Quên mật khẩu</a></br>
  </div>

</div>   
	<%@include file="footer.jsp"%>
</div>
                   

</div>
</body>
</html>