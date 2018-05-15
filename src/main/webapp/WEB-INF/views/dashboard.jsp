<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/css/to-do.css">
<style>
	.feed-list li > div {
		min-height: 30px;
		background: rgb(245, 246, 248);;
		margin-bottom: 8px;
		padding-top: 10px;
	}

	.backlog-key {
		height: 20px;
	}

	.feed-list li:not(.hidden-li) {
		height: 80px;
	}

	.feed-list div > div {
		padding-right: 0px;
	!important;
	}

</style>
<script src="/resources/js/project/dashboard.js"></script>
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-6 col-md-6 col-sm-12">
				<div class="panel">
					<h3><i class="fa fa-angle-right"></i>구성원 활동 사항</h3>
					<div class="pn">
						<div class="row">
							<ul class="sortable task-list feed-list" id="feed_list"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12">
				<div class="panel">
					<h3><i class="fa fa-angle-right"></i> 내게 할당된 업무</h3>
					<div class="row">
						<div class="col-md-12">
							<section class="tasks-widget pn">
								<div class="panel-body">
									<div class="task-content">
										<ul class="task-list sortable" id="backlog_list">
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
         data-backLogList="<c:out value="${backLogList}"/>"
         data-feedList="<c:out value="${feedList}"/>">
</xmldata>
<script>
	var $xmlData = document.getElementById("dashboardXmlData");
	var backLogList = JSON.parse($xmlData.getAttribute("data-backLogList"));
	var feedList = JSON.parse($xmlData.getAttribute("data-feedList"));

	$(function() {
		init();

	});

</script>
<script id="feedListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<li>
		<div class="col-md-11 col-sm-11 col-xs-11 col-lg-11">
			<div class="col-md-2 col-xs-2" style="padding-left: 0px">
				<p class="tooltips assigned-user" data-toggle="tooltip" data-placement="top" title="{{target_user}}">
					<img src="/resources/img/user/{{user_img}}" class="img-circle" width="60">
				</p>
			</div>
			<div class="col-md-10 col-xs-10" style="padding-right: 0px;">
				<div class="backlog-key col-sm-12 goleft">
					<a> <span class="user-name"><strong style="font-size: 1.2em;">{{user_name}}</strong></span></a>
				</div>
				<div class="backlog-title col-sm-12 goleft ellipsis " data-container="body" data-toggle="popover" data-placement="bottom"
				     data-content="{{comment}}">
					<p><strong style="margin-right: 5px;">{{project_key}}-{{bl_no}}</strong>{{comment}}</p>
				</div>
				<div class="backlog-title col-sm-12 goleft">
					{{convertDate regdate}}
				</div>
			</div>
		</div>
	</li>
	{{/each}}
</script>
<script id="backlogListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<li class="list-warning backlog-list">
		<i class=" fa  fa-angle-double-up"></i>
		<div class="task-title">
			<a bl-no="{{bl_no}}" class="col-md-3 col-sm-3  col-lg-3">
				<span class="task-title-sp backlog-id" project-id="{{project_id}}">
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