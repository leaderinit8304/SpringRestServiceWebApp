<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>		

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewelry E-Commerce</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" />

<script type="text/javascript">

	function shoppingCart(id){
		var dropdownIndex = document.getElementById('quantity').selectedIndex;
        var quantity = document.getElementById('quantity')[dropdownIndex].text;
		
		window.location = "cart.jsp?paramid="+id+"&quantity="+quantity;
	}

	function loadDivInfo(value, id) {
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == XMLHttpRequest.DONE) { // XMLHttpRequest.DONE == 4

				if (xmlhttp.status == 200) {
					if (value == 1) {
						document.getElementById("detail").innerHTML = xmlhttp.responseText;
					} 
					else if (value == 2) {
						document.getElementById("description").innerHTML = xmlhttp.responseText;
					} 
					else if (value == 3) {
						document.getElementById("spec").innerHTML = xmlhttp.responseText;
					} 
					else {
						document.getElementById("ret").innerHTML = xmlhttp.responseText;
					}
				} else if (xmlhttp.status == 400) {
					alert('There was an error 400');
				} else {
					alert('something else other than 200 was returned');
				}
			}
		};

		if (value == 1) {
			xmlhttp.open("GET", "detail.jsp", true);
		} else if (value == 2) {
			xmlhttp.open("GET", "description.jsp", true);
		} else if (value == 3) {
			xmlhttp.open("GET", "othersInfo.jsp", true);
		} else {
			xmlhttp.open("GET", "returnpolicy.jsp", true);
		}
		xmlhttp.send();
	}
</script>
</head>
<body onload="loadDivInfo(1,0); loadDivInfo(2,0); loadDivInfo(3,0); loadDivInfo(4,0); ">

	<div>
		<%@include file="header.jsp"%>
	</div>
	<div>
		<%@include file="menu.jsp"%>
	</div>

	<div id="breadcrumbs">
		<div class="container">
			<ul>
				<li><a href="#">Home</a></li>
				<li>Product page</li>
			</ul>
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->

	<div id="body">
		<div class="container">
			<div id="content" class="full">
				<div class="product">
					<div class="image">
						<img src="<spring:url value="/images/${productdetail.image}.jpg"/>" alt="">
					</div>
					<div class="details">
						<!-- this tag using custom tag and jstl in itemdescription.jsp -->
						<h1>${productdetail.shortname}</h1>
						<h4>Price: <fmt:formatNumber type="number" maxFractionDigits="2" value="${productdetail.price}"/></h4>
						<p id="description"></p>
						<div class="entry">
							<div class="tabs">
								<div class="nav">
									<ul>
										<li class="active"><a href="#detail" onclick="loadDivInfo(1, 0);">Detail</a></li>
										<li><a href="#spec" onclick="loadDivInfo(4, 0);">Returns Policy</a></li>
										<li><a href="#ret" onclick="loadDivInfo(3, 0);">Others</a></li>
									</ul>
								</div>
								<div class="tab-content active" id="detail"></div>
								<div class="tab-content" id="spec"></div>
								<div class="tab-content" id="ret"></div>
							</div>
						</div>
						<div class="actions">
							<label>Quantity:</label> 
							<select id="quantity">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select> 
							<a href="#"  class="btn-grey">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			<!-- / content -->
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>