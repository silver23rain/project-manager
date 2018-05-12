var Block = {};
Block.Data = {
	init:function(blockCase) {
		switch(blockCase){
			case "NONE_OPENED_SPRINT":
				this.none_opened_spirnt()
				break;
			default:
				break;
		}
	},
	none_opened_spirnt: function() {
		var data = {
			title: "현재 진행 중인 스프린트가 없습니다.",
			body: ["백로그 목록에서 스프린트 시작 버튼을 눌러 주세요."],
			icon: "fa-times"
		};
		this.setData(data);
	},
	setData: function(blockData) {
		$("#block_title > h1").append(blockData.title);
		$("#block_icon").addClass(blockData.icon);
		$(blockData.body).each(function(index, item) {
			$("#block_body").append("<li>").append("<p class='fa-lg centered'>").text(item);
		});
	},
	draw: function() {

	}
};