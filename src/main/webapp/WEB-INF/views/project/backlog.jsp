<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/to-do.css">

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/resources/js/tasks.js" type="text/javascript"></script>
<section id="main-content">
	<section class="wrapper">
		<h3><i class="fa fa-angle-right"></i>백로그</h3>
		<div class="row mb">
			<div class="col-md-12">
				<section class="task-panel tasks-widget">
					<div class="panel-heading">
						<div class="pull-left"><h5><i class="fa fa-tasks"></i> Todo List - Sortable Style</h5></div>
						<br>
					</div>
					<div class="panel-body">
						<div class="task-content">
							<ul id="sortable" class="task-list sortable">
								<li class="list-primary">
									<i class=" fa fa-ellipsis-v"></i>
									<div class="task-checkbox">
										<input type="checkbox" class="list-child" value=""/>
									</div>
									<div class="task-title">
										<span class="task-title-sp">Dashgum - Admin Panel Theme</span>
										<span class="badge bg-theme">Done</span>
										<div class="pull-right hidden-phone">
											<button class="btn btn-success btn-xs fa fa-check"></button>
											<button class="btn btn-primary btn-xs fa fa-pencil"></button>
											<button class="btn btn-danger btn-xs fa fa-trash-o"></button>
										</div>
									</div>
								</li>

								<li class="list-danger">
									<i class=" fa fa-ellipsis-v"></i>
									<div class="task-checkbox">
										<input type="checkbox" class="list-child" value=""/>
									</div>
									<div class="task-title">
										<span class="task-title-sp">Extensive collection of plugins</span>
										<span class="badge bg-warning">Cool</span>
										<div class="pull-right hidden-phone">
											<button class="btn btn-success btn-xs fa fa-check"></button>
											<button class="btn btn-primary btn-xs fa fa-pencil"></button>
											<button class="btn btn-danger btn-xs fa fa-trash-o"></button>
										</div>
									</div>
								</li>
								<li class="list-success">
									<i class=" fa fa-ellipsis-v"></i>
									<div class="task-checkbox">
										<input type="checkbox" class="list-child" value=""/>
									</div>
									<div class="task-title">
										<span class="task-title-sp">Free updates always, no extra fees.</span>
										<span class="badge bg-success">2 Days</span>
										<div class="pull-right hidden-phone">
											<button class="btn btn-success btn-xs fa fa-check"></button>
											<button class="btn btn-primary btn-xs fa fa-pencil"></button>
											<button class="btn btn-danger btn-xs fa fa-trash-o"></button>
										</div>
									</div>
								</li>
								<li class="list-warning">
									<i class=" fa fa-ellipsis-v"></i>
									<div class="task-checkbox">
										<input type="checkbox" class="list-child" value=""/>
									</div>
									<div class="task-title">
										<span class="task-title-sp">More features coming soon</span>
										<span class="badge bg-info">Tomorrow</span>
										<div class="pull-right hidden-phone">
											<button class="btn btn-success btn-xs fa fa-check"></button>
											<button class="btn btn-primary btn-xs fa fa-pencil"></button>
											<button class="btn btn-danger btn-xs fa fa-trash-o"></button>
										</div>
									</div>
								</li>
								<li class="list-info">
									<i class=" fa fa-ellipsis-v"></i>
									<div class="task-checkbox">
										<input type="checkbox" class="list-child" value=""/>
									</div>
									<div class="task-title">
										<span class="task-title-sp">Hey, seriously, you should buy this Dashboard</span>
										<span class="badge bg-important">Now</span>
										<div class="pull-right hidden-phone">
											<button class="btn btn-success btn-xs fa fa-check"></button>
											<button class="btn btn-primary btn-xs fa fa-pencil"></button>
											<button class="btn btn-danger btn-xs fa fa-trash-o"></button>
										</div>
									</div>
								</li>

							</ul>
						</div>
						<div class=" add-task-row">
							<a class="btn btn-success btn-sm pull-left" href="todo_list.html#">Add New Tasks</a>
							<a class="btn btn-default btn-sm pull-right" href="todo_list.html#">See All Tasks</a>
						</div>
					</div>
				</section>
			</div><!--/col-md-12 -->
		</div><!-- /row -->
	</section>
</section>
<script>
	jQuery(document).ready(function () {
		TaskList.initTaskWidget();
	});

	$(function () {
		$(".sortable").sortable();
		$(".sortable").disableSelection();
	});

</script>

