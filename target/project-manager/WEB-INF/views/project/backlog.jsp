<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/to-do.css">
<style>
	.status-badge {
		display: inline;
		margin-left: 20px;
	}

	.hidden-li {
		height: 4px;
	!important;
		opacity: 0;
	}
</style>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/resources/js/project/backlog.js"></script>
<script src="/resources/js/project/sprint.js"></script>
<section id="main-content">
	<section class="wrapper">
		<div id="sprint_main">
		</div>
		<hr>
		<div id="backlog_main">
			<div class="col-md-12">
				<h3><i class="fa fa-angle-down"></i>백로그 목록
					<button id="sprint_create_btn" class="btn btn-default btn-sm pull-right">스프린트 생성</button>
				</h3>
			</div>
			<div class="row mb">
				<div class="col-md-12">
					<section class="task-panel tasks-widget">
						<div class="panel-body">
							<div class="task-content">
								<ul class="task-list sortable" id="backlog_list">
									<li class="hidden-li"></li>
								</ul>
							</div>
							<div class="add-baklog-row">
								<div class="col-sm-10">
									<input type="text" placeholder="백로그명을 입력하시오." id="backlog_name"
									       class="form-control">
									<div class="alert-div">
										<div class="alert-danger alert-sm alert" id="backlog_name_alert"
										></div>
									</div>
								</div>
								<div class="col-sm-2">
									<a id="backlog_create_btn" class="btn btn-success btn-sm pull-right">백로그 생성</a>
								</div>
							</div>
						</div>
					</section>
				</div><!--/col-md-12 -->
			</div><!-- /row -->
		</div>
	</section>
</section>
<div class="modal fade" id="simple_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-info" id="modal_submit"></button>
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="backlogDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-info" id="modal_submit"></button>
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<xmldata id="backlogListXmlData"
         data-backLogList="<c:out value="${backLogList}"/>"
         data-sprintNameList="<c:out value="${sprintNameList}"/>">
</xmldata>
<script>
	var $xmlData = document.getElementById("backlogListXmlData");
	var backLogList = JSON.parse($xmlData.getAttribute("data-backLogList"));
	var sprintNameList = JSON.parse($xmlData.getAttribute("data-sprintNameList"));
	$(function() {
		BackLog.initSprintTemplate();
		BackLog.init();
		Sprint.init();
		BackLog.bindEvents();
	});
</script>
<script id="backlogListTemplate" type="text/x-handlebars-template">
	<li class="list-warning backlog-list">
		<i class=" fa  fa-angle-double-up"></i>
		<div class="task-title">
			<a bl-no="{{bl_no}}" class="col-md-2 col-sm-2  "> <span class="task-title-sp backlog-id"><strong>[{{project_key}}-{{bl_no}}]</strong></span></a>
			<span class="task-title-sp col-sm-7">{{bl_title}}</span>
			<span class="badge bg-warning">{{bl_status}}</span>
			<div class="pull-right hidden-phone">
				<span class="badge">{{story_point}}</span>
			</div>
		</div>
	</li>
</script>
<script id="sprintListTemplate" type="text/x-handlebars-template">
	{{#each.}}
	{{#checkSprintStatus}}
	<div>
        <h3><i class="fa fa-angle-right"></i><span class ="sprint-title">{{project_name}}스프린트-{{sprint_year}}_{{sprint_no}}</span>
			<div class="status-badge">
				<span class="badge bg-theme">0</span>
				<span class="badge bg-primary">0</span>
				<span class="badge bg-success">0</span>
			</div>
			<button class="btn btn-info btn-sm pull-right sprint-open-btn">스프린트 시작하기</button>
		</h3>
		<div class="row mb">
			<div class="col-md-12">
				<section class="task-panel tasks-widget">
					<div class="panel-body collapse">
						<div class="task-content">
							<ul class="task-list sortable sprint-list" id="{{sprint_year}}_{{sprint_no}}"
							    sprint-year="{{sprint_year}}" sprint-no="{{sprint_no}}">
								<li class="hidden-li"></li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	{{/checkSprintStatus}}
	{{/each}}
</script>
