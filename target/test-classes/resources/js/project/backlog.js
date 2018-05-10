var Backlog = {
	init: function() {
		this.includeSprintBacklog();
		this.checkisEmptyExcludeSprintBacklogList();
		Backlog.Modal.bindEvents();
		$(".sprint-list").each(function() {
			if($(this).find("li.backlog-list").length !== 0) {
				$(this).parent().parent().addClass("in");
			}
		})
	},
	includeSprintBacklog: function() {
		$.each(backLogList, function(index, item) {
			if(!Project.Data.isEmpty(item.sprint_year) && !Project.Data.isEmpty(item.sprint_no)) {
				var id = item.sprint_year + '_' + item.sprint_no;
				Backlog.initBacklogTemplate($("#" + id), item);
			} else {
				Backlog.initBacklogTemplate($("#backlog_list"), item);
			}
		})
	}, checkisEmptyExcludeSprintBacklogList: function() {
		if($("#backlog_list li.backlog-list").length === 0 || backLogList === undefined) {
			var $li = "<li class='text-center' id='empty_backlog'>생성된 백로그가 없습니다.</li>";
			$("#backlog_list").append($li);
		} else {
			$("#empty_backlog").remove();
		}
	},
	initBacklogTemplate: function($target, list) {
		var source = $("#backlogListTemplate").html();
		var template = Handlebars.compile(source);
		var html = template(list);
		$target.append(html);
	},
	initSprintTemplate: function() {
		Handlebars.registerHelper("checkSprintStatus", function(options) {
			if(this.sprint_status !== "CLOSE") {
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
	updateSprintKey: function(event) {
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
			success: function() {
				Backlog.checkisEmptyExcludeSprintBacklogList();
			}
		})
	}, bindEvents: function() {
		$(".sortable").sortable({
			items: "li",
			connectWith: '.sortable',
			group: '.sortable',
			receive: function(event) {
				Backlog.updateSprintKey(event);
			}
		});
		// $(".sortable").disableSelection();

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

		$(".backlog-id").on("click", function() {
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

					var $storyPoint = $modal.find("[name =story_point] li>a");
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

		$("#sprint_main .fa").on("click", function() {
			var $collapse = $(this).parent().next(".row").find(".collapse");
			var _this = $(this);
			if($collapse.hasClass("in")) {
				$collapse.collapse("hide");
				_this.removeClass("fa-angle-down");
				_this.addClass("fa-angle-right");
			} else {
				$collapse.collapse("show");
				_this.removeClass("fa-angle-right");
				_this.addClass("fa-angle-down");
			}
		});

		$(".sprint-open-btn").on("click", function() {
			var $sprintDiv = $(this).parent().parent();
			var data = {
				sprintTitle: $sprintDiv.find(".sprint-title").text(),
				sprintYear: $sprintDiv.find("ul").attr("sprint-year"),
				sprintNo: $sprintDiv.find("ul").attr("sprint-no")
			};
			Sprint.Modal.showOpenSprintModal(data);
			console.log(data);
		});

	}
};

Backlog.Modal = {
	modalDiv: "#backlogDetailModal",
	bl_title: "",
	assigned_user: undefined,
	story_point: 0,
	bl_content: null,
	bl_no: null,
	setData: function(data) {
		this.bl_title = data.bl_title;
		this.assigned_user = data.assigned_user? data.assigned_user:this.assigned_user;
		this.story_point = data.story_point;
		this.bl_content = data.bl_content;
		this.bl_no = data.bl_no ? data.bl_no: this.bl_no;
	},
	bindEvents: function() {
		$(this.modalDiv).find("#modal_submit").on("click", function() {
			/*TODO 저장시  modal 데이터 DB update*/

			Backlog.Modal.setData({
				bl_title: $(Backlog.Modal.modalDiv).find("[name=backlog_title]").val(),
				story_point: $(Backlog.Modal.modalDiv).find('[name="story_point"] .selected ').text(),
				bl_content: $(Backlog.Modal.modalDiv).find("[name=backlog_contents]").val()
			});

			$.ajax({
				url:"/project/backlog/updateBacklog",
				method :"POST",
				dataType :"json",
				data : Backlog.Modal.getModalData(),
				success: function(result) {
					console.log("성공");
				}
			})
		})
	},
	show: function() {
		$(this.modalDiv).modal('show');
	},
	getModalData: function() {
		return {
			bl_title: this.bl_title,
			assigned_user: this.assigned_user,
			story_point: this.story_point,
			bl_content: this.bl_content,
			bl_no: this.bl_no,
			project_id: Project.Data.projectId
		}
	}
};
