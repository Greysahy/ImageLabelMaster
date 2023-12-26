<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="service.UserService" %>
<%@ page import="JDBCUtil.UserJDBC" %>
<%@ page import="service.TaskService" %>
<%@ page import="pojo.Task" %><%--
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
    <title>管理员平台</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/yonghu.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/Deng.css">

    <style>
        /*这个是整个头部边框*/


        .pageConfig{
            margin-top: 1%;
            width: 100%;
            display: flex;
            cursor: pointer;
            /*border: 2px solid #126bff;*/
        }

        .pageConfigUp{
            width: 100%;
            cursor: pointer;
            /*border: 2px solid #126bff;*/
            /*margin-bottom: 1%;*/
            /*margin-top: 1%;*/
            /*box-shadow: 0 0 0 2px #f0f0f0;*/
            border-radius: 8px;
            text-align: center; /* 让内容水平居中 */
            font-family: Arial, sans-serif;
        }


        .pageConfig a{
            margin-left: 5%;
            display: inline-block;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 1%;
        }
        .publishButton {

            font-size: 24px; /* 设置字体大小 */
            display: inline-block; /* 让按钮元素作为块级元素显示 */
            padding: 10px 20px; /* 设定按钮内边距 */
            border: 2px solid #fff; /* 按钮边框 */
            border-radius: 5px; /* 圆角 */
            text-decoration: none; /* 去除链接下划线 */
            /*color: #333; !* 文字颜色 *!*/
            margin-top: 1%; /* 上边距约为页面高度的 30% */
            margin-bottom: 1%; /* 下边距约为页面高度的 30% */
            background-color: #3fb643;
            color: #fff; /* 设置文字颜色为白色 */.
        }

        .publishButton:hover {
            background-color: #333; /* 鼠标悬停时背景颜色 */
            color: #fff; /* 鼠标悬停时文字颜色 */
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #4cae50;
        }

        td{
            background: #f1f1f1;
        }

        a {
            display: inline-block;
            text-decoration: none;
            border-radius: 5px;
            /*border: 2px solid #126bff;*/
        }
        .file-upload {
            width: 50%;
            height: 50%;
            color: white;
            font-size: 14px;
            background-color: rgb(8, 125, 206);
            display: block;
            text-align: center;

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
            User user = (User) session.getAttribute("user");
        %>

        <div class="username" style=" margin-top: 25%;margin-left: 5%">
            <%=user.getUsername()%>
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
<%--        <div class="pageConfig1">--%>
<%--            <form action="<%=request.getContextPath()%>/main/userspace/updateHeadPath" method="post" enctype="multipart/form-data" style="display: flex;margin-left: 85%;margin-top: 1%;margin-bottom: 1%">--%>
<%--                <input type="file" id="fileInput" name="file" style="display: none">--%>
<%--                <label for="fileInput" class="file-upload">发布任务</label>--%>
<%--                <input type="submit" value="上传">--%>
<%--            </form>--%>
<%--        </div>--%>

        <div class="pageConfigUp">
            <a href="publishTask.jsp" class="publishButton"> + 发布新任务</a>
        </div>

        <table id="userTable">
            <thead>
            <tr>
                <th>任务ID</th>
                <th>头像</th>
                <th>任务名称</th>
                <th>任务组别</th>
                <th>领取状态</th>
                <th>奖励积分</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                int currentPage=1;
                if(request.getParameter("page")!=null){
                    currentPage=Integer.parseInt(request.getParameter("page"));
                }
                TaskService service =new TaskService();
                List<Task> Tasklist = null; // 调用UserService获取用户数据，返回User对象的列表
                try {
                    Tasklist = service.getAllTask();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                for (int i=10*(currentPage-1);i<Math.min(Tasklist.size(),10*(currentPage-1)+10);i++) {
                    Task t= Tasklist.get(i);

            %>
            <tr>
                <td><%= t.getTaskId() %></td>
                <td><img src="<%=t.getCoverPath()%>" alt="Task-img" style="width: 50px; height: 50px;"></td>
<%--                <td><img src="<%=  t.getCoverPath()%>" alt="Task-img" style="width: 50px; height: 50px;"></td>--%>
                <td><%= t.getTaskName() %></td>
                <td><%= t.getLabelColumn()%></td>
                <td><%= t.getUserName() %></td>
                <td><%= t.getAwardScore() %></td>
                <td><a href="reviseTask.jsp?des=<%=t.getDescription()%>&id=<%=t.getTaskId()%>&name=<%=t.getTaskName()%>&label=<%=t.getLabelColumn()%>&score=<%=t.getAwardScore()%>&c=1">修改任务信息</a></td>
            </tr>

            <% } %>

            </tbody>
        </table>
        <!-- 分页控件 -->
        <div class="pageConfig">
            <a style="margin-left: 32%" href="<%=request.getContextPath()%>/main/administrator/taskManagement.jsp?page=1">首页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskManagement.jsp?page=<%=(currentPage > 1) ? (currentPage - 1) : 1 %>">上一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskManagement.jsp?page=<%=currentPage%>">当前:<%=currentPage%>/<%=Tasklist.size()/10+1%></a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskManagement.jsp?page=<%= Math.min(currentPage + 1,Tasklist.size()/10+1) %>">下一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskManagement.jsp?page=<%=Tasklist.size()/10+1%>">尾页</a>
        </div>

    </div>
</div>

</body>
</html>
