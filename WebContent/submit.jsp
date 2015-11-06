<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/input.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function submitReq(){
	var val = document.getElementById("provinceName").value;
	
	if (typeof(val) == "undefined" || val.length == 0){
		$("#provinceName").addClass("inputEmpty");
		return false;
	}
	$.ajax({
		url: "/springMVC_study/test/getShortName",
		data: {'name':val},
		type: "post",
		dataType: "text",
		success: function(data) {
			/*  $("#shortName").val(data);*/
			$("#shortName").html(data);
		},
		error: function(xhr) {
			alert("请输入正确的省份");
		}
	});
}

function removeCss(){
	$("#provinceName").removeClass("inputEmpty");
}
</script>
</head>
<body>
	<div style="left:30px;top:30px;">
		<form name="userForm" action="">
			省份：<input type="text" id="provinceName" onkeyup="removeCss()">
			简称：<span id="shortName" style="color: red;font-weight: bolder;" title="shortName"></span>
			<br>
			<input type="button" value="提交"  onclick="submitReq()">
		</form>
	</div>
</body>
</html>