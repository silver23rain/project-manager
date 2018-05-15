var init = function () {
	$(".sub-menu a").removeClass('active');
	$(".sub-menu-dashboard a").addClass('active');
	initAssignedBacklog();
	initFeedList();
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
let initAssignedBacklog = function() {
	var source = $("#backlogListTemplate").html();
	var template = Handlebars.compile(source);
	var html = template(backLogList);
	$("#backlog_list").append(html);
};

let initFeedList = function() {
	Handlebars.registerHelper('convertDate', function (regdate) {
		var date = new Date(regdate).toJSON();
		var date2 = date.substring(0,19);
		return date2.replace("T"," ")
	});
	var source = $("#feedListTemplate").html();
	var template = Handlebars.compile(source);
	var html = template(feedList);
	$("#feed_list").append(html);
};
