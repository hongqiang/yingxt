<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>
<title></title>
<%@include file="/views/include/dialog.jsp"%>
<meta name="decorator" content="default" />
<style type="text/css">

#main {
	padding: 0;
	margin: 0;
}

#main .container-fluid {
	padding: 0 7px 0 10px;
}

#header {
	margin: 0 0 10px;
	position: static;
}

#header li {
	font-size: 14px;
	_font-size: 12px;
}

#header .brand {
	font-family: Helvetica, Georgia, Arial, sans-serif, 黑体;
	font-size: 20px;
	padding-left: 33px;
	height:50px;
	background-color:black;
	color:white;
	width:100%;
}

#footer {
	margin: 8px 0 0 0;
	padding: 3px 0 0 0;
	font-size: 11px;
	text-align: center;
	border-top: 2px solid #0663A2;
}

#footer,#footer a {
	color: #999;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#menu a.menu").click(function() {
			$("#menu li.menu").removeClass("active");
			$(this).parent().addClass("active");
			if (!$("#openClose").hasClass("close")) {
				$("#openClose").click();
			}
		});
	});
</script>
</head>
<body>
	<div id="main">
		<div id="header" class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="brand">
				<img alt="影信通文化商城管理系统" src="${ctxStatic}/images/yingxt.jpg"/>
				${fns:getConfig('productName')}<br/>
				<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				管理员：admin  &nbsp;&nbsp;<a href="login.jsp" style="color:white;">[退出系统]</a></label>
				</div>
				
			</div>
		</div>
		<div class="container-fluid">
			<div id="content" class="row-fluid">
				<div id="left">
					<iframe id="menuFrame" name="menuFrame"
						src="views/modules/menuTree.jsp" style="overflow: visible;"
						scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
				</div>
				<div id="openClose" class="close">&nbsp;</div>
				<div id="right">
					<iframe id="mainFrame" name="mainFrame" src=""
						style="overflow: visible;" scrolling="yes" frameborder="no"
						width="100%" height="650"></iframe>
				</div>
			</div>
			<div id="footer" class="row-fluid">
				Copyright &copy; All rights reserved. 建新科技 版权所有&copy;&nbsp;&nbsp;&nbsp;&nbsp;地址：北京海淀区上地信息产业基地上地四街1号
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var leftWidth = "160"; // 左侧窗口大小
		function wSize() {
			var minHeight = 500, minWidth = 980;
			var strs = getWindowSize().toString().split(",");
			$("#menuFrame, #mainFrame, #openClose").height(
					(strs[0] < minHeight ? minHeight : strs[0])
							- $("#header").height() - $("#footer").height()
							- 32);
			$("#openClose").height($("#openClose").height() - 5);
			if (strs[1] < minWidth) {
				$("#main").css("width", minWidth - 10);
				$("html,body").css({
					"overflow" : "auto",
					"overflow-x" : "auto",
					"overflow-y" : "auto"
				});
			} else {
				$("#main").css("width", "auto");
				$("html,body").css({
					"overflow" : "hidden",
					"overflow-x" : "hidden",
					"overflow-y" : "hidden"
				});
			}
			$("#right").width(
					$("#content").width() - $("#left").width()
							- $("#openClose").width() - 5);
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>