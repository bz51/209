<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.nupt.entity.MembersEntity" %> 
    <%@ page import="com.nupt.entity.ProjectEntity" %> 
    <%@ page import="java.util.List" %> 
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
<title>NJUPT Bigger-Projects</title>
</head>
<s:debug></s:debug>
<body>
	
	<div style="width:960px;margin-left: auto;margin-right: auto;border: 1px solid;">
	<%
		List<ProjectEntity> list = (List)request.getAttribute("list");
		for(ProjectEntity e : list){
	%>
		<!-- 每一个项目{ -->
		<a href="project/projectAction!getProjectById?id=<%=e.getId()%>">
		<div style="width:940px;margin-left:10px;margin-right:10px;margin-top:10px;border: 1px solid;">
			<img alt="项目简介" src="images/chenxg.jpg" style="width: 200px;height:200px;margin-left: 10px;">
			<table border="1px" style="margin-left:40px;max-width:600px;display:inline;display:-moz-inline-box;display:inline-block">
							<tr>
								<th>项目</th>
								<th><%=e.getName()%></th>
							</tr>
							<tr>
								<th>合作方</th>
								<th><%=e.getPartner()%></th>
							</tr>
							<tr>
								<th>时间</th>
								<th><%=e.getStart_time()%>-<%=e.getEnd_time()%></th>
							</tr>
							<tr>
								<th>简介</th>
								<th><%=e.getBackground()%></th>
							</tr>
						</table>
		</div>
		</a>
		<!-- }每一个项目 -->
	<%}%>
	</div>
</body>
</html>