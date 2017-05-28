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
				url="jdbc:mysql://localhost:3306/websitesecurity?useUnicode=true&characterEcoding=utf-8"
				user="root" password="0123" />
			<sql:query dataSource="${snapshot}" var="result">
			SELECT * FROM customer
	</sql:query>
			<div id="content">


				<div class="col-xs-12 col-md-9">
					<%
						ProductDAOImpl productDAO = new ProductDAOImpl();
						List<Product> list = new ArrayList<Product>();
						list = productDAO.getList();
						String ma_the_loai = null;
						if (request.getParameter("ma_the_loai") != null) {
							ma_the_loai = request.getParameter("ma_the_loai");
						}
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(0);
					%>
					<div id="site-wrapper" style="float: left">
						<ul class="products homepage">
							<%
								if (ma_the_loai != null) {
									for (Product p : productDAO.getListByCategory(Integer.parseInt(ma_the_loai))) {
							%>

							<li class="preorder"><span class="tagimg "> </span> <a
								href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>">
									<img src="ThuVien/sanpham/<%=p.getHinh_anh()%>"
									width=" 250px" height="250px" />
									<h3>
										<%=p.getTen_san_pham()%>
									</h3>
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
								} else {
									for (Product p : productDAO.getList()) {
							%>

							<li class="preorder"><span class="tagimg "></span> <a
								href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img
									src="ThuVien/sanpham/<%=p.getHinh_anh()%>" width=" 250px"
									height="250px" />
									<h3>
										<%=p.getTen_san_pham()%>
									</h3>
									<h4>
										Giá:
										<%=nf.format(p.getGia_ban())%>
										VNĐ
									</h4> <span class="textkm">Khuyến mãi trị giá đến <strong>500.000₫</strong>
								</span>
									<p class="info">
										<span>Hãng sx: <%=p.getHang_san_xuat()%></span> <span>Giá:
											<%=nf.format(p.getGia_ban())%> VNĐ
										</span> <span>Thông tin: <%=p.getThong_tin()%>
									</p>
							</a></li>
							<%
								}
								}
							%>
						</ul>
					</div>
				</div>
				<div class="col-xs-12 col-md-3"><%@include file="category.jsp"%></div>
			</div>
			<%@include file="footer.jsp"%>
</body>
</html>