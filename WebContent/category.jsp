<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<%
		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
		List<Category> list1 = new ArrayList<Category>();
		list1 = categoryDAO.getList();
	%>
	<div class="container">
		<nav>
		<ul class="mcd-menu">
			<%
				for (Category c : list1) {
					
			%>
			<li><a href="index.jsp?ma_the_loai=<%=c.getMa_the_loai()%>"> <i class="fa fa-home"><img
						src="ThuVien/images/<%=c.getMa_the_loai() %>.png"></i>
					<strong><%=c.getTen_the_loai()%></strong> <small><%=c.getMo_ta()%></small>
			</a></li>
			<%
				}
			%>
		</ul>
		</nav>
	</div>
</body>
</html>