<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Record" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userspace-infostyle.css">

</head>
<body>
<%
    User user = (User)request.getAttribute("user");
    List<Record> records = (List<Record>) request.getAttribute("exchangeRecords");
%>
<%!
    public String formatDate(Timestamp timestamp) {
        Date date = new Date(timestamp.getTime());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
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

<div class="container">
    <div class="up-area">
        <div class="up-area-center">
            <div class="head-area">
                <img class="head-img" src="<%=user.getHeadPath()%>" alt="">
            </div>
            <div class="username-area">
                <span style="color:white;">${user.username}</span>
            </div>
        </div>
        <div class="change-head">
            <form action="<%=request.getContextPath()%>/main/userspace/updateHeadPath" method="post" enctype="multipart/form-data">
                <input type="file" name="file" id="fileInput" style="display: none">
                <label for="fileInput" class="file-upload">选择头像</label>
                <input type="submit" value="上传">
            </form>
        </div>
    </div>
    <div class="user-info">
        <div class="info-text">
            <div class="title-area">
                <div class="stick"></div>
                <span class="info-title">用户信息</span><br>
            </div>
            <div class="text-area">
                <div class="info-row">
                    <div class="info-item">
                        <span class="item-text-front">账号ID</span>
                        <span class="item-text-back">${user.userId}</span>
                    </div>
                    <div class="info-item">
                        <span class="item-text-front">等级</span>
                        <span class="item-text-back">999</span>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-item">
                        <span class="item-text-front">手机号</span>
                        <span class="item-text-back">${user.tel}</span>
                    </div>
                    <div class="info-item">
                        <span class="item-text-front">邮箱</span>
                        <span class="item-text-back">未绑定</span>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-item">
                        <span class="item-text-front">当前积分</span>
                        <span class="item-text-back">${user.score}</span>
                    </div>
                    <div class="info-item">
                        <span class="item-text-front">所属学院</span>
                        <span class="item-text-back">${user.college}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="info-text">
            <div class="title-area">
                <div class="stick"></div>
                <span class="info-title">已兑换奖品</span><br>
            </div>
            <div class="text-area">
                <table>
                    <thead>
                    <tr>
                        <th>产品号</th>
                        <th>产品名</th>
                        <th>兑换时间</th>
                        <th>花费积分</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Record record : records) { %>
                    <tr>
                        <td><%= record.getProductId() %></td>
                        <td><%= record.getProductName() %></td>
                        <td><%= formatDate(record.getExchangeDate()) %></td>
                        <td><%= record.getScoreCost()%></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>

</script>