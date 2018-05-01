<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/to-do.css">

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/resources/js/project/backlog.js"></script>
<section id="main-content">
    <section class="wrapper">
        <div id="sprint_main">
            <h3><i class="fa fa-angle-right"></i>스프린트 목록</h3>
            <div class="row mb">
                <div class="col-md-12">
                    <section class="task-panel tasks-widget">
                        <div class="panel-body">
                            <div class="task-content">
                                <ul class="task-list sortable" class="sprint_list">
                                </ul>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <div id="backlog_main">
            <div class="col-md-12">
                <h3><i class="fa fa-angle-down"></i>백로그 목록
                    <button id="sprint_create_btn" class="btn btn-default btn-sm pull-right">스프린트 생성</button></h3>
            </div>
            <div class="row mb">
                <div class="col-md-12">
                    <section class="task-panel tasks-widget">
                        <div class="panel-body">
                            <div class="task-content">
                                <ul class="task-list sortable" id="backlog_list">
                                </ul>
                            </div>
                            <div class="add-baklog-row">
                                <div class="col-sm-10">
                                    <input type="text" placeholder="백로그명을 입력하시오." id="backlog_name"
                                           class="form-control">
                                    <div class="alert-div">
                                        <div class="alert-danger" id="backlog_name_alert" style="display: none"></div>
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
                <button type="button" class="btn btn-primary"></button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<xmldata id="backlogListXmlData"
         data-backLogList="<c:out value="${backLogList}"/>">
</xmldata>
<script>
    var $xmlData = document.getElementById("backlogListXmlData");
    var backLogList = JSON.parse($xmlData.getAttribute("data-backLogList"));
    $(function () {
        BackLog.init(backLogList);
        BackLog.initBacklogTemplate();
        BackLog.bindEvents();
    });
</script>
<script id="backlogListTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <li class="list-warning">
        <i class=" fa  fa-angle-double-up"></i>
        <div class="task-title">
            <a bl-no="{{bl_no}}" class="col-sm-2"> <span class="task-title-sp backlog-id"><strong>[{{project_key}}-{{bl_no}}]</strong></span></a>
            <span class="task-title-sp col-sm-8">{{bl_title}}</span>
            <span class="badge bg-warning">{{bl_status}}</span>
            <div class="pull-right hidden-phone">
                <span class="badge">{{story_point}}</span>
            </div>
        </div>
    </li>
    {{/each}}
</script>
<script id="sprintListTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <h3><i class="fa fa-angle-right"></i>스프린트 :{{sprint_year}}_{{sprint_no}}</h3>
    <div class="row mb">
        <div class="col-md-12">
            <section class="task-panel tasks-widget">
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list sortable" class="sprint_list">
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
    {{/each}}
</script>
