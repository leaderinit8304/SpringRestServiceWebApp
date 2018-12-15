<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html class="ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Jewelry E-Commerce</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<link href='<spring:url value="/resources/css/style.css"/>'
	rel="stylesheet" />

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
	<div id="slider">
		<ul>
			<li style="background-image: url(<spring:url value='/images/0.jpg'/>)">
				<h3>Make your life better</h3>
				<h2>Genuine diamonds</h2> <!-- <a href="#" class="btn-more">Read more</a> -->
			</li>
			<li class="purple" style="background-image: url(<spring:url value='/images/01.jpg'/>)">
				<h3>She will say “yes”</h3>
				<h2>engagement ring</h2>
			</li>
			<li class="yellow" style="background-image: url(<spring:url value='/images/02.jpg'/>)">
				<h3>You deserve to be beauty</h3>
				<h2>golden bracelets</h2>
			</li>
		</ul>
	</div>
	<!-- / body -->

	<div id="body">
		<div class="container">
			<div class="last-products">
				<h2>Last added products</h2>
				<section class="products"> <c:forEach var="product"
					items="${productsList}" varStatus="i">
					<article> <img
						src="<spring:url value="/images/${product.image}T.jpg"/>" alt="">
					<h3>${product.shortname}</h3>
					<h4></h4>
					<a href="productdetail.jsp?productid=${product.id}" class="btn-add">MORE
						DETAILS</a> </article>
				</c:forEach> </section>
			</div>
		</div>
		<!-- / container -->
	</div>
	<!-- / body -->

	<div>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>