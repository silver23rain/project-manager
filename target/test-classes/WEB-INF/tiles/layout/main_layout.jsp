<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html lang="ko">
<head>
	<title>Project Manager</title>

	<!-- Bootstrap core CSS -->
	<link href="/resources/css/bootstrap.css" rel="stylesheet">
	<!--external css-->
	<link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="/resources/css/zabuto_calendar.css">
	<link rel="stylesheet" type="text/css" href="/resources/js/gritter/css/jquery.gritter.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/lineicons/style.css">

	<link href="/resources/css/common/util.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="/resources/css/style.css" rel="stylesheet">
	<link href="/resources/css/style-responsive.css" rel="stylesheet">

	<script src="/resources/js/chart-master/Chart.js"></script>

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
	<%--<script src="resources/js/jquery.nicescroll.js" type="text/javascript"></script>--%>
	<script src="/resources/js/jquery.sparkline.js"></script>

	<link rel="stylesheet" type="text/css" href="http://w2ui.com/src/w2ui-1.5.rc1.min.css" />
	<script type="text/javascript" src="http://w2ui.com/src/w2ui-1.5.rc1.min.js"></script>

	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="menu"/>
	<div id = "main_body">
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="footer"/>
	</div>
</section>

<!--common script for all pages-->
<script src="/resources/js/common-scripts.js"></script>

<script type="text/javascript" src="/resources/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="/resources/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="/resources/js/sparkline-chart.js"></script>
<script src="/resources/js/zabuto_calendar.js"></script>

<script type="application/javascript">
	$(document).ready(function () {
		$("#date-popover").popover({html: true, trigger: "manual"});
		$("#date-popover").hide();
		$("#date-popover").click(function (e) {
			$(this).hide();
		});

		$("#my-calendar").zabuto_calendar({
			action: function () {
				return myDateFunction(this.id, false);
			},
			action_nav: function () {
				return myNavFunction(this.id);
			},
			ajax: {
				url: "show_data.php?action=1",
				modal: true
			},
			legend: [
				{type: "text", label: "Special event", badge: "00"},
				{type: "block", label: "Regular event",}
			]
		});
	});


	function myNavFunction(id) {
		$("#date-popover").hide();
		var nav = $("#" + id).data("navigation");
		var to = $("#" + id).data("to");
		console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
	}
</script>


</body>
</html>
