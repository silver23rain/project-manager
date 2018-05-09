<%@ page contentType="text/html; charset=utf-8"  pageEncoding="UTF-8" %>
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-6 col-md-6 col-sm-12">
				<! -- BASIC PROGRESS BARS -->
				<div class="panel">
					<h3><i class="fa fa-angle-right"></i>구성원 활동 사항</h3>

				</div><!--/showback -->
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12">
				<! -- ALERTS EXAMPLES -->
				<div class="panel">
					<h3><i class="fa fa-angle-right"></i> 내게 할당된 업무</h3>
				</div><!-- /showback -->

			</div>
		</div>
	</section>
</section>
<script>
	//custom select box
	$(function () {
		init();
	});

	var init = function () {
		$(".sub-menu a").removeClass('active');
		$(".sub-menu-dashboard a").addClass('active');
	}
</script>
