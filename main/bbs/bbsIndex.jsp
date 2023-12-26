<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Post" %><%--
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bbs-indexstyle.css">
</head>
<%
    List<Post> posts = (List<Post>) request.getAttribute("posts");
%>
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
<div class="main-container">
    <div class="cover-title">
        <div class="mask">
            <span class="bbs-title">嵙论坛</span>
            <span class="bbs-description">山科众包嵙论坛为用户提供一个互相交流、探讨和解答问题的空间。不论你是初学者还是资深专家，都能在这里找到探讨图片标注领域的机会，结识志同道合的伙伴。</span>
            <span style="margin-left:3%;font-weight: bold">公告：如果您有任何发布任务的需求，请<a style="color: #087DCE;" href="mailto:anhengyu1@gmail.com">点击这里联系管理员</a></span>
            <div class="bbs-status">
                <span>帖子：<%=posts.size()%></span>
                <a href="#" id="scrollToBottom">发帖</a>
            </div>
        </div>
    </div>
    <div class="post-area">
        <% for(Post post : posts) { %>
        <div class="post-preview">
            <a href="<%=request.getContextPath()%>/main/bbs/singlePage?postId=<%=post.getPostId()%>">
                <div class="title-preview"><%=post.getTitle()%></div>
                <div class="content-preview"><%=post.getPostContent()%></div>
                <div class="status-preview">
                    <span style="margin-right: auto;">发帖人：<%=post.getUsername()%></span>
                    <span style="margin-left: auto;">发帖时间：<%=post.getPostTime()%></span>
                </div>
            </a>
        </div>
        <% } %>
        <div class="post-editor">
            <form action="<%=request.getContextPath()%>/main/bbs/newPost" method="post">
                <input type="text" name="title-content" id="title-content" placeholder="请填写标题" required>
                <textarea name="post-content" id="post-content" cols="30" rows="10" placeholder="在这里编辑帖子内容" style="width: 100%" required></textarea>
                <input type="submit" value="发表">
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