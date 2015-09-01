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

    <title>209Crew</title>
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
    
      <div class="container" style="margin-top: 70px;width:960px;">
      
<%
		ProjectEntity e = (ProjectEntity)request.getAttribute("projectEntity");
	%>
  
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h1 class="panel-title" style="text-align: left;"><%=e.getName()%></h1>
            </div>
            <div class="panel-body" style="text-align: left;">
            <%
			String backgrounds = e.getBackground();
			String[] str = backgrounds.split("#");
			for(String s : str){
		%>
			<p style="text-indent:2em;"><%=s %></p>
		<%} %>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>
  
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h1 class="panel-title" style="text-align: left;">系统架构</h1>
            </div>
            <div class="panel-body" style="text-align: left;">
            	<img src="<%=e.getStructure()%>">
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>
  
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h1 class="panel-title" style="text-align: left;">合作方</h1>
            </div>
            <div class="panel-body" style="text-align: left;">
            	<img src="<%=e.getLogo()%>">
            	<h5><%=e.getPartner() %></h5>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>
  
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h1 class="panel-title" style="text-align: left;">时间</h1>
            </div>
            <div class="panel-body" style="text-align: left;">
            	<%=e.getStart_time()%> - <%=e.getEnd_time()%>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>
      
        
        

      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

