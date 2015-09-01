<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.nupt.entity.ProjectEntity" %> 
    <%@ page import="java.util.List" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  <base href="<%=basePath%>"> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Starter Template for Bootstrap</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
   <!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<head>
<base href="<%=basePath%>"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建成员</title>
</head>
<body>

	<form action="members/membersAction!addMember" enctype="multipart/form-data" method="post">
		名字：<input type="text" name="memberEntity.name" /> <br>
		角色：<select name="memberEntity.role">  
  				<option value ="0">本科生</option>  
  				<option value ="1">硕士</option>  
  				<option value="2">教师</option>  
			</select>   <br>
		头像：<input type="file" name="file"> <br>
		年龄：<input type="text" name="memberEntity.age" /> <br>
		年级：<input type="text" name="memberEntity.grade" /> <br>
		学校：<input type="text" name="memberEntity.school" /> <br>
		学位：<input type="text" name="memberEntity.degree" /> <br>
		技能：<textarea rows="5" cols="20" name="memberEntity.skills"></textarea> <br>
		邮件：<input type="text" name="memberEntity.mail" /> <br>
		梦想：<textarea rows="5" cols="20" name="memberEntity.dreams"></textarea> <br>
		座右铭：<textarea rows="5" cols="20" name="memberEntity.motto"></textarea> <br>
		项目：<textarea rows="5" cols="20" name="memberEntity.project"></textarea> <br>
		实验室项目：
		<!-- 加载系统中所有实验室项目，让学生选择， -->
		<%
			List<ProjectEntity> list = (List)request.getAttribute("list_project");
			for(ProjectEntity e : list){
		%>
			<input name="in_project" type="checkbox" value="<%=e.getId() %>" /><%=e.getName() %>
		<%}%>
			
		<!-- <input type="hidden" name="memberEntity.id" value="1" /> -->
		<input type="submit" value="提交">
	</form>
	
	
  <form class="form-horizontal">
    <fieldset>
      <div id="legend" class="">
        <legend class="">表单名</legend>
      </div>
    

    

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">名字</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Select Basic -->
          <label class="control-label">学历</label>
          <div class="controls">
            <select class="input-xlarge">
      <option>本科生</option>
      <option>研究生</option></select>
          </div>

        </div>

    </fieldset>
  </form>
<s:debug></s:debug>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>