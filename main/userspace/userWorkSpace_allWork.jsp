<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Task" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/12/6
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>工作台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/userspace-style2.css">
</head>
<body>
<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
%>
<script>
    function updateProgressBar(id, progress) {
        const progressBar = document.querySelector("#bar-" + id);
        const progressText = document.querySelector("#text-" + id);
        let progressStatus = Math.min(progress, 100);
        progressStatus = progressStatus.toFixed(2).toString() + "%";
        progressBar.style.width = progressStatus;
        progressText.textContent = progressStatus;
    }
</script>
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
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/allTask" style="background-color:#087DCE;color: white;">我的任务</a>
    </div>
    <div class="tasks-content">
        <%
            if(tasks == null || tasks.isEmpty()){
        %>
        <script>
            const tasksContent = document.querySelector(".tasks-content");
            tasksContent.style.justifyContent = "center";
        </script>
        <img id="empty-logo" src="<%=request.getContextPath()%>/static/images/empty.png" alt="">
        <p style="color:darkgray">当前暂无数据</p>
        <%
            }
        %>
        <%
            for (Task task:tasks) {
        %>
        <div class="task-area">
            <div class="task-cover">
                <img src="<%=task.getCoverPath()%>" alt="No Cover">
            </div>
            <div class="task-description">
                <div class="task-top-bar">
                    <h2><%=task.getTaskName()%></h2>
                    <div class="progress">
                        <div class="progress-bar" id="bar-<%=task.getTaskId()%>" style="width: 0%;">
                            <span class="progress-text" id="text-<%=task.getTaskId()%>">0%</span>
                        </div>
                    </div>
                </div>
                <span style="color:#087DCE;font-weight: 600;">奖励积分：<%=task.getAwardScore()%></span>
                <p><%=task.getDescription()%></p>
                <%
                    if(!task.isSubmitted() && task.getNumOfLabeled() < task.getNumOfProblems()){
                %>
                <div class="button-container">
                    <a href="<%=request.getContextPath()%>/main/userspace/userspaceAllImage?taskId=<%=task.getTaskId()%>&labelColumn=<%=task.getLabelColumn()%>" class="task-button">进入任务</a>
                </div>
                <%
                    } else if (!task.isSubmitted() && (task.getNumOfProblems() == task.getNumOfLabeled())) {

                %>
                <div class="button-container">
                    <a href="<%=request.getContextPath()%>/main/userspace/submitTask?taskId=<%=task.getTaskId()%>&taskName=<%=task.getTaskName()%>" class="task-button">提交任务</a>
                </div>
                <%
                    } else if(task.isSubmitted()) {
                %>
                <div class="button-container">
                    <a class="task-button" style="box-shadow: 0 0 0;background-color: #087DCE;color:white;">已提交</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <script>
            updateProgressBar("<%=task.getTaskId()%>", (<%=task.getNumOfLabeled()+ 1e-6%> * 100/<%=task.getNumOfProblems() + 1e-7%>));

        </script>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
