var init = function () {

};
var validationProjectName = function (projectName) {
	if (projectName.length === 0){
		Project.Util.alertText($("#project_name_alert"),"프로젝트명 입력은 필수입니다.");
		return false;
	}

	var regProjectName =  /^[A-Za-z+]*$/;
	if (!regProjectName.test(projectName)){
		Project.Util.alertText($("#project_name_alert"),"프로젝트명을 영어로만 입력해주세요.");
		return false;
	}

	return true;
};
var bindEvents = function () {
	$("#create_btn").on("click", function () {
		var $projectName = $("#project_name").val();

		if (validationProjectName($projectName)) {
			$.ajax({
				url:"/project/create",
				method: "POST",
				dataType: "json",
				data:{
					project_name : $projectName
				},
				async :false,
				success : function (result) {
					if(result.code === "SUCCESS"){
						window.location.href = "/project";
					}else if(result.code ==="DUPLICATED_NAME"){
						Project.Util.alertText($("#project_name_alert"),"해당 프로젝트명이 존재합니다.");
					}
				},error : function (result) {

				}

			})
		}
	});
};