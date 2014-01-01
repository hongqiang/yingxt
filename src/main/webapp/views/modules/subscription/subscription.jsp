<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<%@ page language="java"
	import="com.jianxin.yingxt.web.common.servlet.Page"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<%@include file="/views/include/dialog.jsp"%>
<style type="text/css">
.operation {
	color: red;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	page(1,20);
	$("#editBtn").click(function(){
		$(this).hide();
		$("#submitBtn").show();
		$("#cancelBtn").show();
	});
	$("#cancelBtn").click(function(){
		$(this).hide();
		$("#submitBtn").hide();
		$("#editBtn").show();
	});
	$("#submitBtn").click(function(){
		$(this).hide();
		$("#cancelBtn").hide();
		$("#editBtn").show();
	});
	$("#submitBtn").hide();
	$("#cancelBtn").hide();
});
function page(n,s){
	$.ajax({ url: "${pageUrl}",
		dataType: "text",
		data:{pageSize:s,pageNo:n,count:$("#contentTable tbody tr").length},
		success: function (data) {
			$(".pagination").html(data);
    	},
        error: function (XMLHttpRequest, textStatus, errorThrown) {
//	            alert(errorThrown);
        }
	});
}
</script>
</head>
<body>
	<div style="width:600px;float:left;">
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed" >
			<thead>
				<tr>
					<th>分类名称</th>
					<th>选择</th>
					<th>排序</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="12" step="1" var="i">
					<tr>
						<td>电影</td>
						<td><input type="checkbox" name="select" /></td>
						<td>1</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
		</div>
	</div>
	<div style="margin-left:20px;float:left;" >
		<input type="button" id="editBtn" value="编辑" class="btn btn-primary"/>
		<input type="button" id="submitBtn" value="完成" class="btn btn-primary"/>&nbsp;&nbsp;
		<input type="button" id="cancelBtn" value="取消" class="btn btn-primary"/>
		<table class="table table-bordered" style="width:200px;">
			<tbody>
				<tr><td>最小订阅数</td></tr>
				<tr><td>2</td></tr>
				<tr><td>最大订阅数</td></tr>
				<tr><td>8</td></tr>
			</tbody>
		</table>
	</div>
</body>
</html>