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
	$("[id^=modify]").click(function(){
		var html = "<div style='padding:10px;'>正确的关键词：<input type='text' id='sortInput' name='sortInput'/></div>";
		var submit = function (v, h, f) {
		    if (f.sortInput == '') {
		        $.jBox.tip("请输入正确的关键词。", 'error'); 
		        return false;
		    }
		    $.jBox.tip("修改成功" + f.sortInput);
		    return true;
		};
		$.jBox(html, { title: null, submit: submit});
	});
	$("[id^=enable]").click(function(){
		if($(this).text()=="有效"){
			$.jBox.tip("正在处理...", 'loading');
			window.setTimeout(function () { jBox.tip("成功设置为有效", 'info');}, 1000);
			$(this).text("无效");
		}
		else{
			$.jBox.tip("正在处理...", 'loading');
			window.setTimeout(function () { jBox.tip("成功设置为无效", 'info');alert($(this));}, 1000);
			$(this).text("有效");
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
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>规范前的关键词</th>
				<th>搜索时间</th>
				<th>搜索方式</th>
				<th>搜索来源</th>
				<th>操作</th>
				<th>关键词</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="12" step="1" var="i">
				<tr>
					<td>${i}</td>
					<td>鸡谢公敌</td>
					<td>2013-10-01</td>
					<td>手动录入</td>
					<td>搜索来源</td>
					<td><a id="enable${i}" href="#" class="operation">有效</a>&nbsp;&nbsp;
					 <a id="modify${i}" href="#" class="operation">规范关键词</a></td>
					<td>机械公敌</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">
	</div>
</body>
</html>