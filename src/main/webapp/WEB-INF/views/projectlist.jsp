<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

<section id="main-content">
	<section class="wrapper">
		<h3><i class="fa fa-angle-right"></i>프로젝트 목록</h3>
		<div class="row mt">
			<div class="col-md-12">
				<div id ="create_project_btn" class="btn btn-primary btn-sm">프로젝트 생성</div>
				<div id="projectlist_grid" style="height: 270px">
				</div>
			</div>
		</div>
	</section>
</section>
<script>
	var projectList = [];
	$(function () {
		init();
		bindEvents();
	});
	var init = function () {
		$(".sub-menu a").removeClass('active');
		$(".sub-menu-projectlist a").addClass('active');
		initProjectListGrid(projectList);
	};

	var bindEvents = function () {
		$("#create_project_btn").on("click",function () {
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

		if (records != undefined) {
			for (var i = 0; i < records.length; i++) {
				records[i].recid = i + 1;
			}
		}

		var options = {
			name: 'projectlist_grid',
			multiSelect: false,
			maxHeight: 283,
			records: records,
			show: {
				toolbar: false,
				emptyRecords: false
			},
			columns: [{
				field: 'recid',
				hidden: true
			}, {
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
				field: 'project_owner',
				caption: '팀장',
				size: '80%',
				resizable: true,
				attr: 'align=left',
			}, {
				field: 'project_content',
				caption: '설명',
				size: '130px',
				sortable: true,
				resizable: true,
				attr: 'align=center'
			}],
			onRefresh: function () {
				showEmptyDataRecord(w2ui.projectlist_grid, $projectListGrid, '참여 중인 프로젝트가 없습니다.');
			}

		};
		$projectListGrid.w2grid(options);
		w2ui.projectlist_grid.sort("project_name", "desc");
	}

</script>
