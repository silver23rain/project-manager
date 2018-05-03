<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="login-page">
	<div class="container">
		<form id="login_form" method="post" action="/user/signin" class="form-login" action="/">
			<h2 class="form-login-heading">로그인</h2>
			<div class="login-wrap">
				<input type="text" name="user_id" id="user_id" class="form-control" placeholder="아이디" autofocus>
				<div class="alert-div">
					<div class="alert-danger" id="user_id_alert"></div>
				</div>
				<input type="password" name="user_password" id="user_password" class="form-control" placeholder="비밀번호">
				<div class="alert-div" >
					<div class="alert-danger" id="user_pw_alert"></div>
				</div>
				<label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> 비밀번호가 기억나지 않으십니까?</a>
		                </span>
				</label>
				<button id="login_btn" class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i>로그인
				</button>
				<hr>

				<div class="login-social-link centered">

				</div>
				<div class="registration">
					혹시 계정이 없으십니까?<br/>
					<a class="" href="#">
						회원가입하기
					</a>
				</div>

			</div>

		</form>

		<!-- Modal -->
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal"
		     class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Forgot Password ?</h4>
					</div>
					<div class="modal-body">
						<p>Enter your e-mail address below to reset your password.</p>
						<input type="text" name="email" placeholder="Email" autocomplete="off"
						       class="form-control placeholder-no-fix">

					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
						<button class="btn btn-theme" type="button">Submit</button>
					</div>
				</div>
			</div>
		</div>
		<!-- modal -->


	</div>
</div>
<script src="/resources/js/common/util.js"></script>
<script type="text/javascript" src="/resources/js/user/login.js"></script>
<script>
	$(function() {
		bindEvents();
	});
</script>
