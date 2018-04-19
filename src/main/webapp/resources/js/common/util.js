Project = window.Project || {};
Project.Util = Project.Util || {};

Project.Util.alertText= function (div, message) {
	div.html(message);
	return div;
}