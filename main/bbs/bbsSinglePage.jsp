<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Response" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="pojo.Post" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/12/6
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>山科众包论坛</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/userspace-style2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bbs-singlepagestyle.css">
</head>
<%
    int maxFloor = 2;
    Object tmp_responses = request.getAttribute("responses");
    Post post = (Post) request.getAttribute("post");
    User head = (User) request.getAttribute("head");
    Map<Response, User> responses = new HashMap<>();
    if(tmp_responses != null ) {
        responses = (Map<Response, User>) tmp_responses;
        maxFloor += responses.size();
    }
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
<div class="main-container">
    <div class="sp-post-area">
        <div class="first-floor">
            <div class="first-floor-top">
            <span><%=post.getTitle()%></span> <a id="scrollToBottom" href="#">回复</a>
            </div>
            <div class="response-post">
                <div class="user-info">
                    <div class="user-cover">
                        <img src="<%=head.getHeadPath()%>" alt="">
                    </div>
                    <span><%=head.getUsername()%></span>
                </div>
                <div class="post-text">
                    <div class="post-text-content">
                        <%=post.getPostContent()%>
                    </div>
                    <div class="status-text">
                        <span class="floor">1楼</span>
                        <span class="time"><%=post.getPostTime()%></span>
                    </div>
                </div>
            </div>
        </div>
        <%
            for(Map.Entry<Response, User> entry : responses.entrySet()){%>
        <div class="response-post">
            <div class="user-info">
                <div class="user-cover">
                    <img src="<%=entry.getValue().getHeadPath()%>" alt="">
                </div>
                <span><%=entry.getValue().getUsername()%></span>
            </div>
            <div class="post-text">
                <div class="post-text-content">
                    <%=entry.getKey().getPostContent()%>
                </div>
                <div class="status-text">
                    <span class="floor"><%=entry.getKey().getFloor()%>楼</span>
                    <span class="time"><%=entry.getKey().getPostTime()%></span>
                </div>
            </div>
        </div>
        <%}%>
        <div class="post-editor">
            <form action="<%=request.getContextPath()%>/main/bbs/response?postId=<%=post.getPostId()%>&floor=<%=maxFloor%>&username=<%=(String)session.getAttribute("username")%>" method="post">
                <textarea name="post-content" id="post-content" cols="30" rows="10" placeholder="在这里编辑回复内容" style="width: 100%"></textarea>
                <input type="submit" value="回复">
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    document.getElementById('scrollToBottom').addEventListener('click', function() {
        event.preventDefault();
        window.scrollTo(0, document.body.scrollHeight);
    });
</script>