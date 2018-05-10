<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	.backlog-list li> div{
		min-height: 30px;
		background: white;
		margin-bottom: 8px;
	}
	.sortable { list-style-type: none; margin: 0; padding: 0;}
	.sortable li:not(.hidden-li) { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1em; }
	.sortable li span { position: absolute; margin-left: -1.3em; }
</style>
<script src="/resources/js/project/board.js"></script>
<section id="main-content">
	<section class="wrapper">
		<div class="col-md-12 mt">
			<h2 id="sprint_title"><i class="fa fa-angle-right"></i></h2>
			<div class="panel">
				<div class="row" id="backlog_status_div">
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
<script id="backlogTemplate" type="text/x-handlebars-template">
	<li>
		<div >

		</div>
	</li>
</script>
<script id="boardTemplate" type="text/x-handlebars-template">
	{{#each.}}
	<div class="col-md-4 col-sm-4 mb">
		<div class="grey-panel pn ">
			<div class="header-{{status_id}}" status-id="{{status_id}}">
				<h5>{{bl_status}}</h5>
			</div>
			<div class="row">
				<ul class="sortable task-list backlog-list">
					<li class="hidden-li"></li>
					<li>
						<div class="col-md-11 col-sm-10 col-xs-11">
							sadssadasd
						</div>
					</li>

				</ul>
			</div>
		</div>
	</div>
	{{/each}}
</script>
