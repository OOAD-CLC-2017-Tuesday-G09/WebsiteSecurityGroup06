<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="UpdateUser" method="post">
				<li style="color: red"></li>
				
				<li><input type="hidden"   class="form-control"
					value="test" readonly name="username"><a
					href="#" class=" icon2 user2"></a></li>	
				<input type="text" value="abcd" 
					name="password"   class="form-control">
				
				<li><input type="hidden" value="2015-01-08"
				
					name="ngaysinh"></li>
				
				<li><input type="hidden" value="Nam"
					name="gioitinh"> <datalist id="exampleList">
					<option value="Nam">
					<option value="Nữ">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				
				<li><input type="hidden" value="manhduydl@gmail.com"
					 name="email"></li>
				
				<li><input type="hidden" value="123456789"
					 name="sdt"></li>
				
				<li><input type="hidden" value="TPHCM"
					
					name="diachi"></li>
					
					
				<div class="submit two">
					<input type="submit" class="btn btn-primary" value="Click here to continue">
					<input type="hidden" value="13" name="id">
				</div>
				
			</form>
</body>
</html>