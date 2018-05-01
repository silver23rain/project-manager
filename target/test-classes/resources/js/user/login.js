var init = function () {

};

var bindEvents = function () {
	$("#login_form").on("submit", function (event) {
		event.preventDefault();
		var $loginId = $("#user_id").val();
		var $loginPassword = $("#user_password").val();

		if (validationId($loginId)) {
			if (validationPassword($loginPassword)) {
				$(this).attr('action','/user/signin');
				$(this).get(0).submit();
				// $.ajax({
				// 	url: "/user/signin",
				// 	type: "POST",
				// 	data: {
				// 		user_id: $loginId,
				// 		user_password: $loginPassword
				// 	},
				// 	success: function (result) {
				// 		if (result === "LOGIN_SUCCESS") {
				// 			window.location.reload();
				// 		}
				// 		else {
				// 			alert("아이디나 비밀번호를 다시 확인해주세요.");
				// 		}
				//
				// 	},
				// 	error: function () {
				// 		console.log("fails")
				// 	}
				//
				// })

			}
		}

	});
	var validationId = function (user_id) {
		if (user_id.length === 0) {
			$("#user_id_alert").html("아이디를 입력하세요.");
			return false;
		}

		$("#user_id_alert").html("");

		return true;
	}

	var validationPassword = function (user_password) {
		if (user_password.length === 0) {
			$("#user_pw_alert").html("비밀번호를 입력하세요");
			return false;
		}

		$("#user_pw_alert").html("");
		return true;
	}
}