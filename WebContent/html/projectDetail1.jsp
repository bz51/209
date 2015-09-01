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
		ProjectEntity e = (ProjectEntity)request.getAttribute("projectEntity");
	%>
		<h1><%=e.getName()%></h1>
		<span><%=e.getStart_time()%>-<%=e.getEnd_time()%></span>
		<hr>
	
		<span><%=e.getBackground()%></span>	
		
		<h1>项目架构</h1>
		<hr>
		<%=e.getStructure()%>
		<img alt="项目架构图" src="<%=e.getStructure()%>">
		
		<h1>合作方</h1>
		<hr>
		<%=e.getLogo()%>
		<img alt="logo" src="<%=e.getLogo()%>">
		
		<h1>参与者</h1>
		<hr>
		<%
			List<MembersEntity> list = e.getList();
			for(MembersEntity m : list){
				if(m.getRole()==2){
		%>	
				<a href="members/membersAction!getMemberById?id=<%=m.getId()%>">
					<div style="width: 200px;height:270px;border-style:solid;border-width:1px;margin-left: 10px;display:inline;display:-moz-inline-box;display:inline-block">
						<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:200px;">
						<span style="margin: 10px;"><%=m.getName()%></span> <br>
						<span style="margin: 10px;"><%=m.getDegree()%></span>
						<span style="margin: 10px;"><%=m.getName()%></span>
						<span style="margin: 10px;"><%=m.getAge()%></span>
					</div>
				</a>
			<%
				}else{
			%>
				<a href="members/membersAction!getMemberById?id=<s:property value="#m.id"/>">
					<div style="width: 200px;height:270px;border-style:solid;border-width:1px;margin-left: 10px;display:inline;display:-moz-inline-box;display:inline-block">
						<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:200px;">
						<span style="margin: 10px;"><%=m.getName()%></span> <br>
						<span style="margin: 10px;"><%=m.getSchool()%></span>
						<span style="margin: 10px;"><%=m.getGrade()%></span>
						<span style="margin: 10px;"><%=m.getAge()%></span>
					</div>
				</a>
		<%
				}
			}
		%>
	</div>
</body>
</html>