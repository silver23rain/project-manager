Project = window.Project || {};
Project.Util = Project.Util || {};
Project.Data = {
    projectId: "",
    isEmpty: function (data) {
        if (data === null || data === undefined || data.length === 0) {
            return true;
        }
        return false;
    }
};

Project.Util.alertText = function (div, message) {
    div.css("display", "block");
    div.html(message);
    return div;
};

Project.Util.alertBanner = function ($target, message) {
    var $alert = '<div class="alert alert-danger alert-banner centered">';
    $alert += message;
    $target.prepend($alert);

    $('.alert-banner').fadeTo(2000, 500).slideUp(500, function () {
        $('.alert-banner').slideUp(500);
        $('.alert-banner').remove();
    });

    return $alert
};

Project.Util.confirm = function (title, contents, submitCallback, cancelCallback,boxWidth	) {
    $.confirm({
        title: title,
        content: contents,
        buttons: {
            formSubmit: {
                text: '확인',
                btnClass: 'btn-info',
                action: function () {
                    submitCallback();
                }
            },
            cancel: {
                text: '취소',
                action: function () {
                    if (cancelCallback) {
                        cancelCallback();
                    }
                }
            }
        },
		boxWidth :boxWidth ? boxWidth : '50%'
	})
};
