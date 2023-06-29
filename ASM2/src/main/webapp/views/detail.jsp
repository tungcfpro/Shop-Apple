<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${product.tensp}</title>
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
							<li><a href="<c:url value='/cart2?action=view' />">Your Cart <b>(<span id="countTotal">${sessionScope.cart.tongsl}</span>)</b></a></li>
							<c:if test="${empty sessionScope.user}">
								<li><a href="<c:url value='/login' />">Login</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.user}">
								<li><a href="<c:url value='/logout' />">Logout</a></li>					
								<li><i>Welcome,</i> <b>${sessionScope.user.username}</b></li>
							</c:if>		
						</ul>
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
				<h4><span>${product.tensp}</span></h4>
			</section>
			<section class="main-content">
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
								<a href="<c:url value='home/themes/images/product/${product.hinh}' />" class="thumbnail" data-fancybox-group="group1" title="Description 1">
									<img alt="" src="<c:url value='home/themes/images/product/${product.hinh}' />">
								</a>												
							</div>
							<div class="span5">
								<address>
									<strong>Availability:</strong> <span>${product.soluong}</span><br>
									<input type="hidden" id="maSP" value="${product.masp}"/>
									<input type="hidden" id="soLuongTrongKho" value="${product.soluong}"/>
								</address>									
								<h4><strong>Price: <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.giasp}" /></strong></h4>
							</div>
							<div class="span5">
								<form class="form-inline">
									<p>&nbsp;</p>
									<label>Qty:</label>
									<input id="soLuongMua" type="number" value="1" class="span1" placeholder="1" min="1" max="${product.soluong}">
									<button class="btn btn-inverse" type="button" id="addToCart">Add to cart</button>
								</form>
							</div>							
						</div>
						<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#home">Description</a></li>
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane active" id="home">${product.mota}</div>
								</div>							
							</div>						
							<div class="span9">	
								<br>
								<h4 class="title">
									<span class="pull-left"><span class="text"><strong>Related</strong> Products</span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-1" data-slide="prev"></a><a class="right button" href="#myCarousel-1" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-1" class="carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails listing-products">
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/6.jpg"></a><br/>
														<a href="product_detail.html" class="title">Wuam ultrices rutrum</a><br/>
														<a href="#" class="category">Suspendisse aliquet</a>
														<p class="price">$341</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/5.jpg"></a><br/>
														<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
														<a href="#" class="category">Phasellus consequat</a>
														<p class="price">$341</p>
													</div>
												</li>       
												<li class="span3">
													<div class="product-box">												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/4.jpg"></a><br/>
														<a href="product_detail.html" class="title">Praesent tempor sem</a><br/>
														<a href="#" class="category">Erat gravida</a>
														<p class="price">$28</p>
													</div>
												</li>												
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails listing-products">
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/1.jpg"></a><br/>
														<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
														<a href="#" class="category">Phasellus consequat</a>
														<p class="price">$341</p>
													</div>
												</li>       
												<li class="span3">
													<div class="product-box">												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/2.jpg"></a><br/>
														<a href="product_detail.html">Praesent tempor sem</a><br/>
														<a href="#" class="category">Erat gravida</a>
														<p class="price">$28</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="product_detail.html"><img alt="" src="themes/images/ladies/3.jpg"></a><br/>
														<a href="product_detail.html" class="title">Wuam ultrices rutrum</a><br/>
														<a href="#" class="category">Suspendisse aliquet</a>
														<p class="price">$341</p>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
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
				<span>Copyright bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="<c:url value='home/themes/js/common.js' />"></script>	
    </body>
    <script>
    	$('#addToCart').click(function() {
    		var maSP = $('#maSP').val();
    		var soLuongMua = parseInt($('#soLuongMua').val());
    		var soLuongTrongKho = parseInt($('#soLuongTrongKho').val());
    		
    		if (soLuongMua > soLuongTrongKho || soLuongMua < 1) {
    			alert('Kiểm tra lại số lượng');
    		} else {
    			$.ajax({
        	        url: 'cart2?action=add&masp=' + maSP + '&soluong=' + soLuongMua + '&isUpdate=0',
        	        dataType : 'json'
        	    }).then(function(data) {
        	    	alert('Thêm thành công vào giỏ hàng!');
        	    	$('#countTotal').text(data.tongsl);
        	    }).fail(function(error) {
        	    	alert('Thêm thất bại, vui lòng thử lại!');
        	    });
    		}
    	})
    	
    	
    </script>
</html>