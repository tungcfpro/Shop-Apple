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
		<!--<div id="top-bar" class="container">
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
		</div>  -->
		<div id="wrapper" class="container">
			
			
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Cart 2</span></h4>
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
										<td><button onclick="removeSP('${cartDetail.value.masp}')" class="btn btn-danger" type="button">Xóa</button></td>
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
						
						<hr/>
									
					</div>
			
				</div>
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