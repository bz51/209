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
<title>NJUPT Bigger</title>
</head>
<body>

<div>
	<a>首页</a>
	<a href="members/membersAction!getMembers">成员</a>
	<a href="project/projectAction!getProjects">项目</a>
	<a href="members/membersAction!getAllProjects">创建成员</a>
	<a href="html/addProject.jsp">创建项目</a>
</div>

<h1>团队概况</h1>
LAMDA隶属于 计算机软件新技术国家重点实验室 和 南京大学计算机科学与技术系. LAMDA 位于南京大学仙林校区计算机科学技术楼, 总部在910室，负责人是 周志华 教授.
" LAMDA" 的含义是 "Learning And Mining from DatA". LAMDA 的主要研究兴趣包括机器学习、数据挖掘、模式识别、信息检索、演化计算、神经计算，以及相关的其他领域. 目前的主要研究内容包括：集成学习、半监督与主动学习、多示例与多标记学习、代价敏感和类别不平衡学习、度量学习、降维与特征选择、结构学习与聚类、演化计算的理论基础、增强可理解性、基于内容的图像检索、 Web 搜索与挖掘、人脸识别、 计算机辅助医疗诊断、生物信息学等. LAMDA 的 成员包括教师、工作人员、学生、访问学者和进修教师. 若您希望申请国内访问学者或进修教师，请与南京大学人事处联系；如果您希望申请博士后，请与周志华教授联系; 如果您希望在 LAMDA 攻读博士或硕士学位，请在前一年的五月左右阅读 这个网页 并根据要求提供必要的申请材料，请注意，所有申请者都要经过提前面试（面试程序相同，最终结果取决于您与导师的双向选择）； 如果您希望在 LAMDA 做本科毕业论文 ( 限南京大学本校生 ) ，请通过 Email 与具体的 LAMDA 全职 教师成员 联系. 

<h1>项目</h1>
<ul>
	<li>项目一</li>
	<li>项目二</li>
	<li>项目一</li>
	<li>项目二</li>
</ul>

<h1>成员</h1>
<ul>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
	<li>成员一</li>
</ul>
<s:debug></s:debug>
</body>
</html>