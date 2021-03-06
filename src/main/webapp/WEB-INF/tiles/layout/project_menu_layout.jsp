<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
	<title>Project Manager</title>
	<!-- Bootstrap core CSS -->
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link href="/resources/css/common/util.css" rel="stylesheet">
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/datepickk.css" rel="stylesheet">
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
	<script src="/resources/js/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sortable/0.9.13/jquery-sortable-min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="/resources/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/jquery.sparkline.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="/resources/js/datepickk.js"></script>

	<link rel="stylesheet" type="text/css" href="http://w2ui.com/src/w2ui-1.5.rc1.min.css" />
	<script src="/resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://w2ui.com/src/w2ui-1.5.rc1.min.js"></script>
	<script src="/resources/js/common/util.js"></script>
	<script type="text/javascript" src="/resources/js/handlebars-v4.0.11.js"></script>
	<script src="/resources/js/project/block.js"></script>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<div id="main_body">
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="modal"/>
		<tiles:insertAttribute name="footer"/>
	</div>
</section>
<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>

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
