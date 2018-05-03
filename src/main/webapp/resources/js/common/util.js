Project = window.Project || {};
Project.Util = Project.Util || {};
Project.Data= {
	projectId:""
};

Project.Util.alertText= function (div, message) {
	div.css("display","block");
	div.html(message);
	return div;
};

Project.Util.alertBanner = function ($target, message) {
	var $alert = '<div class="alert alert-danger alert-banner centered">';
	$alert += message;
    $target.prepend($alert);

    $('.alert-banner').fadeTo(2000, 500).slideUp(500, function(){
        $('.alert-banner').slideUp(500);
        $('.alert-banner').remove();
    });

    return $alert
};