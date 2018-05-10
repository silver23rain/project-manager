
var init = function(backlogStatus) {
	$("#sprint_title").find("i").append(sprintData.project_name);
	var source = $("#boardTemplate").html();
	var template = Handlebars.compile(source);
	var html = template(backlogStatus);
	$("#backlog_status_div").append(html);

	$(".sortable").sortable({
		items: "li",
		connectWith: '.sortable',
		group: '.sortable',
		receive: function(event) {
			// Backlog.updateSprintKey(event);
		}
	});

}