var Sprint = {
	sprint_year : "",
	sprint_no :"" ,
	start_date:"",
	end_date:"",
	sprint_goal:"",
	init:function() {
		Sprint.Modal.bindEvents();
	},
	getData :function() {
		return {
			sprint_year : "",
			sprint_no :"" ,
			start_date:"",
			end_date:"",
			sprint_goal:"",

		}
	}
};
Sprint.Modal ={
	bindEvents: function() {
		$(".modal-body").on("click",$("#sprint_start_btn"),function() {
			$("#sprint_start_btn").addClass("btn-info");
			Calendar.showDatePicker();

		});
	},
	showOpenSprintModal : function(result) {
		var $simpleModal = $('#simple_modal');
		$simpleModal.find('#myModalLabel').html("스프린트 시작하기");
		var $modalBody = $simpleModal.find('.modal-body');
		$modalBody.empty();

		var $formData = '<div class ="form-group">';
		$formData += '<h5>스프린트명</h5>';
		$formData += '<input type="text" disabled="disabled" id="sprint_name" class="form-control">';
		$formData += "<div id='sprint_date'><h5>날짜 설정</h5></div>";
		$formData += '<h5>스프린트 목표</h5>';
		$formData += '<textarea id="sprint_goal"  class="form-control">';
		$modalBody.append($formData);

		var $starDate = "<div class='col-md-6'>";
		$starDate += '<button class=" pull-right btn btn-sm" id="sprint_start_btn">시작 일자</button>';
		$("#sprint_date").append($starDate);

		var $endDate = "<div class='col-md-6'>";
		$endDate += '<button class=" pull-left btn btn-sm"  disabled id="sprint_end_btn">종료 일자</button>';
		$("#sprint_date").append($endDate);

		$("#modal_submit").text("스프린트 시작");
		$simpleModal.modal('show');
	},
	showNewSprintModal : function(result) {
		var $simpleModal = $('#simple_modal');
		$simpleModal.find('#myModalLabel').html("스프린트 생성");
		var $modalBody = $simpleModal.find('.modal-body');
		$modalBody.empty();

		var $formData = '<div class ="form-group">';
		$formData += '<h5>스프린트명</h5>';
		$formData += '<input type="text" disabled="disabled" id="sprint_name" class="form-control">';
		$formData += '<h5>스프린트 목표</h5>';
		$formData += '<textarea id="sprint_goal"  class="form-control">';
		$modalBody.append($formData);

		$("#sprint_name").attr("sprint-year", result.sprint_year);
		$("#sprint_name").attr("sprint-no", result.sprint_no);
		$("#sprint_name").val(result.project_name + '_' + result.sprint_year + '-' + result.sprint_no);

		$("#modal_submit").text("생성하기");
		$simpleModal.modal('show');
	}
};
var Calendar = {
	datepicker : null,
	showDatePicker : function() {
		if(Calendar.getDataPicker()){
			if(Calendar.getSelectDates().length === 2){
				this.datepicker.unselectAll();
			}
			return;
		}
		this.datepicker = new Datepickk();
		this.datepicker.lang = "ko";
		this.datepicker.range = true;
		this.datepicker.maxSelections = 2;
		this.datepicker.container = document.querySelector('#sprint_date');
		this.datepicker.show();
		Calendar.bindEvents();
	},
	bindEvents:function() {
		this.datepicker.onSelect = function(checked){
			var selectedDates = Calendar.getSelectDates();

			if(selectedDates.length === 1 ){
				$("#sprint_end_btn").removeAttr("disabled");
				$("#sprint_end_btn").addClass("btn-info");
			}else if(selectedDates.length === 2 ){
				$("#sprint_date").find("button").removeClass("btn-info");
				$("#sprint_end_btn").attr("disabled","disabled");
			}
			console.log(Calendar.datepicker.selectedDates);
		};
	},
	getDataPicker : function() {
		return this.datepicker;
	},
	getSelectDates : function() {
		return Calendar.datepicker.selectedDates;
	}
};