var BackLog = {
	init: function() {
		this.includeSprintBacklog();
		this.checkisEmptyExcludeSprintBacklogList();
		$(".sprint-list").each(function () {
			if($(this).find("li.backlog-list").length !== 0){
				$(this).parent().parent().addClass("in");
			}
		})
	},
	includeSprintBacklog: function() {
		$.each(backLogList, function(index, item) {
			if(!Project.Data.isEmpty(item.sprint_year) && !Project.Data.isEmpty(item.sprint_no)) {
				var id = item.sprint_year + '_' + item.sprint_no;
				BackLog.initBacklogTemplate($("#" + id), item);
			} else {
				BackLog.initBacklogTemplate($("#backlog_list"), item);
			}
		})
	},checkisEmptyExcludeSprintBacklogList: function() {
		if($("#backlog_list li.backlog-list").length === 0 || backLogList === undefined) {
			var $li = "<li class='text-center' id='empty_backlog'>생성된 백로그가 없습니다.</li>";
			$("#backlog_list").append($li);
		}else{
			$("#empty_backlog").remove();
		}
	},
	initBacklogTemplate: function($target,list) {
		var source = $("#backlogListTemplate").html();
		var template = Handlebars.compile(source);
		var html = template(list);
		$target.append(html);
	},
	initSprintTemplate: function() {
        Handlebars.registerHelper("checkSprintStatus", function(options) {
            if (this.sprint_status !== "CLOSE") {
                return options.fn(this);
            } else {
                return options.inverse(this);
            }
        });
		var source = $("#sprintListTemplate").html();
		var template = Handlebars.compile(source);
		var html = template(sprintNameList);
		$("#sprint_main").append(html);
    },
	updateSprintKey: function (event) {
        $.ajax({
            url: "/project/backlog/updateBacklog",
            method: "POST",
            dataType: "json",
            data: {
                sprint_year: $(event.target).attr("sprint-year"),
                sprint_no: $(event.target).attr("sprint-no"),
                project_id: Project.Data.projectId,
                bl_no: $(event.toElement).find('a').attr("bl-no")
            },
            success: function () {
                BackLog.checkisEmptyExcludeSprintBacklogList();
            }
        })
    }, bindEvents: function() {
        $(".sortable").sortable({
            items: "li",
            connectWith: '.sortable',
            group:'.sortable',
            receive: function(event) {
                BackLog.updateSprintKey(event);
			}
		});
		$(".sortable").disableSelection();

		$("#backlog_create_btn").on("click", function() {
			var backlogName = $("#backlog_name").val();
			if(backlogName.length === 0) {
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
				success: function(result) {
					if(result.code === "SUCCESS") {
						$("#backlog_name").val("");
						window.location.reload();

					} else if(result.code === "INSERT_ERROR") {
						Project.Util.alertBanner($("#main-content .wrapper"), "백로그 생성하는데 실패했습니다.");
					}
				}
			});

		});

		$(".backlog-id").on("click",function(){
            console.log($(this).parent().attr("bl-no"));
            $("#backlogDetailModal").modal('show');
        });

		$("#sprint_create_btn").on("click", function() {
			$.ajax({
				url: "/project/sprint/info",
				method: "POST",
				dataType: "json",
				data: {
					project_id: Project.Data.projectId
				},
				success: function(result) {
                    Sprint.createSprint(result);
				}
			});
		});

		$("#sprint_main .fa").on("click",function() {
			var $collapse = $(this).parent().next(".row").find(".collapse");
			var _this = $(this);
			if($collapse.hasClass("in")){
				$collapse.collapse("hide");
				_this.removeClass("fa-angle-down");
				_this.addClass("fa-angle-right");
			}else{
				$collapse.collapse("show");
				_this.removeClass("fa-angle-right");
				_this.addClass("fa-angle-down");
			}
		});

		$(".sprint-open-btn").on("click",function() {
			var $sprintDiv = $(this).parent().parent();
			var data = {
				sprintTitle :$sprintDiv.find(".sprint-title").text(),
				sprintYear : $sprintDiv.find("ul").attr("sprint-year"),
				sprintNo : $sprintDiv.find("ul").attr("sprint-no")
			};
			Sprint.Modal.showOpenSprintModal(data);
			console.log(data);
		});

	}
};

