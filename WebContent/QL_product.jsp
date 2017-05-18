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
			SELECT * FROM customer
	</sql:query>
			<div id="content">
			        <%if(session.getAttribute("role")=="1"){ %>

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
						<table class="table table-striped">
							<thead>
								<th>Mã Thể Loại</th>
								<th>Hình Ảnh</th>
								<th>Tên Sản Phẩm</th>
								<th>Giá Bán</th>
								<th>Hãng Sản Xuất</th>
								<th></th>
							</thead>
							<tbody>
								<%
									for (Product p : productDAO.getList()) {
								%>
								<tr>
									<form action="Data/delete_product.jsp" method="post">
									<td><input type="hidden" name="ma_san_pham" value="<%=p.getMa_san_pham()%>"/><%=p.getMa_san_pham()%></td>
									<td><img src="ThuVien/sanpham/<%=p.getHinh_anh()%>"
										width=" 50px" height="50px" /></td>
									<td><%=p.getTen_san_pham()%></td>
									<td><%=nf.format(p.getGia_ban())%></td>
									<td><%=p.getHang_san_xuat()%></td>
									<td><input type="submit" class="btn btn-primary"  value="xóa"></td>
									</form>
								</tr>
								<%
									}
								%>
							
						</table>
						     <font color="red" id="msgbox"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font>
					</div>
				</div>
				<div class="col-xs-12 col-md-3"><%@include
						file="category.jsp"%></div>
			</div>
			<%}else { %>
			<font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
             <c:redirect url="index.jsp" >
                <c:param name="errMsg" value="Không được quyền truy cập" />
            </c:redirect> 
			<%} %>
			<%@include file="footer.jsp"%>
</body>
</html>