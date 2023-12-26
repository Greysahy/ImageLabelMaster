<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="service.UserService" %>
<%@ page import="JDBCUtil.UserJDBC" %>
<%@ page import="service.LogService" %>
<%@ page import="pojo.Log" %><%--
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
        .logcss{
            color: #888;
            font-size: 20px;
            text-align: center;
            padding: 10px;
            width: 100%;
            border: #cccccc;
            /*border: 2px solid #126bff;*/
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
        <div>
            <%
                int currentPage=1;
                if(request.getParameter("page")!=null){
                    currentPage=Integer.parseInt(request.getParameter("page"));
                }
                LogService t=new LogService();
                List<Log> log_list= null;
                try {
                    log_list = t.getAllLog();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            %>
            <%
                for (int i=9*(currentPage-1);i<Math.min(log_list.size(),9*(currentPage-1)+9);i++) {
                    Log a=log_list.get(i);
            %>
            <div>
                <%
                    if(a.getLog().equals("null")){
                %>
                <div class="logcss"><p>暂无日志</p></div>
                <%
                    }
                    else {
                %>
                <div class="logcss"><p><%=a.getLog()%></p></div>
                <%
                    }
                %>
            </div>
            <%
                }
            %>

        </div>

        <!-- 分页控件 -->
        <div class="pageConfig">
            <a style="margin-left: 32%" href="<%=request.getContextPath()%>/main/administrator/systemConfiguration.jsp?page=1">首页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/systemConfiguration.jsp?page=<%=(currentPage > 1) ? (currentPage - 1) : 1 %>">上一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/systemConfiguration.jsp?page=<%=currentPage%>">当前:<%=currentPage%>/<%=log_list.size()/9+1%></a>
            <a href="<%=request.getContextPath()%>/main/administrator/systemConfiguration.jsp?page=<%= Math.min(currentPage + 1,log_list.size()/9+1) %>">下一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/systemConfiguration.jsp?page=<%=log_list.size()/9+1%>">尾页</a>
        </div>
    </div>
</div>

</body>
</html>
