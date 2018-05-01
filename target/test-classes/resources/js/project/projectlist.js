var init = function (projectList) {
	$(".sub-menu a").removeClass('active');
	$(".sub-menu-projectlist a").addClass('active');
	initProjectListGrid(projectList);
};

var bindEvents = function () {
	$("#create_project_btn").on("click", function () {
		location.href = "/project/create";
	});
};

function showEmptyDataRecord(w2grid, $grid, message) {
	var $emptyRow = $grid.next();

	if ($emptyRow.hasClass("empty_row")) {
		$emptyRow.remove();
	}

	if (w2grid && w2grid.records.length === 0) {
		$grid.after($("<div class='empty_row'></div>").text(message));
	}
}

var initProjectListGrid = function (records) {
	if (w2ui.projectlist_grid) {
		w2ui.projectlist_grid.destroy();
	}

	var $projectListGrid = $("#projectlist_grid");



	var options = {
		name: 'projectlist_grid',
		multiSelect: false,
		maxHeight: 283,
		recordHeight : 30,
		records: records,
		show: {
			toolbar: false,
			emptyRecords: false
		},
		columns: [{
			field: 'recid',
			hidden: true
		},{
			field: 'project_id',
			hidden: true
		}
		, {
			field: 'project_name',
			caption: '프로젝트 명',
			size: '30%',
			sortable: true,
			resizable: true,
			attr: 'align=center'
		}, {
			field: 'project_key',
			caption: '프로젝트 키',
			size: '130px',
			sortable: true,
			resizable: true,
			attr: 'align=center'
		}, {
			field: 'project_manager',
			caption: '팀장',
			size: '30%',
			resizable: true,
			attr: 'align=center'
		}, {
			field: 'project_content',
			caption: '내용',
			size: '80%',
			resizable: true,
			attr: 'align=left'
		}],
		onRefresh: function () {
			showEmptyDataRecord(w2ui.projectlist_grid, $projectListGrid, '참여 중인 프로젝트가 없습니다.');
		},
		onDblClick: function(event) {
			var grid = this;
			event.onComplete = function() {
				var sel_rec_ids = grid.getSelection();
				if (sel_rec_ids.length) {
					var sel_record = grid.get(sel_rec_ids[0]);
					console.log('selected ID:', sel_record.project_id, '/ selected Name:', sel_record.project_name);
					var project_id =  sel_record.project_id;
					window.location.href = "/project/backlog?project_id=" + project_id;
				} else {
					console.log("Nothing selected!");
				}
			}
		}

	};
	if (records != undefined) {
		for (var i = 0; i < records.length; i++) {
			records[i].recid = i + 1;
		}
	}
	$projectListGrid.height(30* (records.length + 1) +"px");
	$projectListGrid.w2grid(options);
	w2ui.projectlist_grid.sort("project_name", "desc");
};