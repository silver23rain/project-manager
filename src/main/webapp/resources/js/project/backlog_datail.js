Backlog = window.Backlog || {};

Backlog.Modal = {
	modalDiv: "#backlogDetailModal",
	bl_title: "",
	assigned_user: undefined,
	story_point: 0,
	bl_content: null,
	bl_no: null,
	project_id :null,
	setData: function(data) {
		this.bl_title = data.bl_title;
		this.assigned_user = Project.Data.isEmpty(data.assigned_user)?this.assigned_user : data.assigned_user;
		this.story_point = data.story_point;
		this.bl_content = data.bl_content;
		this.bl_no = data.bl_no ? data.bl_no : this.bl_no;
	},
	bindEvents: function() {
		$(this.modalDiv).find("#modal_submit").on("click", function() {

			Backlog.Modal.setData({
				bl_title: $(Backlog.Modal.modalDiv).find("[name=backlog_title]").val(),
				assigned_user: $(Backlog.Modal.modalDiv).find('[name="backlog_assigned"] .selected ').text(),
				story_point: $(Backlog.Modal.modalDiv).find('[name="story_point"] .selected ').text(),
				bl_content: $(Backlog.Modal.modalDiv).find("[name=backlog_contents]").val()
			});

			$.ajax({
				url: "/project/backlog/updateBacklog",
				method: "POST",
				dataType: "json",
				data: Backlog.Modal.getModalData(),
				async: false,
				success: function() {
					$(Backlog.Modal.modalDiv).modal('hide');
					$(Backlog.Modal.modalDiv).on('hidden.bs.modal', function() {
						$(".selected").removeClass("selected");
						window.location.reload();
					})
				}
			});
		});

		$('[ name ="backlog_assigned"]').on("click", function() {
			var inputForm = '<div class="form-group">';
			inputForm += '<label class="control-label">백로그 담당자</label>';
			inputForm += '<div class="btn-group">';
			inputForm += '<button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">선택하세요<span class="fa fa-caret-down"></span></button>';
			inputForm += '<ul class="dropdown-menu" role="menu" class ="backlog_priority">';
			inputForm += '<li><a href="#"><i class=" fa  fa-angle-double-up"></i>최상</a></li>';

			// Project.Util.confirm('백로그 담당자 정하기',inputForm ,function() {
			//
			// });

		});
	},
	show: function() {
		$(this.modalDiv).modal('show');
	}
	,
	getModalData: function() {
		return {
			bl_title: this.bl_title,
			assigned_user: this.assigned_user,
			story_point: this.story_point,
			bl_content: this.bl_content,
			bl_no: this.bl_no,
			project_id: this.project_id
		}
	}
	,
	setModalData: function(backlogKey, bl_no, project_id) {
		//TODO: modal 데이터 넣는 부분 -> 코드 정리
		this.project_id = project_id;
		$.ajax({
			url: "/project/backlog/detail",
			method: "POST",
			dataType: "json",
			data: {
				project_id: project_id,
				bl_no: bl_no
			},
			success: function(result) {
				var userList = result.userList;
				var backlogData =result.backlogData;
				Backlog.Modal.setData(backlogData);
				var projectName =backlogData.project_name;
				var $span = '<span class="fa fa-caret-down"></span>';
				var $modal = $(Backlog.Modal.modalDiv);
				$modal.find('[name=backlog_key]').text(backlogKey);
				$modal.find("[name=project_name]").text(projectName);
				$modal.find("[name=backlog_title]").val(Backlog.Modal.bl_title);
				$modal.find("[name=backlog_contents]").text(Backlog.Modal.bl_content === null ? "" : Backlog.Modal.bl_content);

				$modal.find("[name=backlog_assigned]")
					.prev()
					.html(Backlog.Modal.assigned_user === undefined ? "없음" : Backlog.Modal.assigned_user)
					.append($span);

				for(var i = 0; i < userList.length; i++) {
					var $li = '<li><a>';
					$li += userList[i].user_id;
					$modal.find("[name=backlog_assigned]").append($li);
				}

				var $storyPoint = $modal.find("[name =story_point] li");
				$storyPoint.removeClass("selected");

				$storyPoint.each(function(index, item) {
					if(Backlog.Modal.story_point.toString() === $(this).find('a').text()) {
						$(this).addClass("selected");
						$modal.find("[name =story_point]")
							.prevAll(".selectedItem")
							.html(Backlog.Modal.story_point + $span);
						return;
					}
				});
				Backlog.Modal.show();
			}
		});
	}
}
