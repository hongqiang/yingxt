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
.center_middle{
	width:100px;
	text-align:center;
	vertical-align:middle;
}
</style>
<script type="text/javascript">
function a(data) {
	$("#programName").val(data.foo);
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
	top.$.jBox.getBox().find("#selectType").change(function(){
		alert("aaaa");
	});
	$("#btnQuery").click();
	page(1,20);
	$("#btnAdd").click(function(){
		top.$.jBox.open("get:${ctxView}/banner/addBanner.jsp",null,700,500,{ buttons:{"提交":"ok", "取消":true, "关闭":true}, submit:function(v, h, f){
			if (v=="ok"){
		    	$.jBox.tip("正在保存数据...", 'loading');
        		var selectType = h.find("#selectType").val();
        		var movieName =h.find("#movieName").val();
        		alert(selectType+",,"+movieName);
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
        		window.setTimeout(function () { jBox.tip("删除成功", 'info');}, 1000);
		    	return true;
		    }
		    return true; 
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
		top.$.jBox.open("get:${ctxView}/banner/addBanner.jsp",null,700,500,{ buttons:{"修改":"ok", "取消":true, "关闭":true}, submit:function(v, h, f){
			if (v=="ok"){
        		var selectType = h.find("#selectType").val();
        		var movieName =h.find("#movieName").val();
        		$.jBox.tip("正在保存数据..."+selectType+","+movieName, 'loading');
        		window.setTimeout(function () { $.jBox.tip('修改成功。', 'success'); }, 500);
		    	return true;
			}
		}, 
		loaded:function(h){
		},
		bottomText:"",showClose:false});
	});

});
function page(n,s){
	$("#pageNo").val(n);
	$("#pageSize").val(s);
	$.ajax({ url: "${pageUrl}",
		dataType: "text",
		data:{pageSize:s,pageNo:n,count:$("#contentTable tbody tr").length},
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
			<label>搜索类型:</label> <select id="select" name="select">
				<option value="1">节目名称</option>
			</select> <input type="text" id="programName" value="" name="programName" /> <input
				id="btnQuery" class="btn btn-primary" type="submit" value="查询"
				/> &nbsp;<input id="btnDelete"
				class="btn btn-primary" type="button" value="删除" /> &nbsp;
				<input id="btnAdd" class="btn btn-primary" type="button" value="增加" />
		<input id="pageNo" name="pageNo" type="hidden" />
		<input id="pageSize" name="pageSize" type="hidden"/>
		<input id="orderBy" name="orderBy" type="hidden"/>
		</div>
	</form:form>
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>选择</th>
				<th class="sort loginName">节目名称</th>
				<th class="sort name">类型</th>
				<th>发布日期</th>
				<th>链接地址</th>
				<th>排序</th>
				<th>操作</th>
				<th>操作人员</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="2" step="1" var="i">
				<tr>
					<td>${i}</td>
					<td><input type="checkbox" name="select" /></td>
					<td id="programName">爸爸去哪儿</td>
					<td>影音节目</td>
					<td>2013-9-02</td>
					<td>http://xxxxxxxxxx/xx/sfdsf.html</td>
					<td>1</td>
					<td><a href="#" class="operation">预览</a>
					 <a id="sort${i}" href="#" class="operation">排序</a> 
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