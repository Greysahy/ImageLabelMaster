<%@ page import="pojo.User" %>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userspace-style2.css">
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
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning.jsp">如何领取任务</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning_label.jsp">如何进行标注</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning_exchange.jsp" style="background-color: #087DCE;color:white;">如何赚取/兑换积分</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning_bbs.jsp">如何加入讨论</a>
    </div>
    <div class="tasks-content">
        <div class="up-area">
            <div class="video-title">
                <span class="video-title-text">如何赚取/兑换积分👇</span>
            </div>
            <video id="teach-video" width="1080" height="640" controls>
                <source src="<%=request.getContextPath()%>/static/videos/exchange.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        <div class="down-area">
            <div class="illustrate-text">
                <p>山科众包是山东科技大学校内的图片标注众包平台。该平台旨在利用众包的方式，
                    为图像处理、计算机视觉等领域提供标注数据，帮助训练和优化人工智能模型。</p>
                <p>山科众包平台为校内师生提供了一个简单、高效的方式来获取高质量的标注数据，
                    以应用于各种人工智能项目和应用场景。用户可以注册账户，接受标注任务，
                    并根据任务要求对图像进行标注，贡献自己的力量，为人工智能技术的发展做出贡献🚀。</p>
                <p>山科众包平台采用积分制度作为用户参与任务并完成标注后的奖励机制🎁。用户参与任务、完成标注后可以获得一定数量的积分。
                    这些积分可以用于兑换各种奖品，其中包括但不限于 PU 学分、礼品卡、实物奖品或者其他特权权益。</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
