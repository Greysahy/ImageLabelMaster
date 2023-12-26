<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="service.UserService" %>
<%@ page import="JDBCUtil.UserJDBC" %>
<%@ page import="pojo.Task" %>
<%@ page import="service.TaskService" %><%--
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/MainMall.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/iamgeManagement.css">
    <style>
        .container1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 15%; /* 调整容器宽度 */
            margin: 2%; /* 设置间距 */
        }

        .image-container1 {
            transition: transform 0.3s ease-in-out; /* 添加过渡效果 */
        }

        .image-container1 img {
            width: 100%;
            height: auto;
        }

        .id-container {
            margin-top: 0; /* 调整 ID 与图片的间距 */
        }

        .container:hover .image-container {
            transform: scale(1.1); /* 鼠标悬停时放大图片 */
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
        <div class="task_container left-horizon right-horizon">
            <%
                int currentPage=1;
                if(request.getParameter("page")!=null){
                    currentPage=Integer.parseInt(request.getParameter("page"));
                }
                TaskService t=new TaskService();
                List<Task> task_list= null;
                try {
                    task_list = t.getAllTaskByLabel1();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            %>
            <%
                for (int i=10*(currentPage-1);i<Math.min(task_list.size(),10*(currentPage-1)+10);i++) {
                    Task a=task_list.get(i);
            %>
<%--            <div class="task_to_choose taskslist" style="text-align:center;border-radius: 2vh 2vh 2vh 2vh;" onclick="window.location.href= '<%=request.getContextPath()%>/main/administrator/showImageResult.jsp?taskId=<%= a.getTaskId() %>'">--%>
<%--                <%if(a.getUserName().equals("null")){%>--%>

<%--                <img src="<%=a.getCoverPath()%>" alt="icon" style="width:13vw;height:6vw;border-radius: 2vh 2vh 0 0; ">--%>
<%--                <%}else{%>--%>
<%--                <img src="<%=a.getCoverPath()%>" alt="icon" style="width:13vw;height:6vw;border-radius: 2vh 2vh 0 0; ">--%>
<%--                <%}%>--%>
<%--                <div class="task-name" style="font-size:1.5vw;"><%=a.getTaskName()%></div>--%>
<%--            </div>--%>


                <div class="container1" onclick="window.location.href= '<%=request.getContextPath()%>/main/administrator/showImageResult.jsp?taskId=<%= a.getTaskId() %>'">
                    <div class="image-container1">
                        <img src="<%=a.getCoverPath()%>" alt="Image">
                    </div>
                    <div class="id-container">
                        <p><%=a.getTaskName()%></p>
                    </div>
                </div>

            <% }%>

        </div>

        <!-- 分页控件 -->
        <div class="pageConfig">
            <a style="margin-left: 32%" href="<%=request.getContextPath()%>/main/administrator/imageManagement.jsp?page=1">首页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/imageManagement.jsp?page=<%=(currentPage > 1) ? (currentPage - 1) : 1 %>">上一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/imageManagement.jsp?page=<%=currentPage%>">当前:<%=currentPage%>/<%=task_list.size()/10+1%></a>
            <a href="<%=request.getContextPath()%>/main/administrator/imageManagement.jsp?page=<%= Math.min(currentPage + 1,task_list.size()/10+1) %>">下一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/imageManagement.jsp?page=<%=task_list.size()/10+1%>">尾页</a>
        </div>

    </div>
</div>

</body>
</html>
