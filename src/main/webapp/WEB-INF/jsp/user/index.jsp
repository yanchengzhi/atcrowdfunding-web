<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
</style>
<title>用户维护</title>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">众筹平台
						- 用户维护</a>
				</div>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li style="padding-top: 8px;">
						<div class="btn-group">
							<button type="button"
								class="btn btn-default btn-success dropdown-toggle"
								data-toggle="dropdown">
								<i class="glyphicon glyphicon-user"></i> ${currentUser.username}<span
									class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
										个人设置</a></li>
								<li><a href="#"><i class="glyphicon glyphicon-comment"></i>
										消息</a></li>
								<li class="divider"></li>
								<li><a href="logout"><i class="glyphicon glyphicon-off"></i>
										退出系统</a></li>
							</ul>
						</div>
					</li>
					<li style="margin-left: 10px; padding-top: 8px;">
						<button type="button" class="btn btn-default btn-danger">
							<span class="glyphicon glyphicon-question-sign"></span> 帮助
						</button>
					</li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<ul style="padding-left: 0px;" class="list-group">
						<li class="list-group-item tree-closed"><a href="../main"><i
								class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span
								class="badge" style="float: right">3</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="index" style="color:red"><i
										class="glyphicon glyphicon-user"></i> 用户维护</a></li>
								<li style="height: 30px;"><a href="../role/index"><i
										class="glyphicon glyphicon-king"></i> 角色维护</a></li>
								<li style="height: 30px;"><a href="../permission/index"><i
										class="glyphicon glyphicon-lock"></i> 许可维护</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge"
								style="float: right">3</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="auth_cert.html"><i
										class="glyphicon glyphicon-check"></i> 实名认证审核</a></li>
								<li style="height: 30px;"><a href="auth_adv.html"><i
										class="glyphicon glyphicon-check"></i> 广告审核</a></li>
								<li style="height: 30px;"><a href="auth_project.html"><i
										class="glyphicon glyphicon-check"></i> 项目审核</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i
								class="glyphicon glyphicon-th-large"></i> 业务管理 <span
								class="badge" style="float: right">7</span></span>
							<ul style="margin-top: 10px; display: none;">
								<li style="height: 30px;"><a href="cert.html"><i
										class="glyphicon glyphicon-picture"></i> 资质维护</a></li>
								<li style="height: 30px;"><a href="type.html"><i
										class="glyphicon glyphicon-equalizer"></i> 分类管理</a></li>
								<li style="height: 30px;"><a href="process.html"><i
										class="glyphicon glyphicon-random"></i> 流程管理</a></li>
								<li style="height: 30px;"><a href="advertisement.html"><i
										class="glyphicon glyphicon-hdd"></i> 广告管理</a></li>
								<li style="height: 30px;"><a href="message.html"><i
										class="glyphicon glyphicon-comment"></i> 消息模板</a></li>
								<li style="height: 30px;"><a href="project_type.html"><i
										class="glyphicon glyphicon-list"></i> 项目分类</a></li>
								<li style="height: 30px;"><a href="tag.html"><i
										class="glyphicon glyphicon-tags"></i> 项目标签</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><a href="param.html"><i
								class="glyphicon glyphicon-list-alt"></i> 参数管理</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input id="query_text" class="form-control has-success"
										type="text" placeholder="请输入查询条件">
								</div>
							</div>
							<button type="button" id="query_btn" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" onclick="deleteUsers()"
							class="btn btn-danger" style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;"
							onclick="window.location.href='${APP_PATH}/user/add'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<form id="userForm">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="45">序号</th>
											<th width="40" style="text-align: center"><input
												type="checkbox" id="allSelBox"></th>
											<th style="text-align: center">账号</th>
											<th style="text-align: center">名称</th>
											<th style="text-align: center">邮箱地址</th>
											<th width="100" style="text-align: center">操作</th>
										</tr>
									</thead>
									<tbody style="text-align: center" id="userData">

									</tbody>
									<tfoot>
										<tr>
											<td colspan="6" align="center">
												<ul class="pagination">

												</ul>
											</td>
										</tr>

									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		var likeFlag = false;//模糊查询的标志，为false时不是模糊查询，为true时是模糊查询
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			queryPaged(1);//查询第1页

			//实现模糊查询功能
			$('#query_btn').click(function() {
				//获取文本框的值
				var queryText = $('#query_text').val();
				if (queryText == "") {//如果为空串
					likeFlag = false;//关闭模糊查询
				} else {//否则开启模糊查询
					likeFlag = true;
				}
				queryPaged(1);
			});

			//实现复选框的全选与反选功能
			$('#allSelBox').click(function() {
				//先获取表头复选框的选中状态
				var flg = this.checked;
				//然后将表格中的全部复选框与表头中的状态保持一致
				$('#userData :checkbox').each(function() {
					this.checked = flg;
				});
			});
		});
		$("tbody .btn-success").click(function() {
			window.location.href = "assignRole.html";
		});
		$("tbody .btn-primary").click(function() {
			window.location.href = "edit.html";
		});

		//异步分页查询
		function queryPaged(pageNum) {
			var loadingIndex = null;
			var jsonData = {
				"page" : pageNum,
				"pageSize" : 8
			};
			if (likeFlag == true) {
				jsonData.queryText = $('#query_text').val();
			}
			$
					.ajax({
						url : "${APP_PATH}/user/queryPaged",
						type : "POST",
						data : jsonData,
						beforeSend : function() {
							loadingIndex = layer.msg("处理中", {
								icon : 16
							});
						},
						success : function(result) {
							layer.close(loadingIndex);
							if (result.success) {
								//局部刷新页面数据
								var tableContent = "";
								var pageContent = "";
								//从后台获取数据
								var userPage = result.data;
								var users = userPage.datas;
								//遍历并拼接字符串
								$
										.each(
												users,
												function(i, user) {
													tableContent += '<tr>';
													tableContent += '<td>'
															+ (i + 1) + '</td>';
													tableContent += '<td><input type="checkbox" name="userId" value="'+user.id+'"></td>';
													tableContent += '<td>'
															+ user.loginName
															+ '</td>';
													tableContent += '<td>'
															+ user.username
															+ '</td>';
													tableContent += '<td>'
															+ user.email
															+ '</td>';
													tableContent += '<td>';
													tableContent += '<button type="button" onclick="goAssignPage('+user.id+')" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-check"></i></button>&nbsp;';
													tableContent += '<button type="button" onclick="goUpdatePage('
															+ user.id
															+ ')" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>&nbsp;';
													tableContent += '<button type="button" onclick="deleteUser('
															+ user.id
															+ ',\''
															+ user.loginName
															+ '\')" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></button>';
													tableContent += '</td>';
													tableContent += '</tr>';
												});
								//显示页码导航条
								//上一页
								if (pageNum == 1) {
									pageContent += '<li class="disabled"><a href="#">上一页</a></li>';
								}

								if (pageNum > 1) {
									pageContent += '<li><a href="#" onclick="queryPaged('
											+ (pageNum - 1) + ')">上一页</a></li>';
								}
								//显示页码数
								for (var i = 1; i <= userPage.maxPage; i++) {
									//添加当前页样式  		    
									if (i == pageNum) {
										pageContent += '<li class="active"><a href="#">'
												+ i + '</a></li>';
									} else {
										pageContent += '<li><a href="#" onclick="queryPaged('
												+ i + ')">' + i + '</a></li>';
									}
								}
								//下一页
								if (pageNum < userPage.maxPage) {
									pageContent += '<li><a href="#" onclick="queryPaged('
											+ (pageNum + 1) + ')">下一页</a></li>';
								} else {
									pageContent += '<li class="disabled"><a href="#">下一页</a></li>';
								}
								$('#userData').html(tableContent);//添加查询主内容
								$('.pagination').html(pageContent);//添加页码导航条
							} else {
								layer.msg("查询失败！", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
							}
						}
					});
		}

		//修改功能
		function goUpdatePage(id) {
			window.location.href = "${APP_PATH}/user/edit?id=" + id;
		}
		
		//角色分配
		function goAssignPage(id){
			window.location.href="${APP_PATH}/user/assign?id="+id;
		}

		//批量删除
		function deleteUsers() {
			var boxes = $('#userData :checkbox');//获取所有选中的复选框
			if (boxes.length == 0) {
				layer.msg("未选中任何信息！请选中要删除的用户", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {

				});
			} else {
				layer.confirm("删除选中的用户信息，是否继续？", {
					icon : 3,
					title : "提示"
				}, function(cindex) {
					//删除用户信息
					$.ajax({
						url : "${APP_PATH}/user/deletes",
						type : "POST",
						data : $('#userForm').serialize(),//序列化id集合，传给后台
						success : function(result) {
							if (result.success) {
								queryPaged(1);//删除成功重新查询第一页
							} else {//删除失败提示信息
								layer.msg("用户删除失败！", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
							}
						}
					});
					layer.close(cindex);
				}, function(cindex) {
					layer.close(cindex);
				});
			}
		}

		//删除功能
		function deleteUser(id, loginName) {
			layer.confirm("删除用户【" + loginName + "】，是否继续？", {
				icon : 3,
				title : "提示"
			}, function(cindex) {
				//删除用户信息
				$.ajax({
					url : "${APP_PATH}/user/delete",
					type : "POST",
					data : {
						"id" : id
					},
					success : function(result) {
						if (result.success) {
							queryPaged(1);//删除成功重新查询第一页
						} else {//删除失败提示信息
							layer.msg("用户删除失败！", {
								time : 2000,
								icon : 5,
								shift : 6
							}, function() {

							});
						}
					}
				});
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	</script>
</body>
</html>

