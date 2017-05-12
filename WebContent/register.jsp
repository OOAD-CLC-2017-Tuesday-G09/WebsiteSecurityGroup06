<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="ThuVien/css/login.css"/>>
<title>Đăng kí tài khoản</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>
		<%@include file="header.jsp"%>
			<div class="container">
	<!--/start-login-two-->
	 <div class="login-card">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<h2>Đăng ký</h2>
				<lable></lable>
			</div>
			<form action="RegisterServlet" method="post">
				<li style="color: red"><%=err%></li>
				Tên người dùng
				<li><input type="text" class="form-control" value=""
					name="username"></li>
				Mật khẩu	
				<li><input type="password" value=""
					name="password"></li>
				Ngày sinh
				<li><input type="date" value=""
					name="ngaysinh"  class="form-control"></li>
				Giới tính
				<li><input type="text"  class="form-control" value="" list="exampleList"
					name="gioitinh"  class="form-control"> 
					<datalist id="exampleList">
					<option value="Nam">
					<option value="Nữ">
					</datalist></li>
				Email
				<li><input type="text" value=""
					name="email"  class="form-control"></li>
				Số điện thoại
				<li><input type="text" value=""				
					name="sdt"  class="form-control"></li>
				Địa chỉ
				<li><input type="text" value=""
					name="diachi"  class="form-control"></li>
					
				<div class="p-container">
					<label class="checkbox two"><input type="checkbox"
						name="checkbox" checked><i></i>Tôi đồng ý <a href="#">Điều khoản dịch vụ</a></label>
				</div>
				<div class="submit two">
					<input type="submit" class="btn btn-primary" value="Đăng Ký">
				</div>
				<h5>
					<a href="login.jsp" >Đăng nhập</a>
				</h5>
			</form>
		</div>
	</div>
	</div>
		<%@include file="footer.jsp"%>
	
</body>
</html>