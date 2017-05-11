<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="icon" href="ThuVien/favicon.ico" type="image/x-icon" />
<title>Web Security</title>
<meta name="Keywords"
	content="UTE Portal :: HCMC University of Technology and Education, Đại học Sư phạm Kỹ thuật" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="ThuVien/css/Main.css" />
<link rel="stylesheet" type="text/css" href="ThuVien/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="ThuVien/css/sb-admin.css" />
<script src="ThuVien/Jquery/jquery-1.11.3.min.js"></script>
<script src="ThuVien/Js/bootstrap.min.js"></script>
<script src="ThuVien/Jquery/jquery.bootstrap-autohidingnavbar.js"></script>
<script src="ThuVien/Jquery/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="ThuVien/Jquery/localization/messages_vi.js"></script>
<script src="ThuVien/Js/jquery-ui.min.js"></script>
<script src="ThuVien/Js/script.js"></script>
<script>
	$("nav.navbar-fixed-top").autoHidingNavbar();
</script>

<style>
.success {
	color: blue;
}

.error {
	color: red;
}
</style>
</head>

<div class="header">
	<div class="container">
		<div class="col-xs-12 col-md-12">
			<img src="ThuVien/anhsp/banner.jpg" />
		</div>
		<!-- Menu -->
		<div class="col-xs-12 col-md-12">
			<div id='menungang'>
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#">E_Shop Group 06</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="index.jsp"><span>Trang chủ</span></a></li>
								<li class='last'><a href="product.jsp"><span>Sản
											phẩm</span></a></li>
								<li class='last'><a href="cart.jsp"><span>Giỏ
											hàng</span></a></li>
								<li class='last'><a href="search_page.jsp"><span>Tìm
											kiếm</span></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">About Us <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Contract</a></li>
										<li><a href="register.jsp">Register</a></li>
										<li><a href="login.jsp">Login</a></li>
							</ul>

						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>

			<!--  end menu -->

		</div>
	</div>