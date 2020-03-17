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
<!-- 引入zTree样式文件 -->
<link rel="stylesheet" href="${APP_PATH}/ztree/zTreeStyle.css">
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
<title>角色维护</title>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">众筹平台
						- 角色维护</a>
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
								<li style="height: 30px;"><a href="../user/index"><i
										class="glyphicon glyphicon-user"></i> 用户维护</a></li>
								<li style="height: 30px;"><a href="../user/index"><i
										class="glyphicon glyphicon-king"></i> 角色维护</a></li>
								<li style="height: 30px;"><a href="index" style="color:red"><i
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
					  <!-- 增加一个按钮 -->
					  <button class="btn btn-success" onclick="doAssign()">分配许可</button>
					<!-- zTree的容器ul -->
					  <ul id="permissionTree" class="ztree"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<!-- 引入zTree的脚本文件，一定要放在jquery脚本文件之后 -->
	<script src="${APP_PATH}/ztree/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript">
		var likeFlag = false;//模糊查询开启的标志
		$(function() {
			$(".list-group-item").click(function() {
				// jquery对象的回调方法中的this关键字为DOM对象
				// $(DOM) ==> JQuery
				if ($(this).find("ul")) { // 3 li
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			
			//页面加载完成后初始化树形结构
			var setting={
				async:{
					url:"${APP_PATH}/permission/loadAssignData?roleId=${param.id}",
					enable:true,
					autoParam:["id", "name=n", "level=lv"]
				},
				//增加复选框
				check : {
				    enable : true 
				},
				view: {
					//不支持多选
					selectedMulti: false,
					//改变节点图标
					addDiyDom: function(treeId, treeNode){
						var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
						if ( treeNode.icon ) {
							icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
						}
                        
					}
				}
			};
			
			
			//异步获取树形结构数据
			$.fn.zTree.init($('#permissionTree'),setting);
		});

		//执行分配
		function doAssign(){
			//获取树对象
			var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
			//获取被选中的节点
			var nodes = treeObj.getCheckedNodes(true);
			if(nodes.length==0){
				layer.msg("请选择要分配的许可信息！",{time:2000,icon:5,shift:5},function(){
					
				});
			}else{
				var d = "roleId=${param.id}";
				$.each(nodes,function(i,node){
					d+="&permissionIds="+node.id;
				});
				$.ajax({
					url:"${APP_PATH}/role/doAssign",
					type:"POST",
					data:d,
					success:function(result){
						if(result.success){
							layer.msg("成功分配许可信息！",{time:2000,icon:6,shift:5},function(){
								
							});	
						}else{
							layer.msg("分配许可信息失败！",{time:2000,icon:5,shift:5},function(){
								
							});
						}
					}
				});
			}
		}
	</script>
</body>
</html>










