<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
	<title>Project Manager</title>
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="/resources/js/gritter/css/jquery.gritter.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/lineicons/style.css">

	<!-- Bootstrap core CSS -->
	<!-- Custom styles for this template -->
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/style-responsive.css" rel="stylesheet">


	<link href="/resources/css/common/util.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<section id="container">
		<script src="/resources/js/jquery-1.11.1.js"></script>
		<script src="/resources/js/jquery-1.11.1.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script class="include" type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
		<script src="/resources/js/jquery.scrollTo.min.js"></script>

		<link rel="stylesheet" type="text/css" href="http://w2ui.com/src/w2ui-1.5.rc1.min.css" />
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="body"/>
	</section>
<!--common script for all pages-->
<script src="/resources/js/common-scripts.js?ver=2"></script>
</body>
</html>
