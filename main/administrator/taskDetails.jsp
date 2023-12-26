<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="service.UserService" %>
<%@ page import="JDBCUtil.UserJDBC" %>
<%@ page import="pojo.Task" %>
<%@ page import="service.TaskService" %>
<%@ page import="pojo.Image" %><%--
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/taskDetial.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/Deng/Deng.css">

    <style>
        .task-name{
            /*height: 90%;*/
            /*width: 90%;*/
            /*border: 2px solid #126bff;*/
            margin-top: 25%;
            margin-left: 2%;
            text-align: center;
            /*display: inline-block; !* 将文本作为块级元素显示 *!*/
            vertical-align: middle; /* 垂直居中 */
            line-height: normal; /* 重置行高 */
        }
         .container1 {
             display: flex;
             flex-direction: column;
             align-items: center;
             justify-content: center;
             width: 15%;
             margin: 2%;
             height: 60px;
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

        .return-button10 {
            position: fixed;
            background-color: #ffffff; /* 按钮背景颜色 */
            padding: 2px 2px; /* 按钮内边距 */
            border-radius: 5px; /* 按钮圆角 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 按钮阴影效果 */
            margin-top: 1%;
            margin-left: 1%;
        }

        /* 鼠标悬停时的样式 */
        .return-button10:hover {
            background-color: #f0f0f0; /* 按钮悬停时背景颜色 */
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

    <!-- 消息按钮 -->
    <%--    <div class="messages" style="margin-left: 80%; margin-top: 1% ">--%>
    <%--        <a href="#"><i class="far fa-envelope"></i></a>--%>
    <%--    </div>--%>
    <%--    <%--%>
    <%--        UserService service =new UserService();--%>
    <%--        String n= request.getAttribute("username").toString();--%>
    <%--        User u= service.getUser(n);--%>
    <%--    %>>--%>
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
        <div class="return-button10">
            <a href="imageManagement.jsp" class="return-link">
                返回
            </a>
        </div>

        <div class="pageConfigUp">
            <a href="<%=request.getContextPath()%>/main/admin/exportData?taskId=<%=request.getParameter("taskId")%>" class="publishButton">导出数据</a>
        </div>

        <div class="task_container1 left-horizon1 right-horizon1">
            <%
                int currentPage=1;
                if(request.getParameter("page")!=null){
                    currentPage=Integer.parseInt(request.getParameter("page"));
                }
                TaskService t=new TaskService();
                List<Image> image_list= null;
                try {
                    image_list = t.getAllImageForTaskA(Integer.parseInt(request.getParameter("taskId")));
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            %>
            <%
                for (int i=5*(currentPage-1);i<Math.min(image_list.size(),5*(currentPage-1)+5);i++) {
                    Image a=image_list.get(i);
            %>
            <div style="margin-top: 1%;height:10%;width: 100%;display: flex;  border: 2px solid #c0c4c3;">
            <%--            <div class="image-container">--%>
<%--            <div class="task_to_choose1 taskslist1" style="text-align:center;border-radius: 2vh 2vh 2vh 2vh;width: 6%;height: 100%">--%>
<%--                    <img src="<%=a.getImagePath()%>" alt="Image" style="border-radius: 2vh 2vh 0 0; width: 90%; height: 90%; ">--%>
<%--&lt;%&ndash;                <div class="task-name" style="font-size: 2vw;"><%=a.getImageId()%></div>&ndash;%&gt;--%>
<%--            </div>--%>

            <div class="container1">
                <div class="image-container1">
                    <img src="<%=a.getImagePath()%>" alt="Image">
                </div>
            </div>

            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel1()%></p>
                </div>
            </div>

            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel2()%></p>
                </div>
            </div>
            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel3()%></p>
                </div>
            </div>

            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel4()%></p>
                </div>
            </div>
            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel5()%></p>
                </div>
            </div>

            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel6()%></p>
                </div>
            </div>
            <div class="container1">

                <div class="id-container">
                    <p><%=a.getLabel7()%></p>
                </div>
            </div>

                <%
                    Map<String, Integer> mp = new HashMap<>();
                    mp.put(a.getLabel1(),1);

                    if(mp.containsKey(a.getLabel2())){
                        mp.put(a.getLabel2(),mp.get(a.getLabel2())+1);
                    }
                    else mp.put(a.getLabel2(),1);

                    if(mp.containsKey(a.getLabel3())){
                        mp.put(a.getLabel3(),mp.get(a.getLabel3())+1);
                    }
                    else mp.put(a.getLabel3(),1);

                    if(mp.containsKey(a.getLabel4())){
                        mp.put(a.getLabel4(),mp.get(a.getLabel4())+1);
                    }
                    else mp.put(a.getLabel4(),1);

                    if(mp.containsKey(a.getLabel5())){
                        mp.put(a.getLabel5(),mp.get(a.getLabel5())+1);
                    }
                    else mp.put(a.getLabel5(),1);

                    if(mp.containsKey(a.getLabel6())){
                        mp.put(a.getLabel6(),mp.get(a.getLabel6())+1);
                    }
                    else mp.put(a.getLabel6(),1);

                    if(mp.containsKey(a.getLabel7())){
                        mp.put(a.getLabel7(),mp.get(a.getLabel7())+1);
                    }
                    else mp.put(a.getLabel7(),1);

                    int maxx=0;
                    String ans = null;
                    for (Map.Entry<String, Integer> entry : mp.entrySet()) {
                        String name = entry.getKey();
                        int num = entry.getValue();
                        if(num>maxx){
                            maxx=num;
                            ans=name;
                        }
                    }
                %>
            <div class="container1" style="background:coral;">
                <div class="id-container">
                    <p><%=ans%></p>
                </div>
            </div>

            <div class="container1" style="background: #087DCE">
                <div class="id-container">
                    <p><%=maxx*100/7%>%</p>
                </div>
            </div>
<%--            <div class="task_to_choose2 taskslist1" style="margin-left:50%;background:coral;">--%>
<%--                &lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--                <div class="task-name" style="color: white" ><%=ans%></div>--%>
<%--            </div>--%>

<%--            <div class="task_to_choose2 taskslist1" style="background: #087DCE">--%>
<%--                &lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--                <div class="task-name" style="color: white"><%=maxx*100/7%>%</div>--%>
<%--            </div>--%>

            </div>

            <% }%>

        </div>

        <!-- 分页控件 -->
        <div class="pageConfig">
            <a style="margin-left: 32%" href="<%=request.getContextPath()%>/main/administrator/taskDetails.jsp?taskId=<%= Integer.parseInt(request.getParameter("taskId")) %>&page=1">首页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskDetails.jsp?taskId=<%= Integer.parseInt(request.getParameter("taskId")) %>&page=<%=(currentPage > 1) ? (currentPage - 1) : 1 %>">上一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskDetails.jsp?taskId=<%= Integer.parseInt(request.getParameter("taskId"))%>&page=<%=currentPage%>">当前:<%=currentPage%>/<%=image_list.size()/5+1%></a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskDetails.jsp?taskId=<%= Integer.parseInt(request.getParameter("taskId")) %>&page=<%= Math.min(currentPage + 1,image_list.size()/5+1) %>">下一页</a>
            <a href="<%=request.getContextPath()%>/main/administrator/taskDetails.jsp?taskId=<%= Integer.parseInt(request.getParameter("taskId")) %>&page=<%=image_list.size()/5+1%>">尾页</a>
        </div>
    </div>
</div>

</body>
</html>
