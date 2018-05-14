<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	#block_div{
		margin-left: 20%;
		margin-top: 150px;
	}
</style>
<section id="main-content">
	<section class="wrapper">
		<div class="col-md-12 mt">
			<div id ="block_div" class="col-lg-6 col-md-6 col-sm-6">
				<div id="block_title">
					<i id="block_icon" class="fa fa-5x  col-sm-2"></i>
					<h1></h1>
				</div>
				<ul id="block_body"></ul>
			</div>
		</div>
	</section>
</section>
<script type="text/javascript">
	$(function() {
		var blockCase = "<c:out value="${blockCase}">null</c:out>";
		Block.Data.init(blockCase);
	});
</script>