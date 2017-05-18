<%@page import="model.History"%>
<%@page import="dao.HistoryDAOImpl"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.UserDAOImpl"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
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
							class="product-details">Sản phẩm</label> <label
							class="product-price">Ngày mua</label> <label
							class="product-quantity">Số lượng</label><label
							class="product-line-price">Đã thanh toán</label>
					</div>
					<%
						ProductDAOImpl productDAO = new ProductDAOImpl();
						HistoryDAOImpl historyDAO = new HistoryDAOImpl();
						UserDAOImpl userDAO = new UserDAOImpl();
						User u = userDAO.getUser(username);

						List<History> L = historyDAO.getList(u.getUser_id());
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumIntegerDigits(0);
					%>
					<%
						if (L != null) {
							for (History h : L) {
					%>
					<div class="product">
						<div class="product-image">
							<img
								src="ThuVien/sanpham/<%=productDAO.getProduct(h.getMa_san_pham()).getHinh_anh()%>">
						</div>
						<div class="product-details">
							<div class="product-title">
								<%=productDAO.getProduct(h.getMa_san_pham()).getTen_san_pham()%>
							</div>
							<p class="product-description"></p>
						</div>
						<div class="product-price"><%=h.getNgay_mua()%>
						</div>
						<%-- <div class="product-quantity cart_quantity_button">
							<%=h.getSo_luong()%>
						</div>
						<div class="product-line-price" style="text-align: right"><%=nf.format(productDAO.getProduct(h.getMa_san_pham()).getGia_ban())%>
							VNĐ


						</div>
 --%>
					</div>
					<%
						}
						}
					%>


				</div>
			</div>
		</div>
		<div id="footer"><%@include file="footer.jsp"%></div>
	</div>
</body>
</html>