<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html lang="ko">
<head>
	<title>Project Manager</title>

	<!-- Bootstrap core CSS -->
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="/resources/js/gritter/css/jquery.gritter.css"/>
	<link href="/resources/css/common/util.css" rel="stylesheet">
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/style-responsive.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->



</head>

<body>

<section id="container">
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="/resources/js/jquery-1.11.1.js"></script>
	<script src="/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<script src="resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.sparkline.js"></script>

	<link rel="stylesheet" type="text/css" href="http://w2ui.com/src/w2ui-1.5.rc1.min.css" />
	<script type="text/javascript" src="http://w2ui.com/src/w2ui-1.5.rc1.min.js"></script>
	<script src="/resources/js/common/util.js"></script>
	<script type="text/javascript" src="/resources/js/handlebars-v4.0.11.js"></script>

	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<div id = "main_body">
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="modal"/>
		<tiles:insertAttribute name="footer"/>
	</div>
</section>

<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>

<script type="text/javascript" src="/resources/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="/resources/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="/resources/js/sparkline-chart.js"></script>

<script type="application/javascript">
	$(document).ready(function () {
		$("#date-popover").popover({html: true, trigger: "manual"});
		$("#date-popover").hide();
		$("#date-popover").click(function (e) {
			$(this).hide();
		});

	});
</script>


</body>
</html>

