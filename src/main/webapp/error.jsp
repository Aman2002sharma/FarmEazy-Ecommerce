<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Error</title>
<%@ include file="components/common_cs_js.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="text-center">
		<h1>Payment Error</h1>
		<br />
		<h3>${errorMessage}</h3>
		<br />
	</div>

	<div class="text-center">
		<a href="index.jsp"><button class="btn custom-bg text-white">Go to Home Page</button></a>
	</div>

</body>
</html>