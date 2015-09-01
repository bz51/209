<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.nupt.entity.MembersEntity" %> 
    <%@ page import="com.nupt.entity.ProjectEntity" %> 
    <%@ page import="java.util.List" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

    <title>209Crew-Project</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
   <!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </head>

  <body style="text-align: center;">

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">209Crew</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a id="homes" href="javascript:void">Home</a></li>
            <li><a id="projects" href="javascript:void">Projects</a></li>
            <li><a id="members" href="javascript:void">Members</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>


	 
<div class="container"style="margin-top: 80px;">

      <form id="projectForm" action="project/projectAction!addProject" enctype="multipart/form-data" method="post" class="form-signin" style="width:500px;margin-left: auto;margin-right: auto;">
        <h2 class="form-signin-heading">创建项目</h2>
        	<input type="text" name="projectEntity.name" style="margin-top:10px;" class="form-control" placeholder="项目名称" required autofocus onblur="isEmpty(this);">
        	
        	<textarea rows="5" name="projectEntity.background" style="margin-top:10px;" class="form-control" placeholder="项目介绍" required onblur="isEmpty(this);"></textarea>
        	
        	<input type="text" name="projectEntity.start_time" style="margin-top:10px;" class="form-control" placeholder="开始时间" required autofocus onblur="isEmpty(this);">
        	
        	<input type="text" name="projectEntity.end_time" style="margin-top:10px;" class="form-control" placeholder="结束时间" required autofocus onblur="isEmpty(this);">
        	
        	<input type="text" name="projectEntity.partner" style="margin-top:10px;" class="form-control" placeholder="合作方" required autofocus onblur="isEmpty(this);">
			
			<hr>
			
			<label style="float:left;margin-top:18px;">项目缩略图：</label>
			<input id="pic" type="file" name="file" class="form-control" style="width:300px;margin-top:10px;margin-left:-110px;display:inline;display:-moz-inline-box;display:inline-block;text-align: left;">
			<hr>
        	
			<label style="float:left;margin-top:18px;">项目架构图：</label>
			<input id="structure" type="file" name="file" class="form-control" style="width:300px;margin-top:10px;margin-left:-110px;display:inline;display:-moz-inline-box;display:inline-block;text-align: left;">
			<hr>
			
        	<label style="float:left;margin-top:18px;">合作方logo：</label>
			<input id="logo" type="file" name="file" class="form-control" style="width:300px;margin-top:10px;margin-left:-110px;display:inline;display:-moz-inline-box;display:inline-block;text-align: left;">
			<hr>
        	
        	<a class="btn btn-lg btn-primary btn-block" onclick="my()">确认</a>
      </form>

 <script type="text/javascript">
     	var array = new Array(5);
     	for(var i=0;i<5;i++){
     		array[i] = false;
     	}
     	
     	function isEmpty(obj){
     		if(obj.value==""){
     			obj.value = "不能为空！";
     			if(obj.name == "projectEntity.name")
     				array[0] = false;
     			else if(obj.name == "projectEntity.background")
     				array[1] = false;
     			else if(obj.name == "projectEntity.start_time")
     				array[2] = false;
     			else if(obj.name == "projectEntity.end_time")
     				array[3] = false;
     			else if(obj.name == "projectEntity.partner")
     				array[4] = false;
     		}else{
     			if(obj.name == "projectEntity.name")
     				array[0] = true;
     			else if(obj.name == "projectEntity.background")
     				array[1] = true;
     			else if(obj.name == "projectEntity.start_time")
     				array[2] = true;
     			else if(obj.name == "projectEntity.end_time")
     				array[3] = true;
     			else if(obj.name == "projectEntity.partner")
     				array[4] = true;
     		}
     	}
     	
     	function my(){
     		//判断text都是否填好
     		for(var i=0;i<5;i++){
     			if(array[i] == false){
     				alert(i+"还没填完哦");
     				return;
     			}
     		}
     		//判断pic是否填好
     		if(document.getElementById("pic").value==""){
     			alert("还没选择缩略图哦～");
     			return;
     		}
     		//判断structure是否填好
     		if(document.getElementById("structure").value==""){
     			alert("还没选择系统架构图哦～");
     			return;
     		}
     		//判断logo是否填好
     		if(document.getElementById("logo").value==""){
     			alert("还没选择系统架构图哦～");
     			return;
     		}
     		document.getElementById("projectForm").submit();
     	}
     </script>

      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->


	<a>首页</a>
	<a href="members/membersAction!getAllProjects">创建成员</a>
	<a href="html/addProject.jsp">创建项目</a>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

