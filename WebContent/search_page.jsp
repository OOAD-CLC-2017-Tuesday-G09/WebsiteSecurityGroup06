LogoutServlet<%@page import="java.util.ArrayList"%>
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
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet" href="ThuVien/css/style.css" />
<link rel="stylesheet" href="ThuVien/css/product.css" />
</head>
<body>
<%@include file="header.jsp"%>
	<div id="main">
		<div class="container">
		
		<div id="content">
			<div id="left">
			<%@include file="search_menu.jsp"%>
			</div>
			<div id="right">
				<%
					ProductDAOImpl productDAO = new ProductDAOImpl();
						List<Product> list = new ArrayList<Product>();
						list = productDAO.getList();
						String ten_san_pham = "";
						String ten_the_loai = "";
						if (request.getParameter("ten_the_loai") != null && request.getParameter("ten_san_pham")!= null) {
					ten_the_loai = request.getParameter("ten_the_loai");
					ten_san_pham = request.getParameter("ten_san_pham");
						}
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(0);
				%>
				<% 
				String err= "";
				if (request.getAttribute("err") != null) {
					err = (String) request.getAttribute("err");%>
					<h3><%=err %></h3>
				<% } %>
				
				<%if(productDAO.searchList(ten_san_pham, ten_the_loai).size()==0 && err=="") {%>
					<h3>Không tìm thấy sản phẩm nào phù hợp</h3>
					<%} %>
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">
					
						<%
							if (ten_the_loai != null || ten_san_pham != null) {
									for (Product p : productDAO.searchList(ten_san_pham, ten_the_loai)) {
						%>

						<li class="preorder"><span class="tagimg "> </span> <a
							href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img
								src="ThuVien/sanpham/<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
								<h3><%=p.getTen_san_pham()%></h3>
								<h4>
									Giá:
									<%=nf.format(p.getGia_ban())%>
									VNĐ
								</h4> <span class="textkm">Khuyến mãi trị giá đến <strong>500.000₫</strong>
							</span>
								<p class="info">
									<span>Hãng sx: <%=p.getHang_san_xuat()%>
									</span> <span>Giá: <%=nf.format(p.getGia_ban())%> VNĐ
									</span> <span>Thông tin: <%=p.getThong_tin()%>
								</p>
						</a></li>

						<%
							}
								} else {%>
									<h3> Nhập thông tin tìm kiếm </h3>
								<%}
						%>
					</ul>
				</div>
			</div>
			</div>
		</div>
	<%@include file="footer.jsp"%>
	</div>

</body>
</html>