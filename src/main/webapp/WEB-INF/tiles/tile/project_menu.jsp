<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">
			<div id="user_info">
				<p class="centered"><a href="profile.html"><img src="/resources/img/ui-sam.jpg" class="img-circle"
				                                                width="60"></a></p>
				<h5 class="centered">Marcel Newman</h5>
			</div>
			<div id="menu">

			</div>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<xmldata id="projectListXmlData"
         data-projectList="<c:out value="${projectList}"/>">
</xmldata>
<script type="text/javascript" src="/resources/js/handlebars-v4.0.11.js"></script>
<script>
	var $xmlData = document.getElementById("projectListXmlData");
	var projectList = JSON.parse($xmlData.getAttribute("data-projectList"));
	$(function() {
		console.log(projectList);
		initTemplate();
	});
	var initTemplate = function() {
		var source = $("#projectListTemplate").html();

		var template = Handlebars.compile(source);

		var html = template(projectList);

		$("#menu").append(html);
	}
</script>
<script id="projectListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<li class="sub-menu" project-id={{project_id}}>
		<a href="javascript:;">
			<i class=" fa fa-bar-chart-o"></i>
			<span>{{project_name}}</span>
		</a>
		<ul class="sub">
			<li><a href="morris.html">백로그</a></li>
			<li><a href="chartjs.html">칸반보드</a>
			</li>
			<li><a href="morris.html">보고서</a></li>
			<li><a href="chartjs.html">설정</a></li>
		</ul>
	</li>
	{{/each}}
</script>