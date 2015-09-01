<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建项目</title>
</head>
<body>

	<form action="project/projectAction!addProject" enctype="multipart/form-data" method="post">
		项目名称：<input type="text" name="projectEntity.name" /> <br>
		项目缩略图：<input type="file" name="file"> <br>
		背景介绍：<textarea rows="5" cols="20" name="projectEntity.background"></textarea> <br>
		系统架构图：<input type="file" name="file"> <br>
		合作方：<input type="text" name="projectEntity.partner" /> <br>
		合作方logo：<input type="file" name="file"> <br>
		开始时间：<input type="text" name="projectEntity.start_time" /> <br>
		结束时间：<input type="text" name="projectEntity.end_time" /> <br>
		<!-- <input type="hidden" name="projectEntity.id" value="5" /> -->
		<input type="submit" value="提交">
	</form>
	
<s:debug></s:debug>
</body>
</html>