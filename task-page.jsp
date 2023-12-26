<%@ page import="pojo.Task" %>
<%@ page import="java.util.Objects" %>
<%@ page import="pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/MainMall.css">
    <title>task</title>
</head>
<body>
<div style="margin:0 ;background-color:RGB(244,245,247);width:100%;height:100%">

    <div class="main-head layout">
        <div class="main-left layout">
            <a href="<%=request.getContextPath()%>/mall/AllTask">
                <img class="zhongbao-head left-horizon" src="<%=request.getContextPath()%>/static/images/img/山科众包.png" alt="logo">
            </a>

            <a class="top-bar-tag" href="<%=request.getContextPath()%>/mall/AllTask">任务广场</a>
            <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning.jsp">嵙学院</a>
            <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/bbs/allPosts">嵙论坛</a>
            <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/shoppingMall/IndexPreview">积分商城</a>

        </div>
        <div class="main-right layout" style="display: flex">

            <a class="top-bar-tag"href="<%=request.getContextPath()%>/main/userspace/allTask">工作台</a>

            <div class="drop-menu">
                <div class="top-bar-account">
                    <span style="font-size:2vw;height:10vh"><%=request.getSession().getAttribute("username")%></span>
                    <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/curTask">工作台</a></div>
                    <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/userInfo">个人中心</a></div>
                    <div class="drop"><a href="<%=request.getContextPath()%>/account/exit">退出账户</a></div>
                </div>
            </div>

        </div>
    </div>
    <div >
        <div class="task_bk " style="background-image:url('<%=request.getContextPath()%>/static/images/img/task-bk.png'); background-size: cover;">
            <div class="task-css">
                <div class="exchange-pages" style="display:flex ;font-size:2vh;height:2vh;">
                    <a href="<%=request.getContextPath()%>/mall/AllTask" style="color:white;text-decoration:none;" >任务主页</a>/<div>当前任务</div>
                </div>
                <div id="task-name" style="margin-top:2vh;font-size:3vh;font-weight:bold;">
                    <%=((Task)session.getAttribute("nowproduct")).getTaskName() %>
                </div>
                <div class="task-info" style="display:flex;">
                    <div>
                        <div class="task-info-font">任务积分：</div>
                        <div class="task-info-font"><%=((Task)session.getAttribute("nowproduct")).getAwardScore()%></div>
                    </div>
                    <div style="margin-left:200px">
                        <div class="task-info-font">距离结束：</div>
                        <div class="task-info-font task-status" >长期</div>
                    </div>
                </div>
                <div class="choose-task">
                    <div style="margin-left: 200px;margin-top:6vh;">
                        <% if(((Task)session.getAttribute("nowproduct")).getUserName().equals("null")){%>
                        <div class="task-info-font" style="font-size:6vh;"> 长期</div>
                        <%}else{%>
                        <div class="task-info-font" style="font-size:6vh;"> 已被抢</div>
                        <%}%>
                    </div>
                    <% if(((Task)session.getAttribute("nowproduct")).getUserName().equals("null")){%>
                    <button class="submit-btn task-info-font" onclick="window.location.href='<%=request.getContextPath()%>/main/mall/ChooseTask?ChoosedProductId=<%= ((Task)session.getAttribute("nowproduct")).getTaskId() %>'">申请</button>
                    <%}else{%>
                    <button class="submit-btn task-info-font" disabled style="cursor: not-allowed; " onclick="window.location.href='<%=request.getContextPath()%>/main/mall/ChooseTask?ChoosedProductId=<%= ((Task)session.getAttribute("nowproduct")).getTaskId() %>'">申请</button>
                    <%}%>

                </div>
                <div class="task-information">
                    <div style="height:1px;">

                    </div>
                    <div style="margin-left:5vh;margin-top:5vh;display: flex;font-size:3vh; ">
                        <div class="task-page-info-logo"></div>
                        <div style="margin-left: 1vw;">基本要求</div>
                    </div>
                    <div style="margin-left:5vw;display:flex;flex-wrap: wrap;">
                        <%=((Task)(request.getSession().getAttribute("nowproduct"))).getDescription()%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
