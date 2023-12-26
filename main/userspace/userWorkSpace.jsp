<%@ page import="pojo.Task" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/12/6
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工作台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/userspace-style.css">
</head>
<body>
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
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/curTask">待做任务</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/allTask">我的任务</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userWorkSpace_allWork.jsp">按钮3</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userWorkSpace_allWork.jsp">按钮4</a>
    </div>

    <div class="task-content">
        <img id="empty-logo" src="<%=request.getContextPath()%>/static/images/empty.png" alt=""><br>
        <p style="color:darkgray">当前暂无数据</p>
    </div>
</div>
</body>
</html>
