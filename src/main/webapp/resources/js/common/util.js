Project = window.Project || {};
Project.Util = Project.Util || {};
Project.Data= {
	projectId:""
}

Project.Util.alertText= function (div, message) {
	div.css("display","");
	div.html(message);
	return div;
};