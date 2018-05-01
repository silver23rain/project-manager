<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/to-do.css">

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<%--<script src="/resources/js/tasks.js" type="text/javascript"></script>--%>
<section id="main-content">
    <section class="wrapper">
        <div id="sprint_main">
            <h3><i class="fa fa-angle-right"></i>스프린트 목록</h3>
            <div class="row mb">
                <div class="col-md-12">
                </div>
            </div>
        </div>
        <div id="backlog_main">
            <h3><i class="fa fa-angle-down"></i>백로그 목록</h3>
            <div class="row mb">
                <div class="col-md-12">
                    <section class="task-panel tasks-widget">
                        <div class="panel-body">
                            <div class="task-content">
                                <ul class="task-list sortable" id="backlog_list">
                                </ul>
                            </div>
                            <div class=" add-baklog-row">
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
<xmldata id="backlogListXmlData"
         data-backLogList="<c:out value="${backLogList}"/>">
</xmldata>
<script>
    var $xmlData = document.getElementById("backlogListXmlData");
    var backLogList = JSON.parse($xmlData.getAttribute("data-backLogList"));
    $(function () {
        BackLog.init();
        BackLog.initBacklogTemplate();
        BackLog.bindEvents();
    });
    var BackLog = {
        init: function () {
            if (backLogList.length === 0 || backLogList === undefined) {
                $(".sortable").sortable({
                    disabled: true
                });
                var $li = "<li class='text-center'>생성된 백로그가 없습니다.</li>";
                $("#backlog_list").append($li);

            }
        },
        initBacklogTemplate: function () {
            var source = $("#backlogListTemplate").html();
            var template = Handlebars.compile(source);
            var html = template(backLogList);

            $("#backlog_list").append(html);
        },
        bindEvents: function () {
            $(".sortable").sortable();
            $(".sortable").disableSelection();

            $("#backlog_create_btn").on("click", function () {
                var backlogName = $("#backlog_name").val();
                if (backlogName.length === 0) {
                    Project.Util.alertText($("#backlog_name_alert"), "백로그명을 반드시 입력해야 합니다.");
                    return;
                }
                $.ajax({
                    url: "/project/backlog/create",
                    method: "POST",
                    dataType: "json",
                    data: {
                        project_id: Project.Data.projectId,
                        bl_title: backlogName
                    },
                    success: function (result) {
                        if (result.code === "SUCCESS") {
                            $("#backlog_name").val("");
                            window.location.reload();

                        } else if (result.code === "INSERT_ERROR") {
                            Project.Util.alertBanner($("#backlog_main"),"백로그 생성하는데 실패했습니다.");
                        }
                    }
                });
            })
        }
    }

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
