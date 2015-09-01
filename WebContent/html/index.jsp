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
            <li><a id="contacts" href="javascript:void">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

      <div class="container" style="margin-top: 100px;">

<script type="text/javascript">
	$(document).ready(function(){
		$('#homes').click(function(){
			$("html,body").animate({scrollTop: $("#home").offset().top}, 1000);
		});
		$('#projects').click(function(){
			$("html,body").animate({scrollTop: $("#project").offset().top}, 1000);
		});
		$('#members').click(function(){
			$("html,body").animate({scrollTop: $("#member").offset().top}, 1000);
		});
		$('#contacts').click(function(){
			$("html,body").animate({scrollTop: $("#contact").offset().top}, 1000);
		});
	})
</script>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing" id="home">
   <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron" style="margin-top: -20px;">
        <h1 style="text-align: left;margin-top:0px;">209Crew</h1>
        <p style="text-align: left;">目前的主要研究内容包括：集成学习、半监督与主动学习、多示例与多标记学习、代价敏感和类别不平衡学习、度量学习、降维与特征选择、结构学习与聚类、演化计算的理论基础、增强可理解性、基于内容的图像检索、 Web 搜索与挖掘、人脸识别、 计算机辅助医疗诊断、生物信息学等. LAMDA 的 成员包括教师、工作人员、学生、访问学者和进修教师. 若您希望申请国内访问学者或进修教师，请与南京大学人事处联系；如果您希望申请博士后，请与周志华教授联系。</p>
        <!-- 
        <p>
          <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
        </p>
         -->
      </div>

      <!-- Three columns of text below the carousel -->
      
      
      
      <!-- START THE FEATURETTES -->
	
	<h1 style="text-align: left;margin-left: 100px;margin-top: 30px;" id="project">Projects</h1>
	<!-- <div id="project" class="alert alert-info" role="alert" style="padding-top:5px;padding-bottom: 5px;margin-bottom: 1px;">
        <h3 style="text-align: left;margin-left: 70px;margin-bottom: 10px;margin-top: 10px;">Projects</h3>
    </div> -->

     <!--  <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
        <hr class="featurette-divider">
      </div> -->
	
	<%
		List<ProjectEntity> list_project = (List)request.getAttribute("list_project");
		for(ProjectEntity e : list_project){
	%>
	<hr class="featurette-divider">
      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
        <a href="project/projectAction!getProjectById?id=<%=e.getId()%>" style="color:#333">
          <h2 class="featurette-heading" style="text-align: left;"><%=e.getName() %></h2>
        </a>
          <p class="lead" style="text-align: left;font-size: 16px;"><%=e.getBackground() %></p>
        </div>
        <div class="col-md-5 col-md-pull-7">
         <a href="project/projectAction!getProjectById?id=<%=e.getId()%>" style="color:#333">
          <img src="images/project1.png" class="img-thumbnail" alt="" style="width: 300px;hight:100px;">
         </a>
        </div>
      </div>
	<%
		}
	%>
      <!-- /END THE FEATURETTES -->
      
      
      
      
      
	<h1 style="text-align: left;margin-left: 100px;margin-top: 30px;" id="member">Teachers</h1>
	<hr class="featurette-divider">
	<!-- <div id="member" class="alert alert-info" role="alert" style="padding-top:5px;padding-bottom: 5px;margin-bottom: 20px;margin-top: 20px;">
        <h3 style="text-align: left;margin-left: 70px;margin-bottom: 10px;margin-top: 10px;">Teachers</h3>
    </div> -->
        
        <%
        	List<MembersEntity> list_teacher = (List)request.getAttribute("list_member");
        for(MembersEntity e : list_teacher){
        	if(e.getRole()==2){
        %>
        <div class="col-lg-4">
          <img class="img-circle" src="<%=e.getPic() %>" alt="Generic placeholder image" width="140" height="140">
          <h2><%=e.getName()%></h2>
          <p><%=e.getSchool() %><br><%=e.getDegree() %></p>
          <p><a class="btn btn-default" href="members/membersAction!getMemberById?id=<%=e.getId() %>" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <%}} %>
        
      </div><!-- /.row -->
      
	<h1 id="member" style="text-align: left;margin-left: 100px;margin-top: 30px;">Members</h1>
	<hr class="featurette-divider">
	<!-- <div id="member" class="alert alert-info" role="alert" style="padding-top:5px;padding-bottom: 5px;margin-bottom: 20px;margin-top: 20px;">
        <h3 style="text-align: left;margin-left: 70px;margin-bottom: 10px;margin-top: 10px;">Members</h3>
    </div> -->
      <div class="row">
        
        <%
        	List<MembersEntity> list_member = (List)request.getAttribute("list_member");
        for(MembersEntity e : list_member){
        	if(e.getRole()!=2){
        %>
        <div class="col-lg-4">
          <img class="img-circle" src="<%=e.getPic() %>" alt="Generic placeholder image" width="140" height="140">
          <h2><%=e.getName()%></h2>
          <p><%=e.getSchool() %><br><%=e.getDegree() %></p>
          <p><a class="btn btn-default" href="members/membersAction!getMemberById?id=<%=e.getId() %>" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <%}} %>
        
      </div><!-- /.row -->




	<!-- 论著｛ -->
	<h1 id="member" style="text-align: left;margin-left: 100px;margin-top: 30px;">Publications</h1>
	<hr class="featurette-divider">
	<div class="jumbotron" style="text-align: left; font-size: 16px;">
    	<ul>
    		<li style="line-height:200%">陈兴国, 高阳，范顺国，俞亚君. 基于核方法的连续动作Actor-Critic学习. 模式识别与人工智能. (Accepted)</li>
    		<li style="line-height:200%">陈兴国, 高阳，范顺国，俞亚君. 基于核方法的连续动作Actor-Critic学习. 中国机器学习会议(CCML), 2013.</li>
    		<li style="line-height:200%">Yujing Hu, Yang Gao, Ruili Wang, Zhaonan Sun, and Xingguo Chen. nMetaQ-an n-agent Reinforcement Learning Algorithm based on Meta Equilibrium. In Proc. Adaptive Learning AgentWorkshop in the 12th International Conference on Autonomous Agents and Multi-agent Systems (AAMAS ALA 2012), 87-94, 2012.</li>
    		<li style="line-height:200%">Hao Wang, Yang Gao, and Xingguo Chen. RL-DOT: A Reinforcement Learning NPC Team for Playing Domination Games. IEEE Transactions on Computational Intelligence and AI in Games (IEEE TCIAIG), 2(1): 17-26, 2010. (SCI) BibTeX</li>
    		<li style="line-height:200%">Xingguo Chen, Hao Wang, Weiwei Wang, Yinghuan Shi, and Yang Gao. Apply ant colony optimization to Tetris. In Proc. 11th Annual Conference on Genetic and Evolutionary Computation (GECCO). 1741-1742, Montreal, QC, Canada, 2009. (EI) BibTeX</li>
    		<li style="line-height:200%">高阳，王巍巍，陈兴国，葛屾. 关系强化学习研究：以俄罗斯方块游戏为例. 机器学习及其应用，清华大学出版社, 33-48, 2009. BibTeX</li>
    	</ul>    
    </div>
	<!-- ｝论著 -->

	<hr class="featurette-divider">
	<div class="jumbotron" style="float:left;margin-top: -20px;width:100%;" id="contact">
    	<h2 style="text-align: center;margin-top:-20px;">Contact</h2>
    	<hr style="width: 200px;border:#BCBCBC thin solid;margin-top: 0px;">
      
      	<div style="float:left;width:40%;display:inline;display:-moz-inline-box;display:inline-block;margin-top: 10px;">
      		<img src="images/locate.png" style="float:left;width:20px;margin-top: 5px;"/>
      		<span style="float:left;margin-top:5px;margin-left: 10px;">南京市文苑路9号南京邮电大学</span>
      		<img src="images/monitor.png" style="float:left;width:20px;clear:left;margin-top: 20px;"/>
      		<span style="float:left;margin-top:5px;margin-left: 10px;margin-top: 18px;">xxxxxxxx@163.com</span>
      		<img src="images/inbox.png" style="float:left;width:20px;clear:left;margin-top: 20px;"/>
      		<span style="float:left;margin-top:5px;margin-left: 10px;margin-top: 20px;">18961616161</span>
      		<img src="images/contact.png" style="float:left;width:20px;clear:left;margin-top: 20px;"/>
      		<span style="float:left;margin-top:5px;margin-left: 10px;margin-top: 20px;">联系人：奥巴马</span>
      	</div>
      
      	<div style="float:left;width:60%;margin-top: 10px;">
      		<form action="" style="float:left;margin-left: 30px;">
      			<input type="text" name="memberEntity.name" style="float:left;width:500px;" class="form-control" placeholder="您的邮箱" required autofocus>
      			<textarea rows="5"  name="memberEntity.skills" style="float:left;width:500px;margin-top:10px;" class="form-control" placeholder="您想让我们知道的事……" required></textarea>
      			<button class="btn btn-lg btn-primary btn-block" type="submit" style="float:left;width:100px;margin-top:10px;">发送</button>
      		</form>
      	</div>
         
      </div>



     <!-- FOOTER 
      <footer style="float:left;margin-left: 0px;margin-right: 0px;">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer> -->

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

