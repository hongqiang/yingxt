<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<%@include file="/views/include/dialog.jsp"%>
<link href="${ctxStatic}/select2/select2.css" rel="stylesheet"/>
<script src="${ctxStatic}/select2/select2.min.js"></script>

<style type="text/css">
.center_middle{
	width:100px;
	text-align:center;
	vertical-align:middle;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#selectType2").change(function(){
	});
	$("#selectType2").select2({
		placeholder: "请选择节目",
// 		allowClear: true,
// 		data:[{id:0,text:'enhancement'},{id:1,text:'bug'},{id:2,text:'duplicate'},{id:3,text:'invalid'},{id:4,text:'wontfix'}]
	});
});

</script>
</head>
<body>
	<div id="addDialog">
		<form id="addForm" action="#" method="post" enctype="multipart/form-data"
			style="padding-left:20px;padding-right:20px;padding-bottom:0px;text-align:center;"><br/>
			<table class="table table-bordered">
				<tbody>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">节目名称</td>
							<td>
<!-- 							<input type="hidden" id="selectType"></input> -->
								<select id="selectType2" name="selectType2" style="width:200px;">
								<option></option>
								<c:forEach begin="1" end="10" var="i">
								<option value="${i}" >节目名称${i}</option>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">节目编码</td>
							<td><input  type="text"  placeholder="" value="" /></td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">分类编码</td>
							<td><input type="text"  placeholder="" value="" /></td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">观看次数</td>
							<td><input type="text"  placeholder="" value="" /></td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">排序</td>
							<td><input type="text" value="" style="width:50px"/></td>
						</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>