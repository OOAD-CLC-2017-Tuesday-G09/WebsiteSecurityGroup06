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
<link href="ThuVien/css/login.css" rel='stylesheet' type='text/css' />
<script src="https://www.google.com/recaptcha/api.js"></script>
<title>Đăng nhập hệ thống</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
			int count=0;
				if (request.getAttribute("logincount") != null) {
					count = (int) request.getAttribute("logincount");
				}

	%>
	<!--/start-login-one-->
	<%@include file="header.jsp"%>
	<div class="container">
		<div class="login-01">
			<div class="one-login  hvr-float-shadow">
				<div class="login-card">
					<h1 style="color: blue">Đăng Nhập</h1>
					<br>
					<form action="LoginServlet" name="myform" method="POST">
						<%
							String mess = "";
				if (request.getAttribute("mess") != null) {
								mess = (String) request.getAttribute("mess");
						%>
						<li style="color: red"><%=mess%></li>
						<%
							}
						%>
						<li style="color: red"><%=err%><%=count%></li> <input type="text"
							name="username" id="username" placeholder="User Name" required>
						<input type="password" name="password" id="password"
							placeholder="PassWord" required>
						<%
							if (count > 3) {
						%>
						<div class="g-recaptcha"
							data-sitekey="6LcmLyIUAAAAAEIDDWc_cTc02vW7U1q-9zG8to2v"></div>
						<%
							}
						%>
						<div class="p-container">
							<label class="checkbox"><input type="checkbox"
								name="checkbox" checked><i></i>Ghi nhớ mật khẩu</label>
							<h6>
								<a href="resetpassword.jsp">Khôi phục mật khẩu</a>
							</h6>
							<div class="clear"></div>
						</div>
						<input type="submit" class="login login-submit" value="login" />
					</form>
					<div class="login-help">
						<a href="#">Quên mật khẩu</a></br>
					</div>

				</div>
				<h5>
					Bạn muốn đăng ký tài khoản?<a href="register.jsp"> Đăng ký </a>
				</h5>
				</form>
			</div>
		</div>
	</div>
</body>
</html>