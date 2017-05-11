<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!--webfont-->
<script src="ThuVien/Js/jquery.easydropdown.js"></script>
<!-- Add fancyBox main JS and CSS files -->
<script src="ThuVien/Js/jquery.magnific-popup.js" type="text/javascript"></script>
<link href="ThuVien/Css/magnific-popup.css" rel="stylesheet"
	type="text/css">
<script>
	$(document).ready(function() {
		$('.popup-with-zoom-anim').magnificPopup({
			type : 'inline',
			fixedContentPos : false,
			fixedBgPos : true,
			overflowY : 'auto',
			closeBtnInside : true,
			preloader : false,
			midClick : true,
			removalDelay : 300,
			mainClass : 'my-mfp-zoom-in'
		});
	});
</script>
<script type="text/javascript">
	function submit() {
		var alphaExp = /^[a-zA-Z]+$/;
		var inputtext = document.getElementById("name");
		if (inputtext.value.match(alphaExp)) {
			return true;
		} else {
			document.getElementById('p1').innerText = "Please enter the valid text";
			inputtext.focus();
			return false;
		}
	}
</script>
<script type="text/javascript">
	function loadXMLDoc() {
		var xmlhttp;
		var emailValue = document.getElementById("email").value;
		var urls = "emailConnection.jsp?ver=" + emailValue;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				//document.getElementById("err").style.color="red";
				document.getElementById("err").innerHTML = xmlhttp.responseText;

			}
		}
		xmlhttp.open("GET", urls, true);
		xmlhttp.send();
	}
</script>
<!----details-product-slider--->
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container">

		<div class="panel panel-default">
			<div class="panel-body">
				<form action="emailConnection.jsp" method="post">
					<div class="form-group">
						<h3>Personal Information</h3>
						<div class="col-xs-12 col-md-6">
							<span>Name<label>*</label></span> <input type="text"
								class="form-control" name="name" id="name">
							<p id="p1"></p>
						</div>
						<div class="col-xs-12 col-md-6">
							<span>Email Address<label>*</label></span> <input
								class="form-control" type="text" name="email" id="email"
								onkeyup="loadXMLDoc()">
								<span>
							</br>
						</div>

						<div class="col-xs-12 col-md-6">
							<span>Phone<label>*</label></span> <input class="form-control"
								type="text" name="phone">
						</div>
						<div class="col-xs-12 col-md-6">
							<span>Zip<label>*</label></span> <input type="text"
								class="form-control" name="zip"></br>
						</div>
						<div class="clearfix"></div>
						<a class="news-letter" href="#"> <input type="hidden"
							name="key" value="register" />
						</a>
					</div>
					<div class="register-bottom-grid">
						<div class="col-xs-12 col-md-6">
							<span>Password<label>*</label></span> <input class="form-control"
								type="text" name="password"></br>
						</div>
						<div></div>
					</div>
					<div class="clearfix"></div>
					<div class="register-but">
						<input class="btn btn-default" type="submit" value="Register"
							onclick='return submit()'>
						<div class="clearfix"></div>

						
				</form>
			</div>
		</div>
					<font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font>
	</div>
	</div>
	</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
