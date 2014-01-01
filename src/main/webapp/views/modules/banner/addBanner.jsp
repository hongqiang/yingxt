<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
<%@include file="/views/include/dialog.jsp"%>
<style type="text/css">
.center_middle{
	width:100px;
	text-align:center;
	vertical-align:middle;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	$("#selectType").change(function(){
		if($("#selectType").val()=='1'){
			$("#urlLabel").hide();
			$("#url").hide();
		}
		else{
			$("#urlLabel").show();
			$("#url").show();
		}
	});
	$("#selectType").change();
});

</script>
</head>
<body>
	<div id="addDialog">

		<form id="addForm" action="#" method="post" enctype="multipart/form-data"
			style="padding-left:20px;padding-right:20px;padding-bottom:20px;text-align:center;"><br/>

			<table class="table table-bordered">
				<tbody>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">类型</td>
							<td>
							<select id="selectType" name="selectType" style="width:100px" onchange="">
								<option value="1" >影音节目</option>
								<option value="2" >网址</option></select>
								<label id="urlLabel">&nbsp;&nbsp;输入网址链接：</label>
								<input id="url" type="text"  placeholder="" value="" />
							</td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">节目名称</td>
							<td><input id="movieName" type="text"  placeholder="" value="" /></td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">图片上传</td>
							<td><input id="uploadFile" name="file" type="file" /></td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">图片尺寸</td>
							<td><input type="text" value="" style="width:30px"/>&nbsp;X&nbsp;<input type="text" value="" style="width:30px"/>
							&nbsp;宽 X 高（像素）
							</td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">排序</td>
							<td><input type="text" value="" style="width:50px"/></td>
						</tr>
						<tr>
							<td style="width:100px;	text-align:center; vertical-align:middle;">预览</td>
							<td style="height:100px"><input type="text"  placeholder="输入" value="" />
							<label>注：该预览图框尺寸为640X270像素</label></td>
						</tr>
				</tbody>
			</table>
		</form>
	</div>
	
</body>
</html>