<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="service.UserService" %>
<%@ page import="JDBCUtil.UserJDBC" %><%--
  Created by IntelliJ IDEA.
  User: 邓
  Date: 2023/12/8
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <title>添加新图片</title>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/yonghu.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/Deng.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f3f3f3;
      margin: 0;
      padding: 0;
    }

    .container2 {
      width: 60%;
      margin-left: 17%;
      /*margin: 50px auto;*/
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-top: 1%;
    }

    h1 {
      text-align: center;
      color: #333;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 8px;
      color: #555;
      /*text-align: center;*/
    }

    input[type="text"],
    input[type="number"],
    input[type="file"],
    textarea {
      width: calc(100% - 20px);
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-bottom: 15px;
    }

    input[type="submit"],
    .returnButton {
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      background-color: #4caf50;
      color: #fff;
      text-decoration: none;
      cursor: pointer;
      text-align: center;
    }

    input[type="submit"]:hover,
    .returnButton:hover {
      background-color: #45a049;
    }

    .returnButton {
      margin-top: 10px;
      background-color: #087dce;
    }

    .returnButton:hover {
      background-color: #087dce;
    }
  </style>

</head>

<body>

<!--头部边框,logo、User-->
<div class="toubu">
  <%--    山科众包logo--%>
  <div style="display: flex;position: relative; ">

    <a href="<%=request.getContextPath()%>/index.jsp">
      <img style="margin-left:1%;margin-top:1%;width:100%;height:100%;" src="<%=request.getContextPath()%>/static/images/logo.jpg" alt="logo" >
    </a>

    <div class="logo-text" >
      <a style="text-decoration: none;" href="<%=request.getContextPath()%>/index.jsp"> 山 科 众 包</a>
    </div>
  </div>

  <!-- 用户头像和下拉菜单 -->
  <div class="user-profile" id="userProfile">
    <%
      User user1 = (User) session.getAttribute("user");
    %>

    <div class="username" style=" margin-top: 25%;margin-left: 5%">
      <%=user1.getUsername()%>
    </div>
    <!-- 退出按钮和个人中心 -->
    <div class="dropdown-content" id="dropdownContent" style="margin-top: 15%">
      <div style="margin-top: 10px;">
        <a style="text-decoration: none;" href="<%=request.getContextPath()%>/main/userspace/userInfo"><i class="fas fa-user"></i> 个人中心</a>
      </div>
      <div style="margin-top: 10px;">
        <a style="text-decoration: none;" href="<%=request.getContextPath()%>/account/exit"><i class="fas fa-sign-out-alt"></i> 退出</a>
      </div>
    </div>
  </div>

</div>

<%--左侧导航栏和右边的内容--%>
<div class="containers">
  <div class="container">
    <div class="leftList"><i class="fas fa-user"></i><a href="<%=request.getContextPath()%>/main/administrator/userManagement.jsp">    用户管理</a></div>
    <div class="leftList"><i class="fas fa-tasks"></i><a href="<%=request.getContextPath()%>/main/administrator/taskManagement.jsp">    任务管理</a></div>
    <div class="leftList"><i class="far fa-image"></i><a href="<%=request.getContextPath()%>/main/administrator/imageManagement.jsp">    图片管理</a></div>
    <div class="leftList"><i class="fas fa-chart-bar"></i><a href="<%=request.getContextPath()%>/main/administrator/resultManagement.jsp">    标注管理</a></div>
    <div class="leftList"><i class="fas fa-cog"></i><a href="<%=request.getContextPath()%>/main/administrator/systemConfiguration.jsp">    日志管理</a></div>
  </div>

  <div class="youxia">
      <div class="container2">


        <h1>添加新图片</h1>
        <form action="<%=request.getContextPath()%>/main/admin/AddNewImg" method="post">
        <label for="imageId">图片 ID:</label>
        <input type="text" id="imageId" name="imageId" required>

        <label for="taskId">任务 ID:</label>
        <input type="text" id="taskId" name="taskId" value="<%=request.getParameter("taskId")%>" readonly>

        <label for="imagePath">图片路径:</label>
        <input type="text" id="imagePath" name="imagePath" required>

        <input type="submit" value="提交">
        <a href="showImageResult.jsp?taskId=<%=request.getParameter("taskId")%>" class="returnButton">返回</a>
        </form>

      </div>

  </div>
</div>

</body>
</html>