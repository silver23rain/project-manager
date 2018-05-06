var Sprint = {
    init: function () {
        Sprint.Modal.bindEvents();

    },
    createSprint: function (result) {
        $.ajax({
            url: "/project/sprint/create",
            method: "POST",
            dataType: "json",
            data: {
                project_id: Project.Data.projectId,
                sprint_year: result.sprint_year,
                sprint_no: result.sprint_no,
            },
            success: function (result) {
                if (result.code === "SUCCESS") {
                    window.location.reload();
                } else {
                    Project.Util.alertBanner($("#main-content .wrapper"), "스프린트를 생성하는데 실패하였습니다.");
                }
            }, complete: function () {
                $('#simple_modal').toggle();
            }

        });
    }
};

function sprintStartCallback() {
    $.ajax({
        url: "/project/sprint/update",
        method: "POST",
        dataType: "json",
        data: Sprint.Modal.modalData,
        success: function (result) {
            console.log(result);
        }
    })
}

Sprint.Modal = {
    modalData: {
        project_id: Project.Data.projectId,
        sprint_no: null,
        sprint_year: null,
        sprint_goal: null,
        start_date: null,
        end_date: null
    },
    bindEvents: function () {
        $(".modal-body").on("click", "#sprint_start_btn", function () {
            $("#sprint_start_btn").addClass("btn-info");
            $("#sprint_datepicker").collapse("show");
        });

        $("#modal_submit").on("click", function () {
            Sprint.Modal.modalData.sprint_goal = $("#sprint_goal").val();
            if (Calendar.getSelectDates().length !== 2) {
                $("#alert_date").text("날짜 선택은 필수입니다.");
                return;
            }
            Sprint.Modal.modalData.start_date = Calendar.toDate(Calendar.getSelectDates()[0]);
            Sprint.Modal.modalData.end_date = Calendar.toDate(Calendar.getSelectDates()[1]);

            console.log(Sprint.Modal.modalData);

            var confirmMessage = "시작 날짜 : <label>" + Sprint.Modal.modalData.start_date + "</label>, " +
                "종료 날짜 : <label>" + Sprint.Modal.modalData.end_date + "</label> <br> 해당 설정으로 스프린트를 시작하시겠습니까?";

            Project.Util.confirm('', confirmMessage, function () {
                sprintStartCallback();
            });
        })
    },
    showOpenSprintModal: function (data) {
        var $simpleModal = $('#simple_modal');
        $simpleModal.find('#myModalLabel').html("스프린트 시작하기");
        var $modalBody = $simpleModal.find('.modal-body');
        $modalBody.empty();

        var $formData = '<div class ="form-group">';
        $formData += '<h5>스프린트명<span style="color: red;">*</span></h5>';
        $formData += '<input type="text" disabled="disabled" id="sprint_name" class="form-control" >';
        $formData += "<h5>날짜 설정<span  style='color: red;'>*</span><alert id='alert_date' class='centered'></alert></h5>";
        $formData += "<div id='sprint_date' class= 'row'></div>";
        $formData += "<div id='sprint_datepicker' class= 'row collapse'></div>";
        $formData += '<h5>스프린트 목표</h5>';
        $formData += '<textarea id="sprint_goal"  class="form-control">';
        $modalBody.append($formData);

        $("#sprint_name").val(data.sprintTitle);
        this.setModalData(data);

        var $starDate = "<div class='col-md-6 col-sm-6 col-xs-6'>";
        $starDate += '<button class=" pull-right btn btn-sm" id="sprint_start_btn">시작 일자</button>';
        $("#sprint_date").append($starDate);

        var $endDate = "<div class='col-md-6 col-sm-6 col-xs-6'>";
        $endDate += '<button class=" pull-left btn btn-sm"  disabled id="sprint_end_btn">종료 일자</button>';
        $("#sprint_date").append($endDate);

        $("#modal_submit").text("스프린트 시작");
        $simpleModal.modal('show');

        Calendar.showDatePicker();

    },
    setModalData: function (data) {
        this.modalData.sprint_no = data.sprintNo;
        this.modalData.sprint_year = data.sprintYear;
    }
};
var Calendar = {
    datepicker: null,
    showDatePicker: function () {
        if (!Calendar.getDataPicker()) {
            this.datepicker = new Datepickk();
            this.datepicker.lang = "ko";
            this.datepicker.range = true;
            this.datepicker.maxSelections = 2;
        }
        if (Calendar.getSelectDates().length === 2) {
            this.datepicker.unselectAll();
        }
        this.datepicker.container = document.querySelector('#sprint_datepicker');
        this.datepicker.show();
        $("#sprint_end_btn").removeClass("btn-info");
        Calendar.bindEvents();
    },
    bindEvents: function () {
        this.datepicker.onSelect = function (checked) {
            var selectedDates = Calendar.getSelectDates();

            if (selectedDates.length === 1) {
                $(".single").removeClass(".single");
                $("#sprint_end_btn").removeAttr("disabled");
                $("#sprint_end_btn").addClass("btn-info");
            } else if (selectedDates.length === 2) {
                $("#sprint_date").find("button").removeClass("btn-info");
                $("#sprint_end_btn").attr("disabled", "disabled");
            } else {

                $("#sprint_start_btn").addClass("btn-info");
                $("#sprint_end_btn").attr("disabled", "disabled");
            }
        };
    },
    getDataPicker: function () {
        return this.datepicker;
    },
    getSelectDates: function () {
        return Calendar.datepicker.selectedDates;
    },
    toDate: function (date) {
        var cal = new Date(Calendar.getSelectDates()[0]);
        cal.setDate(date.getDate() + 1);
        return cal.toJSON().substring(0, 10);
    }
};