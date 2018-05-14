<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"  pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/css/to-do.css">
<script src="/resources/js/project/dashboard.js"></script>
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-6 col-md-6 col-sm-12">
				<! -- BASIC PROGRESS BARS -->
				<div class="panel">
					<h3><i class="fa fa-angle-right"></i>구성원 활동 사항</h3>

				</div><!--/showback -->
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12">
				<! -- ALERTS EXAMPLES -->
				<div class="panel">
					<h3><i class="fa fa-angle-right"></i> 내게 할당된 업무</h3>
					<div class="row mb">
						<div class="col-md-12">
							<section class="task-panel tasks-widget">
								<div class="panel-body">
									<div class="task-content">
										<ul class="task-list sortable" id ="backlog_list">
										</ul>
									</div>
								</div>
							</section>
						</div><!--/col-md-12 -->
					</div><!-- /row -->
				</div><!-- /showback -->

			</div>
		</div>
	</section>
</section>
<xmldata id="dashboardXmlData"
         data-backLogList="<c:out value="${backLogList}"/>">
</xmldata>
<script>
	var $xmlData = document.getElementById("dashboardXmlData");
	var backLogList = JSON.parse($xmlData.getAttribute("data-backLogList"));

	$(function () {
		init();

	});

</script>
<script id="backlogListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<li class="list-warning backlog-list">
		<i class=" fa  fa-angle-double-up"></i>
		<div class="task-title">
			<a bl-no="{{bl_no}}" class="col-md-3 col-sm-3  col-lg-3">
				<span class="task-title-sp backlog-id" project-id ="{{project_id}}">
					<strong>[{{project_key}}-{{bl_no}}]</strong></span></a>
			<span class="task-title-sp col-sm-6 col- col-md-7 col-lg-6 ellipsis"
			      data-container="body" data-toggle="popover" data-placement="bottom"
			      data-content="{{bl_title}}">{{bl_title}}</span>
			<span class="badge bg-warning">{{bl_status}}</span>
			<div class="pull-right hidden-phone">
				<span class="badge">{{story_point}}</span>
			</div>
		</div>
	</li>
	{{/each}}
</script>