<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	@keyframes example {
		from {
			opacity: 0
		}
		to {
			opacity: 1
		}
	}

	#project_create_panel {
		animation-name: example;
		animation-duration: 2s;
	}

	#project_create_panel h2 {
		font-weight: bold;
		text-align: center;
	}

	#new_img {
		margin: 20px auto 0;
		width: 150px;
		height: 150px;
		background: url("/resources/img/global/project_icon.png") no-repeat;
		opacity: 0.7;
	}

	#project_create_panel p {
		font-size: 18px;
		font-weight: bold;
	}

	#project_name {
		width: 100%;
		height: 30px;
		margin: 10px 0px 1px;
	}

	#create_btn {
		width: 100%;
		margin-top: 5px;
	}
</style>
<section id="main-content">
	<section class="wrapper">
		<div class="col-lg-5 col-md-5 col-sm-5" style="margin-left: 25%">
			<div class="panel" style="margin-top: 150px" id="project_create_panel">
				<h2>프로젝트 생성</h2>
				<div id="new_img"></div>
				<p>프로젝트 명</p>
				<input type="text" id="project_name" placeholder="프로젝트 명을 입력해주세요.(영어만 가능)" autofocus="autofocus">
				<div  class ="alert-div">
					<div class="alert-danger alert-sm alert" id="project_name_alert"></div>
				</div>
				<button class="btn btn-primary btn-sm" id="create_btn">생성</button>
			</div>
		</div>
	</section>
</section>
<script  src="/resources/js/common/util.js"></script>
<script type="text/javascript" src="/resources/js/project/project_create.js"></script>
<script>
	$(function () {
		bindEvents();
	});


</script>
