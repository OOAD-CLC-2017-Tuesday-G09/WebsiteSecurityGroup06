<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.UserDAOImpl"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import = "java.util.UUID"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="ThuVien/css/login.css" rel='stylesheet' type='text/css' />
<title>Đăng kí tài khoản</title>
</head>
<body>
			<%@include file="header.jsp"%>
			<div class="container">
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
		UserDAOImpl userDAO = new UserDAOImpl();
		User u= userDAO.getUser(username);
	%>

	<!--/start-login-two-->
	<div class="login-02">
		 <div class="login-card">
			<div class="two-login-head">
				<h2>Cập nhật thông tin</h2>
				<lable></lable>
			</div>
			<%String a = UUID.randomUUID().toString();
			session.setAttribute("csrfToken", a); %>
			<form action="UpdateUser" method="post">
			<input name = "token" id="token" type="text" value="${sessionScope.csrfToken}" />
				<li style="color: red"><%=err%></li>
				Tên đăng nhập
				<li><input type="text"   class="form-control"
					value="<%=u.getUsername()%>" readonly name="username"><a
					href="#" class=" icon2 user2"></a></li>
				Mật khẩu
				<li><input type="password" value="" 
					name="password"   class="form-control"><a href="#" class=" icon2 lock2"></a></li>
				Ngày sinh
				<li><input type="date" value="<%=u.getNgaysinh()%>"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getNgaysinh() %>';}"
					name="ngaysinh"></li>
				Giới tính
				<li><input type="text" value="<%=u.getGioitinh() %>"
					list="exampleList" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getGioitinh() %>';}"
					name="gioitinh"> <datalist id="exampleList">
					<option value="Nam">
					<option value="Nữ">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				Email
				<li><input type="text" value="<%= u.getEmail() %>" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getEmail() %>';}" name="email"></li>
				Số điện thoại
				<li><input type="text" value="<%=u.getSdt() %>"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getSdt() %>';}" name="sdt"></li>
				Địa chỉ
				<li><input type="text" value="<%=u.getDiachi() %>"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getDiachi() %>';}"
					name="diachi"></li>

				
				<div class="submit two">
					<input type="submit" class="btn btn-primary" value="CẬP NHẬT">
					<input type="hidden" value="<%=u.getUser_id()%>" name="id">
				</div>
				<h5>
					<a href="index.jsp">Trở về</a>
				</h5>
			</form>
			
			
			<% 
				String t = (String) request.getSession().getAttribute("a");
			String st = (String) request.getSession().getAttribute("csrfToken");
			
				%>
				<h3> gia tri: <%=t %></h3>
				
				<%-- <c:out value="${sessionScope['username']}"/> --%>
			
			<%-- <% 
				String storedToken= "";
				String token ="";
				if (request.getAttribute("storedToken") != null) {
					storedToken = (String) request.getAttribute("storedToken");
					token = (String) request.getAttribute("token");%>
					
					<h3> <%=storedToken %></h3>
					<h3> <%=token %></h3>
					
					
					
				<% } %> --%>
			
		</div>
	</div>
</body>
</html>