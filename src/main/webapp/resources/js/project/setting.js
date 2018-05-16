Project.Setting = {
	init: function() {
		initUserListGrid(userList);
		this.bindEvents();
	},
	bindEvents: function() {
		$("#invite_btn").on("click", function() {

			var projectName = $("[project-id=" + Project.Data.projectId + "]").text();
			$('[name="projectName"]').text(projectName);

			$("#invite_modal").modal('show');
		});

		$("#search_user").on("keyup", function() {
			$.ajax({
				url: "/user/search",
				method: "POST",
				dataType: "JSON",
				data: {
					searchData: $(this).val(),
					project_id: Project.Data.projectId
				}, success: function(result) {
					initSearchResult(result)
				}

			})
		});

		$(".remove-btn").on("click", function() {
			var selectedUser = $(this).closest('td').prev().prev().prev().text();
			if(Project.Data.isEmpty(selectedUser)) {
				Project.Util.alert('경고', '선택한 사용자가 없습니다.');
				return;
			}

			var contents  = selectedUser +"를 프로젝트에서 제외 시키겠습니까?";
			Project.Util.confirm('', contents, function() {
				$.ajax({
					method: "POST",
					url: "/project/setting/removeUser",
					dataType: "json",
					data: {
						project_id: Project.Data.projectId,
						user_id: selectedUser,
					}, success: function(result) {
						initUserListGrid(result);
					}
				});
			});
		});

		$("#modal_submit").on("click", function() {
			if(Project.Data.isEmpty(selectSearchUser)) {
				Project.Util.alert('경고', '선택한 사용자가 없습니다.');
				return;
			}
			var imgSrc = "/resources/img/user/" + selectSearchUser.user_img;
			var $div = $("<div style='padding-left: 32%;'>")
				.append('<p class=" assigned-user">')
				.append('<img src ="' + imgSrc + '" class="img-circle" width="60">')
				.append($('<p> 아이디 : <strong>' + selectSearchUser.user_id + '</strong></p>'))
				.append($('<p> 이름 : <strong>' + selectSearchUser.user_name + '</strong></p>'))
				.append($('<label> 역할 : </label>'))
				.append($('<select id="invite_position_select"><option>개발</option><option>기획</option><option>테스트</option>'));
			var contents = $div;

			Project.Util.confirm('초대하시겠습니까?', contents, function() {
				$.ajax({
					method: "POST",
					url: "/project/setting/addUser",
					dataType: "json",
					data: {
						project_id: Project.Data.projectId,
						user_id: selectSearchUser.user_id,
						project_position: $("#invite_position_select option:selected").val()
					}, success: function(result) {
						$("#invite_modal").modal('hide');
						initUserListGrid(result);
					}
				})
			});
		});
	},
};

let showEmptyDataRecord = function(w2grid, $grid, message) {
	var $emptyRow = $grid.next();

	if($emptyRow.hasClass("empty_row")) {
		$emptyRow.remove();
	}

	if(w2grid && w2grid.records.length === 0) {
		$grid.after($("<div class='empty_row'></div>").text(message));
	}
};

var selectSearchUser;
let initSearchResult = function(records) {
	if(w2ui.search_result_grid) {
		w2ui.search_result_grid.destroy();
	}

	var $searchResultGrid = $("#search_result_grid");


	var options = {
		name: 'search_result_grid',
		multiSelect: false,
		maxHeight: 283,
		recordHeight: 30,
		records: records,
		show: {
			toolbar: false,
			emptyRecords: false
		},
		columns: [{
			field: 'recid',
			hidden: true
		}, {
			field: 'project_id',
			hidden: true
		}, {
			field: 'user_name',
			caption: '이름',
			size: '150px',
			sortable: true,
			resizable: true,
			attr: 'align=center',
		}, {
			field: 'user_id',
			caption: '아이디',
			size: '150px',
			sortable: true,
			resizable: true,
			attr: 'align=center'
		}],
		onRefresh: function() {
			showEmptyDataRecord(w2ui.search_result_grid, $searchResultGrid, '검색 결과가 없습니다.');
		},
		onDblClick: function(event) {
		},
		onSelect: function(event) {
			var grid = this;
			event.onComplete = function() {
				var sel_rec_ids = grid.getSelection();
				if(sel_rec_ids.length) {
					selectSearchUser = grid.get(sel_rec_ids[0]);
				} else {
					console.log("Nothing selected!");
				}
			}
		}

	};
	if(records != undefined) {
		for(var i = 0; i < records.length; i++) {
			records[i].recid = i + 1;
		}
	}
	$searchResultGrid.height(30 * (records.length + 1) + "px");
	$searchResultGrid.w2grid(options);
	//w2ui.search_result_grid.sort("project_name", "desc");
};

let initUserListGrid = function(records) {
	if(w2ui.userlist_grid) {
		w2ui.userlist_grid.destroy();
	}

	var $userListGrid = $("#userlist_grid");


	var options = {
		name: 'userlist_grid',
		multiSelect: false,
		maxHeight: 283,
		recordHeight: 30,
		records: records,
		show: {
			toolbar: false,
			emptyRecords: false,
		},
		columns: [{
			field: 'recid',
			hidden: true
		}, {
			field: 'project_id',
			hidden: true
		}, {
			field: 'user_name',
			caption: '이름',
			size: '150px',
			sortable: true,
			resizable: true,
			attr: 'align=center',
		}, {
			field: 'user_id',
			caption: '아이디',
			size: '150px',
			sortable: true,
			resizable: true,
			attr: 'align=center'
		}, {
			field: 'project_position',
			caption: '역할',
			size: '150px',
			resizable: true,
			attr: 'align=center',
			render: function(record) {
				if(record.project_position === "팀장") {
					return record.project_position;
				}
				var $div = $('<select>')
					.append($('<option>개발</option>'))
					.append($('<option>기획</option>'))
					.append($('<option>테스트</option>'));

				return $.outerHtml($div);
			}
		}, {
			field: 'authority',
			caption: '권한',
			size: '150px',
			resizable: true,
			attr: 'align=center',
			render: function(record) {
				var $div = $('<select>')
					.append($('<option>관리자</option>'))
					.append($('<option>일반</option>'));

				return $.outerHtml($div);
			}
		}, {
			size: '20%',
			resizable: true,
			attr: 'align=left',
			render: function(record) {
				if(record.project_position === "팀장") {
					return;
				}
				var $a = $('<a class="remove-btn btn btn-sm" >팀에서 제외시키기</a>')
				return $.outerHtml($a);
			}
		}],
		onRefresh: function() {
			showEmptyDataRecord(w2ui.userlist_grid, $userListGrid, '프로젝트에 참여중인 사용자가 없습니다.');
		}

	};
	if(records != undefined) {
		for(var i = 0; i < records.length; i++) {
			records[i].recid = i + 1;
		}
	}
	$userListGrid.height(30 * (records.length + 1) + "px");
	$userListGrid.w2grid(options);
	w2ui.userlist_grid.sort("project_position", "desc");
};