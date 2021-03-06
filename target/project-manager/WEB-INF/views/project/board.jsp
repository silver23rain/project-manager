<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .backlog-list li > div {
        min-height: 30px;
        background: rgba(66, 139, 202, 0.15);
        margin-bottom: 8px;
        padding-top: 10px;
    }

    .backlog-key {
        height: 30px;
    }

    .sortable li:not(.hidden-li) {
        height: 80px;
    }
    .backlog-list div>div{
        padding-right: 0px ; !important;
    }

</style>
<script src="/resources/js/project/backlog.js?ver=3"></script>
<script src="/resources/js/project/board.js?ver=2"></script>
<section id="main-content">
    <section class="wrapper">
        <div class="col-md-12 mt">
            <h2 id="sprint_title"><i class="fa fa-angle-right"></i>
	            <button id= "sprint_close_btn"class="btn btn-success btn-sm pull-right">스프린트 종료</button>
            </h2>
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

    $(function () {
        Board.init();

    });
</script>
<script id="backlogTemplate" type="text/x-handlebars-template">
    <li  bl-status="{{bl_status}}">
        <div class="col-md-11 col-sm-10 col-xs-11 col-lg-11">
            <div class="col-md-4 col-xs-4" style="padding-left: 0px">
                <p class="tooltips assigned-user" data-toggle="tooltip" data-placement="top" title="{{assigned_user}}">
                    {{#checkAssigned user_img}}
                    {{/checkAssigned}}
                </p>
            </div>
            <div class="col-md-8 col-xs-8" style="padding-right: 0px;">
                <div class="backlog-key col-sm-12 goleft">
                    <a bl-no="{{bl_no}}"> <span class=" backlog-id"><strong>[{{project_key}}-{{bl_no}}]</strong></span></a>
                    <div class="pull-right hidden-phone">
                        <span class="badge">{{story_point}}</span>
                    </div>
                </div>
                <div class="backlog-title col-sm-12 goleft ellipsis "
                     data-container="body" data-toggle="popover" data-placement="bottom"
                     data-content=" {{bl_title}}">
                    {{bl_title}}
                </div>
            </div>
        </div>
    </li>
</script>
<script id="boardTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="col-md-4 col-sm-4 mb">
        <div class="grey-panel pn ">
            <div class="header-{{status_id}}" >
                <h5>{{bl_status}}</h5>
            </div>
            <div class="row">
                <ul class="sortable task-list backlog-list" status-id="{{status_id}}" bl-status="{{bl_status}}">
                    <li class="hidden-li"></li>
                </ul>
            </div>
        </div>
    </div>
    {{/each}}
</script>
