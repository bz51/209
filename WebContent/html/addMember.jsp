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

    <title>Resume</title>
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

<%
	String role = request.getParameter("role");
	if("teacher".equals(role)){
%>

      <form id="teacherForm" action="members/membersAction!addMember" enctype="multipart/form-data" method="post" class="form-signin" style="width:500px;margin-left: auto;margin-right: auto;">
        <h2 class="form-signin-heading">添加教师</h2>
        	<input type="text" name="memberEntity.name" style="margin-top:10px;" class="form-control" placeholder="姓名" required autofocus onblur="isEmpty(this);">
        	
        	<input type="number" name="memberEntity.age" style="margin-top:10px;" class="form-control" placeholder="年龄（如：35）" required  onblur="isEmpty(this);">
        	
        	<input type="text" name="memberEntity.school" style="margin-top:10px;" class="form-control" placeholder="单位（如：南京邮电大学）" required onblur="isEmpty(this);">
        	
        	<input type="text" name="memberEntity.degree" style="margin-top:10px;" class="form-control" placeholder="学位（如：博士）" required onblur="isEmpty(this);">
        	
        	<input type="email" name="memberEntity.mail" style="margin-top:10px;" class="form-control" placeholder="邮件" required onblur="isEmpty(this);">
        	
        	<textarea rows="5"  name="memberEntity.skills" style="margin-top:10px;" class="form-control" placeholder="个人简介（每段用＃分隔）" required onblur="isEmpty(this);"></textarea>
        	
        	<textarea rows="5"  name="memberEntity.dreams" style="margin-top:10px;" class="form-control" placeholder="Selected Publications（每段用＃分隔）" required onblur="isEmpty(this);"></textarea>
        	
        	<textarea rows="5"  name="memberEntity.motto" style="margin-top:10px;" class="form-control" placeholder="Awards & Honors（每段用＃分隔）" required onblur="isEmpty(this);"></textarea>
        	
        	<textarea rows="5" name="memberEntity.project" style="margin-top:10px;" class="form-control" placeholder="研究方向（每项用＃分隔）" required onblur="isEmpty(this);"></textarea>
        	
			<hr>
			<label style="float:left;margin-top:18px;">选择头像：</label>
			<input id="headPic" type="file" name="file" class="form-control" style="width:300px;margin-top:10px;margin-left:-110px;display:inline;display:-moz-inline-box;display:inline-block;text-align: left;">
			<hr>
        	
        	<input type="hidden" name="memberEntity.role" value="2" />
        	
        	<a class="btn btn-lg btn-primary btn-block" onclick="my()">确认</a>
      </form>
      
     
     <script type="text/javascript">
     	var array = new Array(9);
     	for(var i=0;i<9;i++){
     		array[i] = false;
     	}
     	
     	function isEmpty(obj){
     		if(obj.value==""){
     			obj.value = "不能为空！";
     			if(obj.name == "memberEntity.name")
     				array[0] = false;
     			else if(obj.name == "memberEntity.age")
     				array[1] = false;
     			else if(obj.name == "memberEntity.school")
     				array[2] = false;
     			else if(obj.name == "memberEntity.degree")
     				array[3] = false;
     			else if(obj.name == "memberEntity.mail")
     				array[4] = false;
     			else if(obj.name == "memberEntity.skills")
     				array[5] = false;
     			else if(obj.name == "memberEntity.dreams")
     				array[6] = false;
     			else if(obj.name == "memberEntity.motto")
     				array[7] = false;
     			else if(obj.name == "memberEntity.project")
     				array[8] = false;
     		}else{
     			if(obj.name == "memberEntity.name")
     				array[0] = true;
     			else if(obj.name == "memberEntity.age")
     				array[1] = true;
     			else if(obj.name == "memberEntity.school")
     				array[2] = true;
     			else if(obj.name == "memberEntity.degree")
     				array[3] = true;
     			else if(obj.name == "memberEntity.mail")
     				array[4] = true;
     			else if(obj.name == "memberEntity.skills")
     				array[5] = true;
     			else if(obj.name == "memberEntity.dreams")
     				array[6] = true;
     			else if(obj.name == "memberEntity.motto")
     				array[7] = true;
     			else if(obj.name == "memberEntity.project")
     				array[8] = true;
     		}
     	}
     	
     	function my(){
     		alert("执行了第yi个my");
     		//判断text都是否填好
     		for(var i=0;i<9;i++){
     			if(array[i] == false){
     				alert(i+"还没填完哦");
     				return;
     			}
     		}
     		//判断file是否填好
     		if(document.getElementById("headPic").value==""){
     			alert("还没选择头像哦～");
     			return;
     		}
     		document.getElementById("teacherForm").submit();
     	}
     </script>
      
      
      
<%}else if("student".equals(role)){ %>

      <form id="studentForm" action="members/membersAction!addMember" enctype="multipart/form-data" method="post" class="form-signin" style="width:500px;margin-left: auto;margin-right: auto;">
        <h2 class="form-signin-heading">添加成员</h2>
        	<input type="text" name="memberEntity.name" style="margin-top:10px;" class="form-control" placeholder="姓名" required autofocus onblur="isEmpty(this);">
        	
        	<input type="text" name="memberEntity.age" style="margin-top:10px;" class="form-control" placeholder="年龄（如：21）" required onblur="isEmpty(this);">
        	
        	<input type="text" name="memberEntity.grade" style="margin-top:10px;" class="form-control" placeholder="年级（如：大三）" required onblur="isEmpty(this);">
        	
        	<input type="text" name="memberEntity.school" style="margin-top:10px;" class="form-control" placeholder="学校（如：南京邮电大学）" required onblur="isEmpty(this);">
        	
        	<input type="text" name="memberEntity.degree" style="margin-top:10px;" class="form-control" placeholder="学位（如：学士/硕士/博士）" required onblur="isEmpty(this);">
        	
        	<input type="email" name="memberEntity.mail" style="margin-top:10px;" class="form-control" placeholder="邮件" required onblur="isEmpty(this);">
        	
        	<textarea rows="5"  name="memberEntity.skills" style="margin-top:10px;" class="form-control" placeholder="技能（每一项技能用＃分隔，如：精通Java语言、C++＃熟练掌握MySql数据库、Oracle数据库＃熟练掌握Java并发编程）" required onblur="isEmpty(this);"></textarea>
        	
        	<textarea rows="5"  name="memberEntity.dreams" style="margin-top:10px;" class="form-control" placeholder="Dreams（若有多个，用＃分开）" required onblur="isEmpty(this);"></textarea>
        	
        	<textarea rows="5"  name="memberEntity.motto" style="margin-top:10px;" class="form-control" placeholder="Motto" required onblur="isEmpty(this);"></textarea>
        	
        	<hr>
        	<h3 style="text-align: left;">项目经验：</h3>
        	<div class="checkbox" style="margin-top:10px;text-align: left;">
        	<!-- 加载系统中所有实验室项目，让学生选择， -->
        	
		<%
			List<ProjectEntity> list = (List)request.getAttribute("list_project");
			for(ProjectEntity e : list){
		%>
			<label>
				<input name="in_project" type="checkbox"  value="<%=e.getId() %>" /><%=e.getName() %>
			</label>
		<%}%>
			
		<!-- <input type="hidden" name="memberEntity.id" value="1" /> -->
        	</div>
        	
        	<textarea rows="5" name="memberEntity.project" style="margin-top:10px;" class="form-control" placeholder="其他项目经历（每项用＃隔开如：2015年3月－7月，参加项目“远程教学实验平台”，参与XXX模块的开发＃2014年1月－7月，参加项目“xxxxxx”，参与XXX模块的开发）" required></textarea>
        	
        	<hr>
        	<label style="float:left;margin-top:18px;">选择身份：</label>
        	<select name="memberEntity.role" class="form-control" style="width:300px;margin-top:10px;margin-left:-110px;display:inline;display:-moz-inline-box;display:inline-block;text-align: left;" onblur="isEmpty(this);">  
  				<option value ="0">本科生</option>  
  				<option value ="1">研究生</option>  
			</select>
			
			<hr>
			<label style="float:left;margin-top:18px;">选择头像：</label>
			<input id="headPic" type="file" name="file" class="form-control" style="width:300px;margin-top:10px;margin-left:-110px;display:inline;display:-moz-inline-box;display:inline-block;text-align: left;">
			<hr>
        	
        	<a class="btn btn-lg btn-primary btn-block" onclick="my()">确认</a>
      </form>
      
       <script type="text/javascript">
     	var array = new Array(9);
     	for(var i=0;i<9;i++){
     		array[i] = false;
     	}
     	
     	function isEmpty(obj){
     		if(obj.value==""){
     			obj.value = "不能为空！";
     			if(obj.name == "memberEntity.name")
     				array[0] = false;
     			else if(obj.name == "memberEntity.age")
     				array[1] = false;
     			else if(obj.name == "memberEntity.grade")
     				array[2] = false;
     			else if(obj.name == "memberEntity.school")
     				array[3] = false;
     			else if(obj.name == "memberEntity.degree")
     				array[4] = false;
     			else if(obj.name == "memberEntity.mail")
     				array[5] = false;
     			else if(obj.name == "memberEntity.skills")
     				array[6] = false;
     			else if(obj.name == "memberEntity.dreams")
     				array[7] = false;
     			else if(obj.name == "memberEntity.motto")
     				array[8] = false;
     		}else{
     			if(obj.name == "memberEntity.name")
     				array[0] = true;
     			else if(obj.name == "memberEntity.age")
     				array[1] = true;
     			else if(obj.name == "memberEntity.grade")
     				array[2] = true;
     			else if(obj.name == "memberEntity.school")
     				array[3] = true;
     			else if(obj.name == "memberEntity.degree")
     				array[4] = true;
     			else if(obj.name == "memberEntity.mail")
     				array[5] = true;
     			else if(obj.name == "memberEntity.skills")
     				array[6] = true;
     			else if(obj.name == "memberEntity.dreams")
     				array[7] = true;
     			else if(obj.name == "memberEntity.motto")
     				array[8] = true;
     		}
     	}
     	
     	function my(){
     		//判断text都是否填好
     		for(var i=0;i<9;i++){
     			if(array[i] == false){
     				alert(i+"还没填完哦");
     				return;
     			}
     		}
     		//判断file是否填好
     		if(document.getElementById("headPic").value==""){
     			alert("还没选择头像哦～");
     			return;
     		}
     		document.getElementById("studentForm").submit();
     	}
     </script>
<%} %>


    </div><!-- /.container -->


	<!-- <a>首页</a>
	<a href="members/membersAction!getAllProjects">创建成员</a>
	<a href="html/addProject.jsp">创建项目</a> -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

