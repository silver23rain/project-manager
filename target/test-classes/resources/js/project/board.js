
var initDrawBacklogs = function(){
    Handlebars.registerHelper('checkAssigned', function (user_img) {
        var imgDiv = "<img ";
        if(user_img){
            imgDiv += "src =/resources/img/user/"+user_img;
        }else{
            imgDiv += "src =/resources/img/user/037-user-none.png";
        }
        imgDiv +=' class="img-circle" width="60">';
        return new Handlebars.SafeString(imgDiv);
    });

	$(includeSprints).each(function (index, item) {
		var stausId = item.status_id;
		var $target = $("#backlog_status_div").find("[status-id="+stausId+"]");

		var source = $("#backlogTemplate").html();
        var template = Handlebars.compile(source);
        var html = template(item);

        $target.append(html);
    });
};
var Board = {
	init:function() {
        $("#sprint_title").find("i").append(sprintData.project_name);
        this.drawStatusBlock();
        this.initDrawBacklogs();
        this.bindEvents();
        $('[data-toggle="tooltip"]').tooltip();
        Backlog.Modal.bindEvents();
    },
	drawStatusBlock : function () {
        var source = $("#boardTemplate").html();
        var template = Handlebars.compile(source);
        var html = template(backlogStatus);

        $("#backlog_status_div").append(html);

        $(".sortable").sortable({
            items: "li",
            connectWith: '.sortable',
            group: '.sortable',
            receive: function (event) {
                //TODO : when backlog id dropped, change backlog status.
                $.ajax({
                    url: "/project/backlog/updateBacklog",
                    method: "POST",
                    dataType: "json",
                    data: {
                        sprint_year: sprintData.sprint_year,
                        sprint_no: sprintData.sprint_no,
                        project_id: Project.Data.projectId,
                        bl_no: $(event.toElement).closest('li').find('a').attr("bl-no"),
                        status_id : $(event.target).attr("status-id")
                    },
                    success: function() {
                        // Backlog.checkisEmptyExcludeSprintBacklogList();
                    },
                    error: function (result) {
                        console.log(result);
                    }
                })
            }
        });
    },
    initDrawBacklogs: initDrawBacklogs,
	bindEvents: function () {
        $(".backlog-id").on("click", function(){
            var backlogKey = $(this).text();
            $.ajax({
                url: "/project/backlog/detail",
                method: "POST",
                dataType: "json",
                data: {
                    project_id: Project.Data.projectId,
                    bl_no: $(this).parent().attr("bl-no")
                },
                success: function(result) {
                    Backlog.Modal.setData(result);
                    var projectName = $("[project-id=" + Project.Data.projectId + "]").find("span").text();

                    var $modal = $(Backlog.Modal.modalDiv);
                    $modal.find('[name=backlog_key]').text(backlogKey);
                    $modal.find("[name=project_name]").text(projectName);
                    $modal.find("[name=backlog_title]").val(Backlog.Modal.bl_title);
                    $modal.find("[name=backlog_contents]").text(Backlog.Modal.bl_content === null ? "" : Backlog.Modal.bl_content);
                    $modal.find("[name=backlog_assigned]").text(Backlog.Modal.assigned_user === undefined ? "없음" : Backlog.Modal.assigned_user);

                    var $storyPoint = $modal.find("[name =story_point] li");
                    $storyPoint.removeClass("selected");
                    $storyPoint.each(function(index, item) {
                        if(Backlog.Modal.story_point.toString() === $(this).text()) {
                            $(this).addClass("selected");
                            var $span = '<span class="fa fa-caret-down"></span>';
                            $modal.find(".selectedItem").html(Backlog.Modal.story_point + $span);
                            return;
                        }
                    });
                    $modal.find(".selectedItem").text();

                    Backlog.Modal.show();
                }
            });
        });
    }

};
