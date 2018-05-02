<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8"  pageEncoding="UTF-8" %>
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered"><a href="profile.html"><img src="/resources/img/user/002-boy-5.png" class="img-circle" width="60"></a></p>
			<h5 class="centered"><c:out value="${loginUser.user_id}"/></h5>

			<li class="mt sub-menu sub-menu-dashboard">
				<a class="" href="/">
					<i class="fa fa-dashboard"></i>
					<span>대시보드</span>
				</a>
			<li class="sub-menu sub-menu-projectlist">
				<a  href="/project">
					<i class="fa fa-th"></i>
					<span>프로젝트</span>
				</a>
			</li>
		</ul>

	</div>
</aside>
<script type="text/javascript">
	$(function () {
		bindEvent();
	});
	var bindEvent = function () {

	}
</script>
