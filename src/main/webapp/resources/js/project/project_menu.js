var focusSelected = function() {
	$(".sub-menu > a").removeClass("active");
	$(".sub-menu > a").each(function(index, item) {
		if($(item).attr("project-id") == Project.Data.projectId) {
			$(this).addClass("active");
		}
	})
	// $("a .active").siblings().find('li').addClass("active");
	// console.log($("a .active"));

};

var initMenuTemplate = function() {
	Handlebars.registerHelper('isSettingURL', function () {
		var path =  window.location.pathname;
		if(path.includes("setting")) {
			return new Handlebars.SafeString(
				'<ul class="sub" style="display: block;">' +
				'<li><a>프로젝트 수정</a></li>' +
				'<li><a>팀원 관리</a></li>' +
				'<li><a>프로젝트 삭제</a></li>' +
				'</ul>'
			);
		}
	});
	var source = $("#projectListTemplate").html();
	var template = Handlebars.compile(source);
	var html = template(projectList);

	$("#menu").append(html);
	$(".setting-menu ul").css({display:"block"})
};
var bindEvents = function() {
	$(".project-name-menu > a").on("click", function(e) {
		e.preventDefault();
		Project.Data.projectId = $(this).attr("project-id");
	});

	$(".sub a").on("click" , function(e) {
		e.stopPropagation();
		e.preventDefault();
		window.location.href = $(this).attr("href") + Project.Data.projectId;
	});
};
