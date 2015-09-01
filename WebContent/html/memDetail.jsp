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

    <title>209Crew-<s:property value="memberEntity.name"/></title>
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
    
    
      <div class="container" style="margin-top: 10px;width:960px;">
      
<!-- <nav class="navbar navbar-default"> -->
       	<table class="table table-hover table-bordered" style="width:500px;margin-left: auto;margin-right: auto;margin-top:70px;vertical-align: middle;">
	<tbody>
		<tr>
			<td rowspan="5"><img style="width:150px;height:200px;" src="<s:property value="memberEntity.pic"/>" class="img-thumbnail" alt=""></td>
			<td height="20%">姓名</td>
			<td><s:property value="memberEntity.name"/></td>
		</tr>
		<tr>
			<td height="20%">年龄</td>
			<td><s:property value="memberEntity.age"/>岁</td>
		</tr>
		<tr>
			<s:if test="memberEntity.role==2">
				<td height="20%">单位</td>
			</s:if>
			<s:else>
				<td height="20%">学校</td>
			</s:else>
			<td><s:property value="memberEntity.school"/></td>
		</tr>
		<tr>
		
			<td height="20%">学历</td>
			<td><s:property value="memberEntity.degree"/></td>
		</tr>
		<tr>
			<td height="20%">邮件</td>
			<td><s:property value="memberEntity.mail"/></td>
		</tr>
	</tbody>
</table>
    <!--  </nav>  -->

  
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
            <s:if test="memberEntity.role==2">
				<h3 class="panel-title" style="text-align: left;">Resume</h3>
			</s:if>
			<s:else>
				<h3 class="panel-title" style="text-align: left;">Skills</h3>
			</s:else>
            </div>
            <div class="panel-body" style="text-align: left;">
              <%
			MembersEntity entity = (MembersEntity)request.getAttribute("memberEntity");
			String skills = entity.getSkills();
			String[] str = skills.split("#");
			if(entity.getRole()==2){
			for(String s : str){
		%>
					<p style="text-indent:2em;"><%=s %></p>
		<%}}else{
			for(String s : str){%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%}} %>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>
      
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title" style="text-align: left;">Projects</h3>
            </div>
            <div class="panel-body" style="text-align: left;">
              
				<!-- 参与项目｛ -->
				<%
			List<ProjectEntity> list = entity.getList();
			for(ProjectEntity e : list){
		%>
		<div style="float:left;clear:left;padding: 10px;">
			<a href="project/projectAction!getProjectById?id=<%=e.getId()%>"><img src="<%=e.getPic() %>" style="float:left;width: 200px;hight:70px;"></a>
			<div style="float:left;">
				<a href="project/projectAction!getProjectById?id=<%=e.getId()%>" style="float:left;margin-left:20px;margin-top:17px;font-size:16px;"><%=e.getName() %></a>
				<%
					String str1 = e.getBackground();
					if(str1!=null && str1.length()>48)
						str1 = str1.substring(0, 42)+"……";
				%>
				<div style="float:left;clear:left;margin-left:20px;margin-top:10px;margin-right:20px;"><%=str1%></div>
				<div style="float:left;clear:left;margin-left:20px;margin-top:10px;color:#949494;"><%=e.getStart_time() %></div>
			</div>
			<hr style="float:left;">
		</div>
			<!-- 一个项目块 -->
			<%--
			<div style="float:left;clear: left;margin-top:10px;">
			<img src="images/project1.png" class="" alt="" style="float:left;width: 200px;hight:70px;">
			 <table style="float:left;margin-top:10px;display:inline;display:-moz-inline-box;display:inline-block;">
				<tr>
					<td style="padding: 10px;border:solid 1px #E4E4E4;">项目名称</td>
					<td style="padding: 10px;border:solid 1px #E4E4E4;"><%=e.getName() %></td>
				</tr>
				<tr>
					<td style="padding: 10px;border:solid 1px #E4E4E4;">项目背景</td>
					<td style="padding: 10px;border:solid 1px #E4E4E4;"><%=e.getBackground()%></td>
				</tr>
				<tr>
					<td style="padding: 10px;border:solid 1px #E4E4E4;">项目时间</td>
					<td style="padding: 10px;border:solid 1px #E4E4E4;"><%=e.getStart_time()%></td>
				</tr>
			</table> 
			
			<a style="margin-left: 20px;margin-top: 100px;"><%=e.getName() %></a>
     	 	</div>
     	 	--%>
			
		<%}%>
			<!-- ｝参与项目 -->


            </div>
          </div>
        </div><!-- /.col-sm-4 -->
        </div>
      
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
            <s:if test="memberEntity.role==2">
				<h3 class="panel-title" style="text-align: left;">Research Interests</h3>
			</s:if>
			<s:else>
				<h3 class="panel-title" style="text-align: left;">Experience</h3>
			</s:else>
            </div>
            <div class="panel-body" style="text-align: left;">
              <%
			String other_project = entity.getProject();
			str = other_project.split("#");
			for(String s : str){
		%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%} %>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
        </div>
      
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
            <s:if test="memberEntity.role==2">
				<h3 class="panel-title" style="text-align: left;">Selected Publications</h3>
			</s:if>
			<s:else>
				<h3 class="panel-title" style="text-align: left;">Dreams</h3>
			</s:else>
            </div>
            <div class="panel-body" style="text-align: left;">
              <%
			String dreams = entity.getDreams();
			str = dreams.split("#");
			for(String s : str){
		%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%} %>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
        </div>
      
		<div class="row">
        <div class="col-sm-1000">
          <div class="panel panel-info">
            <div class="panel-heading">
            <s:if test="memberEntity.role==2">
				<h3 class="panel-title" style="text-align: left;">Awards & Honors</h3>
				 </div>
            <div class="panel-body" style="text-align: left;">
            	 <%
			String mottos = entity.getMotto();
			str = mottos.split("#");
			for(String s : str){
		%>
			<ul>
				<li><%=s %></li>
			</ul>
		<%} %>
            </div>
			</s:if>
			<s:else>
				<h3 class="panel-title" style="text-align: left;">Motto</h3>
				</div>
            <div class="panel-body" style="text-align: left;">
            	<%=entity.getMotto() %>
            </div>
			</s:else>
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

