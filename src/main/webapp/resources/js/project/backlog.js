var BackLog = {
    init: function (backLogList) {
        if (backLogList.length === 0 || backLogList === undefined) {
            $("#backlog_list .sortable").sortable({
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
    initSprintTemplate: function () {
        var source = $("#sprintListTemplate").html();
        var template = Handlebars.compile(source);
        var html = template(sprintList);

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
                        Project.Util.alertBanner($("#backlog_main"), "백로그 생성하는데 실패했습니다.");
                    }
                }
            });
        });

        //TODO : ajax 해당 스프린트 년 + no 가져와야 함
        $("#sprint_create_btn").on("click", function(){
            $.ajax({
                url: "/project/sprint/info",
                method: "POST",
                dataType: "json",
                data: {
                    project_id: Project.Data.projectId,
                    bl_title: backlogName
                },
                success : function () {
                    
                }
            });
            var $simpleModal = $('#simple_modal');
            var title ="스프린트 생성";
            $simpleModal.find('#myModalLabel').html("스프린트 생성");
            $simpleModal.modal('show');
        });

    }
}
