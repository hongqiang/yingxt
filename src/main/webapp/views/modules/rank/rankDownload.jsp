<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
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
function a(data) {
	$("#movieOrSort").val(data.foo);
	$("tr:last").clone().insertAfter($("tr:last"));
	var i= parseInt($("tr:last td:first").text());
	$("tr:last td:first").text(i+1);
	page(1,20);
 }
$(document).ready(function() {
	$("#selectAll").click(function() {
		$('td input[type=checkbox]').prop('checked', $(this).prop('checked'));
	});

	$("#btnQuery").click(function() {
		$.ajax({ url: "${serverUrl}/test/query1?callback=a",
			dataType: "jsonp", 
			success: function (data) {
        	},
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
// 	            alert(errorThrown);
	        }
		});
		return false;
	});
	$("#btnQuery").click();
	page(1,20);
	$("#btnAdd").click(function(){
		$.jBox.open("get:${ctxView}/rank/addMovie.jsp",null,500,380,{ buttons:{"提交":"ok", "取消":true, "关闭":true}, submit:function(v, h, f){
			if (v=="ok"){
		    	$.jBox.tip("正在保存数据...", 'loading');
        		var select = h.find("#selectType2").val();
        		alert(select);
        		window.setTimeout(function () { $.jBox.tip('保存成功。', 'success'); }, 500);
		    	return true;
			} else if (v=="clear"){
				alert("clear");
				return false;
            }
		}, 
		loaded:function(h){
	
		},
		bottomText:"",showClose:false});
	});
	$("#btnDelete").click(function(){
		var select = $("td input[type=checkbox][name=select]:checked").length;
		if(select==0){
			$.jBox.error("请先选择要删除的项目。",null);
			return;
		}
		top.$.jBox.confirm("<label style='font-size:15px;'>确定删除选中的 "+select+"个节目？</label>",null, function (v, h, f) {
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
		var html = "<div style='padding:10px;'>下载次数：<input type='text' id='sortInput' name='sortInput'/></div>";
		var submit = function (v, h, f) {
		    if (f.sortInput == '') {
		        $.jBox.tip("请输入下载次数。", 'error', { focusId: "sortInput" }); 
		        return false;
		    }
		    $.jBox.tip("修改成功" + f.sortInput);
		    return true;
		};
		$.jBox(html, { title: null, submit: submit});
	});

	$("[id^=delete]").click(function(){
		$.jBox.tip("正在删除...", 'loading');
		window.setTimeout(function () { jBox.tip("删除成功", 'info');}, 1000);
    	return true;
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
		data:{pageSize:s,pageNo:n,count:$("tbody tr").length},
		success: function (data) {
			$(".pagination").html(data);
    	},
	});
}
</script>
</head>
<body>
	<form:form id="searchForm" action="#" class="breadcrumb form-search">
		<div>
			<label>搜索条件:</label> <select id="select" name="select">
				<option value="0">全部</option>
				<option value="1">置顶</option>
				<option value="2">未置顶</option>
			</select> 
			<select id="select" name="select">
				<option value="0">全部</option>
				<option value="1">节目名称</option>
				<option value="2">分类名称</option>
			</select> <input type="text" id="movieOrSort" value="" name="movieOrSort" /> <input
				id="btnQuery" class="btn btn-primary" type="submit" value="查询"
				/> &nbsp;
				<input id="btnAdd" class="btn btn-primary" type="button" value="增加节目" />
		<input id="pageNo" name="pageNo" type="hidden" />
		<input id="pageSize" name="pageSize" type="hidden"/>
		<input id="orderBy" name="orderBy" type="hidden"/>
		</div>
	</form:form>
<%-- 	<tags:message content="${message}" /> --%>
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th class="sort loginName">节目名称</th>
				<th class="sort name">分类名称</th>
				<th>下载次数</th>
				<th>排序</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="2" step="1" var="i">
				<tr>
					<td>${i}</td>
					<td id="programName">爸爸去哪儿</td>
					<td>电影</td>
					<td>10201</td>
					<td>1</td>
					<td>
						 <a id="modify${i}" href="#" class="operation">修改下载次数</a>&nbsp;&nbsp;
						 <a id="delete${i}"  href="#" class="operation">删除</a>&nbsp;&nbsp;
						 <a id="top${i}" href="#" class="operation">置顶</a>&nbsp;&nbsp;
						 <a id="sort${i}" href="#" class="operation">排序</a> &nbsp;&nbsp;
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">
	</div>
</body>
</html>