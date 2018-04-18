<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
	<title>Project Manager</title>
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet"/>

	<!-- Custom styles for this template -->
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/style-responsive.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<script src="/resources/js/jquery-1.11.1.js"></script>
	<script src="/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
</body>
</html>
