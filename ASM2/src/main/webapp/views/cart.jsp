<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Cart</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="<c:url value='home/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">      
		<link href="<c:url value='home/bootstrap/css/bootstrap-responsive.min.css' />" rel="stylesheet">		
		<link href="<c:url value='home/themes/css/bootstrappage.css' />" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="<c:url value='home/themes/css/flexslider.css' />" rel="stylesheet"/>
		<link href="<c:url value='home/themes/css/main.css' />" rel="stylesheet"/>

		<!-- scripts -->
		<script src="<c:url value='home/themes/js/jquery-1.7.2.min.js' />"></script>
		<script src="<c:url value='home/bootstrap/js/bootstrap.min.js' />"></script>				
		<script src="<c:url value='home/themes/js/superfish.js' />"></script>	
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>		
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="<c:url value='/cart?action=view' />">Your Cart <b>(<span id="countTotal">${sessionScope.cart.tongsl}</span>)</b></a></li>
							<c:if test="${empty sessionScope.user}">
								<li><a href="<c:url value='/login' />">Login</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.user}">
								<li><a href="<c:url value='/logout' />">Logout</a></li>					
								<li><i>Welcome,</i> <b>${sessionScope.user.username}</b></li>
							</c:if>
						</ul>
						<input type="hidden" id="checkUserLogin" value="${sessionScope.user.username}" />
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="<c:url value='/index' />" class="logo pull-left"><img src="<c:url value='home/themes/images/logo.png' />" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">Woman</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">Man</a></li>			
							<li><a href="./products.html">Sport</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">Hangbag</a></li>
							<li><a href="./products.html">Best Seller</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav>
				</div>
			</section>	
			<section class="header_text sub">
			<img class="pageBanner" src="<c:url value='home/themes/images/pageBanner.jpg' />" alt="New products" >
				<h4><span>Cart detail</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Remove</th>
									<th>Image</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Unit Price</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cartDetail" items="${sessionScope.cart.detail}">
									<tr id="tr-${cartDetail.value.masp}">
										<td><button onclick="removeSP('${cartDetail.value.masp}')" class="btn btn-danger" type="button">X</button></td>
										<td></td>
										<td>${cartDetail.value.tensp}</td>
										<td><input id="slMua-${cartDetail.value.masp}" onchange="updateCart('${cartDetail.value.masp}')" type="number" class="input-mini" value="${cartDetail.value.slMua}"></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cartDetail.value.giasp}" /></td>
										<td>
											<span id="totalSP-${cartDetail.value.masp}">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartDetail.value.giasp * cartDetail.value.slMua}" />
											</span>
										</td>
									</tr>
									<input type="hidden" id="giaSP-${cartDetail.value.masp}" value="${cartDetail.value.giasp}" />
								</c:forEach>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong id="tongTien"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sessionScope.cart.tongtien}"/></strong></td>
								</tr>		  
							</tbody>
						</table>
						<hr/>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<label class="control-label">Phone number:</label>
									<div class="controls">
										<input id="phoneNumber" type="text" placeholder="" maxlength="11" class="input-xlarge">
									</div>
								</div>
							</div>
							<div class="span6">
								<div class="control-group">
									<label class="control-label">Address:</label>
									<div class="controls">
										<input id="address" type="text" placeholder="" class="input-xlarge">
									</div>
								</div>
							</div>
						</div>
						<hr/>
						<p class="buttons center">				
							<button class="btn btn-inverse" type="button" id="payNow">Pay Now</button>
						</p>					
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">CATEGORIES</li>
								<c:forEach var="category" items="${listCategory}">
									<li><a href="<c:url value='/sanpham?maDM=${category.madm}'/>">${category.tendanhmuc}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</section>						
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="./index.html">Homepage</a></li>  
							<li><a href="./about.html">About Us</a></li>
							<li><a href="./contact.html">Contac Us</a></li>
							<li><a href="./cart.html">Your Cart</a></li>
							<li><a href="./register.html">Login</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="<c:url value='home/themes/images/logo.png' />" class="site_logo" alt=""></p>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="<c:url value='home/themes/js/common.js' />"></script>
		<script>
			function removeSP(maSP) {
				$.ajax({
        	        url: 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
        	        dataType : 'json'
        	    }).then(function(data) {
        	    	$('#tongTien').text(numberWithDot(data.tongtien));
        	    	$('#countTotal').text(data.tongsl);
        	    	var idRemoveTag = '#tr-' + maSP;
        	    	$(idRemoveTag).remove();
        	    }).fail(function(error) {
        	    	alert('Xóa thất bại, vui lòng thử lại!');
        	    });
			}
			
			function updateCart(maSP) {
				var idInputSL = '#slMua-' + maSP;
				var slUpdate = $(idInputSL).val();
				var idInputGiaSP = '#giaSP-' + maSP;
				var giaSP = parseFloat($(idInputGiaSP).val());
				if (parseInt(slUpdate) < 1) {
					removeSP(maSP);
				} else {
					$.ajax({
	        	        url: 'cart?action=add&masp=' + maSP + '&soluong=' + slUpdate + '&isUpdate=1',
	        	        dataType : 'json'
	        	    }).then(function(data) {
	        	    	$('#tongTien').text(numberWithDot(data.tongtien));
	        	    	$('#countTotal').text(data.tongsl);
	        	    	var tongTienSPUpdate = parseFloat(giaSP * parseInt(slUpdate)); 
	        	    	let idTongGiaSP = '#totalSP-' + maSP;
	        	    	$(idTongGiaSP).text(numberWithDot(tongTienSPUpdate));
	        	    }).fail(function(error) {
	        	    	alert('Cập nhật thất bại, vui lòng thử lại!');
	        	    });
				}
			}
			
			$('#payNow').click(function() {
				var checkUserLogin = $('#checkUserLogin').val();
				if (checkUserLogin.length == 0) {
					window.location.href = "login";
					return;
				}
				
				var phone = $('#phoneNumber').val();
				var address = $('#address').val();
				if (phone.length == 0) {
					alert('Vui lòng nhập sdt');
					$('#phoneNumber').focus();
					return;
				};
				if (address.length == 0) {
					alert('Vui lòng nhập địa chỉ');
					$('#address').focus();
					return;
				}
				
				$.ajax({
        	        url: 'cart?action=paying&phone=' + phone + '&address=' + address,
        	        dataType : 'json'
        	    }).then(function(data) {
        	    	alert('Thanh toán thành công!');
        	    	window.location.href = "index";
        	    }).fail(function(error) {
        	    	alert('Thanh toán thất bại, vui lòng thử lại!');
        	    });
			})
			
			function numberWithDot(x) {
			    return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
			}
		</script>	
    </body>
</html>