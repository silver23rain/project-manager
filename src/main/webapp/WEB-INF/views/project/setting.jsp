<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	select {
		border-radius: 5px;
	}

	#main-content img{
		margin: 20px 108px 6px;
	}

	.img-div {
		margin: 20px 108px 6px;
		width: 150px;
		height: 150px;
		background: url("/resources/img/global/connection.png") no-repeat;
		opacity: 0.7;
	}

	#userlist_grid + .empty_row {
		width: 100%;
		margin-left: 55px
	}

	#invite_btn{
		margin-right: 39px;
	}
</style>
<script src ="/resources/js/project/setting.js"></script>
<section id="main-content">
	<section class="wrapper">
		<div class="col-md-12 mt">
			<h2 id="sprint_title"><i class="fa fa-angle-right"></i> 팀원 목록
				<button id="invite_btn" class="btn btn-info btn-sm pull-right">팀원 추가 하기</button>
			</h2>
			<div class="row">
				<div class="row col-md-11" >
					<div id="userlist_grid" class="grid" style="width: 100%; margin: 20px 7% 0;">
					</div>
				</div>
			</div>
		</div>
	</section>
</section>

<div class="modal fade" id="invite_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"><span name="projectName"></span>(으)로 팀원 추가 하기</h4>
			</div>
			<div class="modal-body">
				<div class="img-div"></div>
				<div class="input-group">
					<span class="input-group-addon" ><i class="fa fa-search"></i></span>
					<input type="text" placeholder="검색할 아이디나 이름을 입력하시오." id="search_user"  class="form-control">
				</div>
				<div id="search_result_grid" class="grid" style="width: 100%;max-height: 300px"></div>

			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-info" id="modal_submit">초대하기</button>
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
	<xmldata id="settingXmlData" data-userList="<c:out value="${userList}"/>">
	</xmldata>
	<script>
		var $xmlData = document.getElementById("settingXmlData");
		var userList = JSON.parse($xmlData.getAttribute("data-userList"));

		$(function() {
			jQuery.extend({
				outerHtml: function($selector) {
					return $selector.wrapAll("<div/>").parent().html();
				}
			});
			Project.Setting.init();
		});
	</script>
