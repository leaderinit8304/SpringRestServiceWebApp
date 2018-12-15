<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewelry E-Commerce</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" />
<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<body>

	<div>
		<%@include file="header.jsp"%>
	</div>
	<div>
		<%@include file="menu.jsp"%>
	</div>

	<!-- / navigation -->

	<div id="breadcrumbs">
		<div class="container">
			<ul>
				<li><a href="#">Home</a></li>
				<li>Product results</li>
			</ul>
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->

	<div id="body">
		<div class="container">
			<div class="pagination">
				<ul>
					<li><a href="products.jsp?idParam=${currpage-1}"><span class="ico-prev"></span></a></li>
					<c:forEach begin="1" end="${pagetotal}" varStatus="loop" >
						<c:choose>
							<c:when test="${loop.index == currpage}">
						              <li class="active"><a href="products.jsp?idParam=${loop.index}">${loop.index}</a></li>
						    </c:when>
						    <c:otherwise>
						              <li><a href="products.jsp?idParam=${loop.index}">${loop.index}</a></li>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="products.jsp?idParam=${currpage+1}"><span class="ico-next"></span></a></li>
				</ul>
			</div>
			<div class="products-wrap">
				<aside id="sidebar">
				<div class="widget">
					<h3>Products per page:</h3>
					<fieldset>
						<input checked type="checkbox"> <label>8</label> <input
							type="checkbox"> <label>16</label> <input type="checkbox">
						<label>32</label>
					</fieldset>
				</div>
				<div class="widget">
					<h3>Sort by:</h3>
					<fieldset>
						<input checked type="checkbox"> <label>Popularity</label>
						<input type="checkbox"> <label>Date</label> <input
							type="checkbox"> <label>Price</label>
					</fieldset>
				</div>
				<div class="widget">
					<h3>Condition:</h3>
					<fieldset>
						<input checked type="checkbox"> <label>New</label> <input
							type="checkbox"> <label>Used</label>
					</fieldset>
				</div>
				<div class="widget">
					<h3>Price range:</h3>
					<fieldset>
						<div id="price-range"></div>
					</fieldset>
				</div>
				</aside>
				<div id="content">
					<section class="products"> 
					<c:forEach var="product" items= "${productsList}" varStatus="i">
						<article > 
							<a href="productdetail.jsp?productid=${product.id}">
							<img src="<spring:url value="/images/${product.image}T.jpg"/>" alt="">
							</a>
							<h3>
								<a href="productdetail.jsp?productid=${product.id}">${product.shortname}</a>
							</h3>
							<h4>
								<a href="productdetail.jsp?productid=${product.id}">
									<fmt:formatNumber type="number" maxFractionDigits="2" value="${product.price}"/>
								</a>
							</h4>
							<a href="#" class="btn-add">Add to cart</a> 
						</article>
					</c:forEach> 
					</section>
				</div>
				<!-- / content -->
			</div>
			<div class="pagination">
				<ul>
					<li><a href="products.jsp?idParam=${currpage-1}"><span class="ico-prev"></span></a></li>
					<c:forEach begin="1" end="${pagetotal}" varStatus="loop" >
						<c:choose>
							<c:when test="${loop.index == currpage}">
						              <li class="active"><a href="products.jsp?idParam=${loop.index}">${loop.index}</a></li>
						    </c:when>
						    <c:otherwise>
						              <li><a href="products.jsp?idParam=${loop.index}">${loop.index}</a></li>
						    </c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="products.jsp?idParam=${currpage+1}"><span class="ico-next"></span></a></li>
				</ul>
			</div>
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->

	<div>
		<%@include file="footer.jsp"%>
	</div>
	<!-- / footer -->

</body>
</html>