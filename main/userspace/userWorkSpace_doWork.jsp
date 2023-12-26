<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Image" %><%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/12/6
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>任务</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/userspace-doworkstyle.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userspace-previewimagestyle.css">
</head>
<body>
<%
    List<Image> images = (List<Image>)session.getAttribute("allImages");
    int taskId = (int)session.getAttribute("taskId");
%>
<div class="top-bar">
    <div class="top-bar-logo">
        <a  href="<%=request.getContextPath()%>/mall/AllTask"><img id="logo" src="<%=request.getContextPath()%>/static/images/logo.jpg" alt="" ></a>
        <a id="logo-text" href="<%=request.getContextPath()%>/mall/AllTask">山科众包</a>
    </div>
    <div class="top-bar-btn">
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/mall/AllTask">任务广场</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning.jsp">嵙学院</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/bbs/allPosts">嵙论坛</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/shoppingMall/IndexPreview">积分商城</a>
    </div>
    <div class="top-bar-right">
        <div class="drop-menu">
            <div class="top-bar-account">
                <span><%=request.getSession().getAttribute("username")%></span>
                <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/curTask">工作台</a></div>
                <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/userInfo">个人中心</a></div>
                <div class="drop"><a href="<%=request.getContextPath()%>/account/exit">退出账户</a></div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="side-bar">
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userspaceAllImage?taskId=${taskId}" style="background-color: #087DCE;color:white;">所有图像</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userspaceUnlabeled?taskId=${taskId}">未标注</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userspaceLabeled?taskId=${taskId}">已标注</a>
    </div>

    <div class="tasks-content">
        <div class="preview-all">
            <%
                int cnt = 0;
                for(Image image:images) {
            %>
            <div class="img-preview-all">
                <img id="img-preivew-<%=image.getImageId()%>" src="<%=image.getImagePath()%>" alt="">
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
