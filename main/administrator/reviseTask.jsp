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
    <title>修改任务信息</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/yonghu.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/Deng.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f3f3f3;
        }
        h1 {
            text-align: center;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #f4f4f4;
            padding: 20px;
            border: 8px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
        }
        label {
            display: block;
            margin-bottom: 10px;
            text-align: center; /* 让标签文字居中 */
            font-size: 18px; /* 调整标签文字大小 */
        }
        input[type="text"],
        input[type="date"],
        input[type="submit"] {
            width: calc(100% - 20px);
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            font-size: 16px; /* 调整字体大小 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .submit-btn {
            font-family: Arial, sans-serif;
            display: block;
            margin-bottom: 10px;
            width: 91%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #4caf50;
            color: white;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
        }

        .submit-btn:hover {
            background-color: #45a049;
        }



    </style>
</head>

<body>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String label = request.getParameter("label");
    String score = request.getParameter("score");
    String des = request.getParameter("des");
    if (des.equals("null")) {
        des = "暂无";
    }
%>
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
        <form action="<%=request.getContextPath()%>/main/admin/TaskServlet" method="post" accept-charset="UTF-8">

            <label for="ID">任务ID</label>
            <input type="text" id="ID" name="id" value=<%=id%> readonly> <br><br>

            <label for="Taskname">任务名称</label>
            <input type="text" id="Taskname" name="taskName" value=<%=name%> > <br><br>

            <label for="l">组别</label>
            <input type="text" id="l" name="label" value=<%=label%> readonly> <br><br>

            <label for="p">分数</label>
            <input type="text" id="p" name="score" value=<%=score%> > <br><br>

            <label for="h">任务描述</label>
            <input type="text" id="h" name="des" value=<%=des%> > <br><br>

            <input type="submit" value="提交">

            <a class="submit-btn" href="taskManagement.jsp" >返回</a>

        </form>


    </div>
</div>

</body>
</html>