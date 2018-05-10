<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
</style>
<script src="/resources/js/project/board.js"></script>
<section id="main-content">
	<section class="wrapper">
		<div class="col-md-12 mt">
			<h2 id="sprint_title"><i class="fa fa-angle-right"></i></h2>
			<div class="panel" >
				<div class="row" id ="backlog_status_div">
				</div>
			</div>
		</div>
	</section>
</section>
<xmldata id="boardXmlData"
         data-includeSprint="<c:out value="${includeSprint}"/>"
         data-sprintData="<c:out value="${sprintData}"/>"
         data-BacklogStatus="<c:out value="${getBacklogStatus}"/>">
</xmldata>
<script>
	var $xmlData = document.getElementById("boardXmlData");
	var includeSprints = JSON.parse($xmlData.getAttribute("data-includeSprint"));
	var backlogStatus = JSON.parse($xmlData.getAttribute("data-BacklogStatus"));
	var sprintData = JSON.parse($xmlData.getAttribute("data-sprintData"));

	$(function() {
		init(backlogStatus);

	});
</script>
<script id="boardTemplate" type="text/x-handlebars-template">
	{{#each.}}
		<div class="col-md-4 col-sm-4 mb">
			<div class="grey-panel pn ">
				<div class="header-{{status_id}}" status-id="{{status_id}}">
					<h5>{{bl_status}}</h5>
				</div>
				<div class="row">
					<ul class="task-list sortable sprint-list">
						<li class="list-warning">
							<div class="" style="min-height: 30px; background: white; width: 87%; margin-bottom: 8px;">	sadssadasd
							</div>
						</li>
						<li class="list-warning">
							<div class="" style="min-height: 30px; background: white; width: 87% ;margin-bottom: 8px;">dsaads</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	{{/each}}
</script>
