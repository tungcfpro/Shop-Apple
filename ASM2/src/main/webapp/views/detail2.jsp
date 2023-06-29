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
							<li><a href="<c:url value='/cart2?action=view' />">Your Cart 2 <b>(<span id="countTotal">${sessionScope.cart.tongsl}</span>)</b></a></li>
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