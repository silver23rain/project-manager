var showModal = function(result) {
	var $simpleModal = $('#simple_modal');
	$simpleModal.find('#myModalLabel').html("스프린트 생성");
	var $modalBody = $simpleModal.find('.modal-body');
	$modalBody.empty();

	var $formData = '<div class ="form-group">';
	$formData += '<h5>스프린트명</h5>';
	$formData += '<input type="text" disabled="disabled" id="sprint_name" class="form-control">';
	$formData += '<h5>스프린트 목표</h5>';
	$formData += '<textarea id="sprint_goal"  class="form-control">';
	$modalBody.append($formData);

	$("#sprint_name").attr("sprint-year", result.sprint_year);
	$("#sprint_name").attr("sprint-no", result.sprint_no);
	$("#sprint_name").val(result.project_name + '_' + result.sprint_year + '-' + result.sprint_no);

	$("#modal_submit").text("생성하기");
	$simpleModal.modal('show');
};
var BackLog = {
	init: function(backLogList) {
		if(backLogList.length === 0 || backLogList === undefined) {
			$(".sortable").sortable({
				disabled:true
			})
			var $li = "<li class='text-center'>생성된 백로그가 없습니다.</li>";
			$("#backlog_list").append($li);
		}
	},
	initBacklogTemplate: function() {
		var source = $("#backlogListTemplate").html();
		var template = Handlebars.compile(source);
		var html = template(backLogList);

		$("#backlog_list").append(html);
	},
	initSprintTemplate: function() {
		var source = $("#sprintListTemplate").html();
		var template = Handlebars.compile(source);
		var html = template(sprintList);

		$("#sprint_main").append(html);
	},
	bindEvents: function() {
		$(".sortable").sortable({
            items: "li",
            connectWith: '.sortable',
			group:'.sortable',
            receive: function( event, ui ) {
               $.ajax({
				   url:"/project/backlog/updateBacklog",
				   method:"POST",
				   dataType:"json",
				   data:{
					   sprint_year: $(event.target).attr("sprint-year"),
					   sprint_no: $(event.target).attr("sprint-no"),
                       project_id:Project.Data.projectId,
					   bl_no : $(this).find('a').attr("bl-no")
				   }
			   })
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

		$("#sprint_create_btn").on("click", function() {
			$.ajax({
				url: "/project/sprint/info",
				method: "POST",
				dataType: "json",
				data: {
					project_id: Project.Data.projectId
				},
				success: function(result) {
					showModal(result);
				}
			});
		});
		$("#modal_submit").on("click", function() {
			$.ajax({
				url: "/project/sprint/create",
				method: "POST",
				dataType: "json",
				data: {
					project_id: Project.Data.projectId,
					sprint_year: $("#sprint_name").attr("sprint-year"),
					sprint_no : $("#sprint_name").attr("sprint-no"),
					sprint_goal: $("#sprint_goal").val()
				},
				success: function(result) {
					if(result.code === "SUCCESS"){
						window.location.reload();
					}
					Project.Util.alertBanner($("#main-content .wrapper"),"스프린트를 생성하는데 실패하였습니다.");
				},complete: function() {
					$('#simple_modal').toggle();
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

	}
}
