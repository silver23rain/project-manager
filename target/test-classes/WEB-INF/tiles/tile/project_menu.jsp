<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">
			<div id="user_info">
				<p class="centered"><a href=""><img src="/resources/img/user/${loginUser.user_img}" class="img-circle"
				                                    width="60"></a></p>
				<h5 class="centered"><c:out value="${loginUser.user_id}"/></h5>
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
<script src ="/resources/js/project/project_menu.js"></script>
<script>
	var $xmlData = document.getElementById("projectListXmlData");
	var projectList = JSON.parse($xmlData.getAttribute("data-projectList"));
	Project.Data.projectId = <c:out value="${selectedProjectId}"/>;

	$(function() {
		initMenuTemplate();
		bindEvents();
		focusSelected();

		setTimeout(function() {
			$(".setting-menu ul").css({display:"block"})
		},0);
	});

</script>
<script id="projectListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<li class="sub-menu project-name-menu">
		<a project-id={{project_id}}>
			<i class=" fa fa-caret-right"></i>
			<span>{{project_name}}</span>
		</a>
		<ul class="sub">
			<li><a href="/project/backlog?project_id="><i class=" fa fa-align-justify"></i>백로그</a></li>
			<li><a href="/project/board?project_id="><i class="fa fa-columns"></i>스크럼 보드</a></li>
			<li><a href="/project/report?project_id="><i class=" fa fa-bar-chart-o"></i>보고서</a></li>
			<li class="sub-menu setting-menu"><a href="/project/setting?project_id="><i class="fa fa-cog"></i>설정</a>
				{{isSettingURL}}
			</li>
		</ul>
	</li>
	{{/each}}
</script>
<script>

</script>