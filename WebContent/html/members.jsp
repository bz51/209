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
<title>NJUPT Bigger-Members</title>
</head>
<s:debug></s:debug>
<body>
	<h1>教师</h1>
	<hr>
	
	<!-- 教师框子 -->
	<div>
		<!-- 每一个教师框子 -->
		<s:iterator value="list" id="entity">
			<s:if test="#entity.role==2">
				<a href="members/membersAction!getMemberById?id=<s:property value="#entity.id"/>">
					<div style="float:left;width: 200px;height:270px;border-style:solid;border-width:1px;margin-left: 10px;">
						<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:200px;">
						<span style="margin: 10px;"><s:property value="#entity.name"/></span> <br>
						<span style="margin: 10px;"><s:property value="#entity.degree"/></span>
						<span style="margin: 10px;"><s:property value="#entity.name"/></span>
						<span style="margin: 10px;"><s:property value="#entity.age"/></span>
					</div>
				</a>
			</s:if>
		</s:iterator>
	</div>
	
	
	<h1 style="clear:both;margin-top:20px;">硕士</h1>
	<hr>
	<!-- 硕士框子 -->
	<div>
		<!-- 每一个硕士框子 -->
		<s:iterator value="list" id="entity">
			<s:if test="#entity.role==1">
				<a href="members/membersAction!getMemberById?id=<s:property value="#entity.id"/>">
					<div style="float:left;width: 200px;height:270px;border-style:solid;border-width:1px;margin-left: 10px;">
						<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:200px;">
						<span style="margin: 10px;"><s:property value="#entity.name"/></span> <br>
						<span style="margin: 10px;"><s:property value="#entity.school"/></span>
						<span style="margin: 10px;"><s:property value="#entity.grade"/></span>
						<span style="margin: 10px;"><s:property value="#entity.age"/></span>
					</div>
				</a>
			</s:if>
		</s:iterator>
	</div>
	
	
	<h1 style="clear:both;margin-top:20px;">本科生</h1>
	<hr>
	<!-- 本科生框子 -->
	<div>
		<!-- 每一个本科生框子 -->
		<s:iterator value="list" id="entity">
			<s:if test="#entity.role==0">
				<a href="members/membersAction!getMemberById?id=<s:property value="#entity.id"/>">
					<div style="float:left;width: 200px;height:270px;border-style:solid;border-width:1px;margin-left: 10px;">
						<img alt="头像" src="images/chenxg.jpg" style="width: 200px;height:200px;">
						<span style="margin: 10px;"><s:property value="#entity.name"/></span> <br>
						<span style="margin: 10px;"><s:property value="#entity.school"/></span>
						<span style="margin: 10px;"><s:property value="#entity.grade"/></span>
						<span style="margin: 10px;"><s:property value="#entity.age"/></span>
					</div>
				</a>
			</s:if>
		</s:iterator>
	</div>
	
</body>
</html>