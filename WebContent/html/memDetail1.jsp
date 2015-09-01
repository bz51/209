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
<title>NJUPT Bigger-Members</title>
</head>
<s:debug></s:debug>
<body>
	<div style="float:center;width: 960px;margin-left: auto;margin-right: auto;border-style: solid;border-width: 1px;">
		<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:250px;margin-left: 150px;margin-top: 20px;display:inline;display:-moz-inline-box;display:inline-block">
		<table border="1px" style="margin-left:40px;width:300px;display:inline;display:-moz-inline-box;display:inline-block">
			<tr>
				<th>名字</th>
				<th><s:property value="memberEntity.name"/></th>
			</tr>
			<tr>
				<th>年龄</th>
				<th><s:property value="memberEntity.age"/></th>
			</tr>
			<tr>
				<th>学校</th>
				<th><s:property value="memberEntity.school"/></th>
			</tr>
			<tr>
				<th>学历</th>
				<th><s:property value="memberEntity.degree"/></th>
			</tr>
			<tr>
				<th>电子邮件</th>
				<th><s:property value="memberEntity.mail"/></th>
			</tr>
		</table>
	
	<!-- Skills{ -->
		<h1 style="margin-left: 20px;">Skills</h1>
		<hr>
		<%
			MembersEntity entity = (MembersEntity)request.getAttribute("memberEntity");
			String skills = entity.getSkills();
			String[] str = skills.split("#");
			for(String s : str){
		%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%} %>
	<!-- }Skills -->
	
	<!-- 参与项目{ -->
		<h1 style="margin-left: 20px;">参与项目</h1>
		<hr>
		<div>
		<%
			List<ProjectEntity> list = entity.getList();
			for(ProjectEntity e : list){
		%>
			<!-- 一个项目块 -->
				<a href="project/projectAction!getProjectById?id=<%=e.getId()%>">
					<div style="width: 940px;height:220px;border-style:solid;border-width:1px;margin-left: 10px;margin-top: 10px;'">
						<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:200px;margin-left: 10px;">
						<table border="1px" style="margin-left:40px;width:300px;display:inline;display:-moz-inline-box;display:inline-block;">
							<tr>
								<th>项目</th>
								<th><%=e.getName()%></th>
							</tr>
							<tr>
								<th>参与模块</th>
								<th><%=e.getModule()%></th>
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
			
		<%}%>
		</div>
	<!-- }参与项目 -->
	
	<!-- 个人履历{ -->
		<h1 style="margin-left: 20px;">Experience</h1>
		<hr>
		<%
			String other_project = entity.getProject();
			str = other_project.split("#");
			for(String s : str){
		%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%} %>
	<!-- }个人履历 -->
	
		
	<!-- Dreams{ -->
		<h1 style="margin-left: 20px;">My Dreams</h1>
		<hr>
		<%
			String dreams = entity.getDreams();
			str = dreams.split("#");
			for(String s : str){
		%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%} %>
	<!-- }Dreams -->
		
	<!-- Motto{ -->
		<h1 style="margin-left: 20px;">Motto</h1>
		<hr>
		<span style="margin-left:10px;"><%=entity.getMotto() %></span>
	<!-- }Motto -->
	</div>
</body>
</html>