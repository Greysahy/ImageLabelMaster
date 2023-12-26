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
    <title>管理员平台</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/yonghu.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/Deng.css">

    <style>



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
        <div class="pageConfig1">
            <form action="<%=request.getContextPath()%>/main/admin/deleteUser" method="GET" style="display: flex;margin-left: 85%;margin-top: 1%;margin-bottom: 1%">
                <input type="text" id="search" name="query" placeholder="输入名字搜索词">
                <input type="hidden" name="choice" value="1">
                <input type="submit" value="搜索">
            </form>
        </div>
        <table id="userTable">
            <thead>
            <tr>
                <th>用户ID</th>
                <th>头像</th>
                <th>用户名</th>
                <th>管理员</th>
                <th>电话号</th>
                <th>积分</th>
                <th>学院</th>
                <th>其他操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                int currentPage=1;
                if(request.getParameter("page")!=null){
                    currentPage=Integer.parseInt(request.getParameter("page"));
                }
                UserService service =new UserService();
                List<User> userlist = null; // 调用UserService获取用户数据，返回User对象的列表
                try {
                    if(request.getParameter("name")!=null){
                        String name=request.getParameter("name").toString();
                        userlist=service.selectUserByName(name);
                    }
                    else
                        userlist = service.selectAllUser();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                for (int i=10*(currentPage-1);i<Math.min(userlist.size(),10*(currentPage-1)+10);i++) {
                    User user= userlist.get(i);
            %>
            <tr>
                <td><%= user.getUserId() %></td>
<%--                修改--%>
                <td><img src="<%=user.getHeadPath()%>" alt="User Image" style="width: 50px; height: 50px;"></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getType() %></td>
                <td><%= user.getTel() %></td>
                <td><%= user.getScore() %></td>
                <td><%= user.getCollege() %></td>
                <td><a href="<%=request.getContextPath()%>/main/admin/deleteUser?choice=2&name=<%=user.getUsername()%>">删除</a></td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <!-- 分页控件 -->
        <div class="pageConfig">
            <a style="margin-left: 32%" href="<%=request.getContextPath()%>/main/administrator/userManagement.jsp?page=1">首页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/userManagement.jsp?page=<%=(currentPage > 1) ? (currentPage - 1) : 1 %>">上一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/userManagement.jsp?page=<%=currentPage%>">当前:<%=currentPage%>/<%=userlist.size()/10+1%></a>
            <a href="<%=request.getContextPath()%>/main/administrator/userManagement.jsp?page=<%= Math.min(currentPage + 1,userlist.size()/10+1) %>">下一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/userManagement.jsp?page=<%=userlist.size()/10+1%>">尾页</a>
        </div>
    </div>
</div>

</body>
</html>
