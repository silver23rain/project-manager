<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="main-content">
	<section class="wrapper">
		<h3><i class="fa fa-angle-right"></i>프로젝트 목록</h3>
		<div class="row mt">
			<div class="col-md-12">
				<div id="create_project_btn" class="btn btn-primary btn-sm">프로젝트 생성</div>
				<div id="projectlist_grid" class="grid" style="width: 100%;">
				</div>

			</div>
		</div>
	</section>
</section>
<xmldata id="projectListXmlData"
         data-projectList="<c:out value="${projectList}"/>">
</xmldata>
<script type="text/javascript" src="/resources/js/project/projectlist.js"></script>
<script>
	var $xmlData = document.getElementById("projectListXmlData");
	var projectList = JSON.parse($xmlData.getAttribute("data-projectList"));

	$(function () {
		init(projectList);
		bindEvents();
	});


</script>
