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
	    var $sprintTitle = $("#sprint_title")
        $sprintTitle.append(sprintData.project_name);

        var startDate = new Date(sprintData.start_date).toLocaleDateString();
        var endDate = new Date(sprintData.end_date).toLocaleDateString();

        var dateString = "<span style='font-size:15px; margin-left : 5px'>[" +startDate +" ~ " +endDate +"]";
        $sprintTitle.append(dateString);

        this.drawStatusBlock();
        this.initDrawBacklogs();
        this.bindEvents();
        Backlog.Modal.bindEvents();


    },
	drawStatusBlock : function () {
        var source = $("#boardTemplate").html();
        var template = Handlebars.compile(source);
        var html = template(backlogStatus);

        $("#backlog_status_div").append(html);

    },
    initDrawBacklogs: initDrawBacklogs,
	bindEvents: function () {
        $(".sortable").sortable({
            items: "li",
            connectWith: '.sortable',
            group: '.sortable',
            receive: function (event) {
                //TODO : when backlog id dropped, change backlog status.
                var _event = event;
                $.ajax({
                    url: "/project/backlog/updateBacklog",
                    method: "POST",
                    dataType: "json",
                    data: {
                        sprint_year: sprintData.sprint_year,
                        sprint_no: sprintData.sprint_no,
                        project_id: Project.Data.projectId,
                        bl_no: $(_event.toElement).closest('li').find('a').attr("bl-no"),
                        status_id : $(_event.target).attr("status-id")
                    },
                    success: function() {

						$.ajax({
							url: "/project/board/insertFeed",
							method: "POST",
							dataType: "json",
							data: {
								sprint_year: sprintData.sprint_year,
								sprint_no: sprintData.sprint_no,
								project_id: Project.Data.projectId,
								bl_no: $(_event.toElement).closest('li').find('a').attr("bl-no"),
								target_user:$(_event.toElement)
                                    .closest('li')
                                    .find(".assigned-user")
                                    .attr("data-original-title"),
                                comment : $(event.toElement).closest('li').attr("bl-status") +" 에서" +
								$(event.target).attr("bl-status") +" (으)로 백로그 상태가 변경 되었습니다."
							},success :function(result) {
                                console.log(result.code);
							}
						});

                    },
                    error: function (result) {
                        console.log(result);
                    }
                })
            }
        });

        $('[data-toggle="tooltip"]').tooltip();
        $('[data-toggle="popover"]').popover({
            trigger:"hover"
        });
        $(".backlog-id").on("click", function(){
            var backlogKey = $(this).text();
			var bl_no = $(this).parent().attr("bl-no");
			Backlog.Modal.setModalData(backlogKey, bl_no,Project.Data.projectId);
        });
    }

};


