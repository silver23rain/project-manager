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
<script>
	var $xmlData = document.getElementById("projectListXmlData");
	var projectList = JSON.parse($xmlData.getAttribute("data-projectList"));
	Project.Data.projectId = "<c:out value="${selectedProjectId}"/>";

	$(function() {
		initMenuTemplate();
		bindEvents();
		focusSelected();
	});
	var focusSelected = function() {
		$(".sub-menu > a").removeClass("active");
		$(".sub-menu > a").each(function(index, item) {
			if($(item).attr("project-id") === Project.Data.projectId) {
				$(this).addClass("active");
			}
		})
		$("a .active").siblings().find('li').addClass("active");
		// console.log($("a .active"));

	};

	var initMenuTemplate = function() {
		var source = $("#projectListTemplate").html();
		var template = Handlebars.compile(source);
		var html = template(projectList);

		$("#menu").append(html);
	};
	var bindEvents = function() {
		$(".sub-menu > a").on("click", function(e) {
			e.preventDefault();
			Project.Data.projectId = $(this).attr("project-id");
		});

		$(".sub a").on("click" , function(e) {
			e.preventDefault();
			window.location.href = $(this).attr("href") + Project.Data.projectId;
		});
	}
</script>
<script id="projectListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<li class="sub-menu">
		<a project-id={{project_id}}>
			<i class=" fa fa-caret-right"></i>
			<span>{{project_name}}</span>
		</a>
		<ul class="sub">
			<li><a href="/project/backlog?project_id="><i class=" fa fa-align-justify"></i>백로그</a></li>
			<li><a><i class="fa fa-columns"></i>칸반보드</a></li>
			<li><a><i class=" fa fa-bar-chart-o"></i>보고서</a></li>
			<li><a><i class="fa fa-cog"></i>설정</a></li>
		</ul>
	</li>
	{{/each}}
</script>