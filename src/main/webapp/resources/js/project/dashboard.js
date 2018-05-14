var init = function () {
	$(".sub-menu a").removeClass('active');
	$(".sub-menu-dashboard a").addClass('active');
	var source = $("#backlogListTemplate").html();
	var template = Handlebars.compile(source);
	var html = template(backLogList);
	$("#backlog_list").append(html);
	Backlog.Modal.bindEvents();


	$('[data-toggle="popover"]').popover({
		trigger:"hover",
	});

	$(".backlog-id").on("click", function() {
		var backlogKey = $(this).text();
		var bl_no = $(this).parent().attr("bl-no");
		var project_id = $(this).attr("project-id");
		Backlog.Modal.setModalData(backlogKey, bl_no, project_id);

	});

};