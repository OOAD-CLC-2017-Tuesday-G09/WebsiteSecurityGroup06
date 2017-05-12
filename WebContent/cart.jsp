<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
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
<title>Giỏ hàng</title>
<link rel="stylesheet" href="ThuVien/css/cart.css" />
<style type="text/css">
#main {
	width: 1060px;
	padding: 0;
	margin-left: auto;
	margin-right: auto;
}

#head {
	height: 200px;
	background-color: #F5F5F5;
	border: 1px solid #CDCDCD;
	margin-bottom: 5px;
	margin-top: 5px;
}

#head-link {
	height: 50px;
	line-height: 30px;
	border: 1px solid #CDCDCD;
	background-color: #F5F5F5;
	margin-bottom: 5px;
	clear: both;
}

#content {
	width: 1060px;
	min-height: 430px;
	border: 1px solid #CDCDCD;
	float: left;
	margin-bottom: 5px;
	clear: both;
}

#footer {
	height: 50px;
	clear: both;
	border: 1px solid #CDCDCD;
	background-color: #F8F8FF;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div id="main">
		<div class="container">
			<div id="content">


				<div class="shopping-cart">

					<div class="column-labels">
						<label class="product-image">Hình ảnh</label> <label
							class="product-details">Product</label> <label
							class="product-price">Giá bán</label> <label
							class="product-quantity">Số lượng</label><label
							class="product-line-price">Tổng tiền</label>
					</div>
					<%
						ProductDAOImpl productDAO = new ProductDAOImpl();

						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumIntegerDigits(0);
						double total = 0;
						ArrayList<Cart> cart = null;
						if (session.getAttribute("cart") != null) {
							cart = (ArrayList<Cart>) session.getAttribute("cart");
						}
					%>
					<%
						if (cart != null) {
							for (Cart c : cart) {
								total = total + (c.getQuantity() * productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban());
					%>
					<div class="product">
						<div class="product-image">
							<img
								src="ThuVien/sanpham/<%=productDAO.getProduct(c.getP().getMa_san_pham()).getHinh_anh()%>">
						</div>
						<div class="product-details">
							<div class="product-title">
								<%=productDAO.getProduct(c.getP().getMa_san_pham()).getTen_san_pham()%>
							</div>
							<p class="product-description"></p>
						</div>
						<div class="product-price"><%=nf.format(productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban())%>
							VNĐ
						</div>
						<div class="product-quantity cart_quantity_button">
							<a class="cart_quantity_up"
								href="GioHangServlet?command=deleteCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>">
								- </a> <input class="cart_quantity_input" type="number"
								value="<%=c.getQuantity()%>" disabled="disabled"> <a
								class="cart_quantity_up"
								href="GioHangServlet?command=addCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>">
								+ </a>
						</div>
						<div class="product-line-price" style="text-align: right"><%=nf.format(productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban() * c.getQuantity())%>
							VNĐ <a
								href="GioHangServlet?command=removeCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>"><img
								style="margin-left: 10px" src="ThuVien/images/delete.png"></a>
						</div>

					</div>
					<%
						}
						}
					%>
					<div class="totals">
						<div class="totals-item">
							<label>Tổng hóa đơn</label>
							<div class="totals-value" id="cart-subtotal"><%=nf.format(total)%>
								VNĐ
							</div>
						</div>
					</div>
					<%
						if (cart.size() > 0) {
					%>
					<a class="checkout" href="history.jsp"
						style="text-decoration: none;">Lịch sử</a> <a class="checkout"
						href="ConfirmServlet?username=<%=username%>"
						style="text-decoration: none;">Thanh toán</a>
					<%
						} else {
					%>
					<a class="checkout" href="history.jsp"
						style="text-decoration: none;">Lịch sử</a> <a class="checkout"
						href="product.jsp" style="text-decoration: none;">Thanh toán</a>
					<%
						}
					%>
				</div>
			</div>
		</div>

		<div id="footer">
			<%@include file="footer.jsp"%></div>
	</div>
</body>
</html>