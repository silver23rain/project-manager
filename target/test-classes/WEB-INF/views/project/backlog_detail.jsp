<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	span [name ="backlog_key"]{
		margin-right: 8px;
	}
</style>
<div class="modal fade" id="backlogDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"><span name="backlog_key"></span>백로그 상세</h4>
			</div>
			<div class="modal-body">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">프로젝트명</label>
						<div class="col-sm-9">
							<p class="form-control-static" name="project_name"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">백로그명</label>
						<div class="col-sm-6">
							<input type="text" class="form-control ellipsis" name="backlog_title">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">우선순위</label>
						<div class="btn-group col-sm-4">
							<button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">선택하세요<span class="fa fa-caret-down"></span></button>
							<ul class="dropdown-menu" role="menu" class ="backlog_priority">
								<li><a href="#"><i class=" fa  fa-angle-double-up"></i>최상</a></li>
								<li><a href="#"><i class=" fa  fa-angle-up"></i>상</a></li>
								<li><a href="#"><i class=" fa  fa-angle-down"></i>중</a></li>
								<li><a href="#"><i class=" fa  fa-angle-double-down"></i>하</a></li>
							</ul>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">담당자</label>
						<div class="col-sm-4">
							<a><p class="form-control-static" name ="backlog_assigned"></p></a>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">스토리 포인트</label>
						<div class="btn-group col-sm-4">
							<button type="button" class="btn btn-sm btn-default dropdown-toggle selectedItem" data-toggle="dropdown"></button>
							<ul class="dropdown-menu" role="menu" name ="story_point" aria-labelledby="dLabel">
								<li><a>0</a></li>
								<li><a>1</a></li>
								<li><a>2</a></li>
								<li><a>3</a></li>
								<li><a>8</a></li>
								<li><a>13</a></li>
								<li><a>20</a></li>
								<li><a>40</a></li>
								<li><a>100</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div>
						<label class="control-label">내용</label>
						<textarea class="form-control" rows="5" name ="backlog_contents"></textarea>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-info" id="modal_submit">저장</button>
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>