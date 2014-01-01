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
	$("#selectAll").click(function() {
		$('td input[type=checkbox]').prop('checked', $(this).prop('checked'));
	});
	page(1,20);
	$("#btnAdd").click(function(){
		$.jBox.open("get:addBanner.jsp",null,700,500,{ buttons:{"提交":"ok", "取消":true, "关闭":true}, submit:function(v, h, f){
			if (v=="ok"){
		    	$.jBox.tip("正在保存数据...", 'loading');
        		var movieName =h.find("#movieName").val();
        		alert(movieName);
        		window.setTimeout(function () { $.jBox.tip('保存成功。', 'success'); }, 500);
		    	return true;
			} else if (v=="clear"){
				alert("clear");
				return false;
            }
		}, 
		loaded:function(h){
// 			$(".jbox-content", top.document).css("overflow-y","hidden");
		},
		bottomText:"",showClose:false});
	});
	$("#btnDelete").click(function(){
		var select = $("td input[type=checkbox][name=select]:checked").length;
		if(select==0){
			$.jBox.error("请先选择要删除的关键词。",null);
			return;
		}
		top.$.jBox.confirm("<label style='font-size:15px;'>确定删除选中的 "+select+"个关键词？</label>",null, function (v, h, f) {
		    if (v == 'ok'){
		    	$.jBox.tip("正在删除数据...", 'loading');
        		// 模拟2秒后完成操作
        		window.setTimeout(function () { jBox.tip("删除成功", 'info');}, 1000);
		    	return true;
		    }
		    return true; //close
		});
	});
	$("[id^=sort]").click(function(){
		var html = "<div style='padding:10px;'>排序：<input type='text' id='sortInput' name='sortInput'/></div>";
		var submit = function (v, h, f) {
		    if (f.sortInput == '') {
		        $.jBox.tip("请输入排序值。", 'error', { focusId: "sortInput" }); 
		        return false;
		    }
		    $.jBox.tip("设置排序成功" + f.sortInput);
		    return true;
		};
		$.jBox(html, { title: null, submit: submit});
	});
	$("[id^=modify]").click(function(){
		var html = "<div style='padding:10px;'>搜索次数：<input type='text' id='sortInput' name='sortInput'/></div>";
		var submit = function (v, h, f) {
		    if (f.sortInput == '') {
		        $.jBox.tip("请输入搜索次数。", 'error', { focusId: "sortInput" }); 
		        return false;
		    }
		    $.jBox.tip("修改成功" + f.sortInput);
		    return true;
		};
		$.jBox(html, { title: null, submit: submit});
	});
	$("[id^=top]").click(function(){
		if($(this).text()=="置顶"){
			$.jBox.tip("正在处理...", 'loading');
			window.setTimeout(function () { jBox.tip("置顶成功", 'info');}, 1000);
			$(this).text("取消置顶");
		}
		else{
			$.jBox.tip("正在处理...", 'loading');
			window.setTimeout(function () { jBox.tip("取消置顶成功", 'info');}, 1000);
			$(this).text("置顶");
		}
		return true;
	});
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
	<form:form id="searchForm" action="#" class="breadcrumb form-search">
		<div>
			<input id="btnDelete" class="btn btn-primary" type="button" value="删除" /> &nbsp;
			<input id="btnAdd" class="btn btn-primary" type="button" value="增加节目" />
		</div>
	</form:form>
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>选择</th>
				<th>节目名称</th>
				<th>发布日期</th>
				<th>排序</th>
				<th>操作</th>
				<th>操作人员</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="12" step="1" var="i">
				<tr>
					<td>${i}</td>
					<td><input type="checkbox" name="select" /></td>
					<td>大本营</td>
					<td>2013-09-03</td>
					<td>1</td>
					<td> <a id="sort${i}" href="#" class="operation">排序</a> &nbsp;&nbsp;
					 <a id="modify${i}" href="#" class="operation">修改</a></td>
					<td>admin</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="checkbox" id="selectAll"/>全选
	<div class="pagination">
	</div>
</body>
</html>