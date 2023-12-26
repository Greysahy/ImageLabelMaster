<%@ page import="pojo.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/MainMall.css">
  <meta charset="UTF-8">
  <title>Bootstrap </title>
  <link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>

<div class="main-head layout">
    <div class="main-left layout">
      <a href="<%=request.getContextPath()%>/mall/AllTask">
        <img class="zhongbao-head left-horizon" src="<%=request.getContextPath()%>/static/images/img/山科众包.png" alt="logo">
      </a>

      <a class="top-bar-tag" href="<%=request.getContextPath()%>/mall/AllTask">任务广场</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning.jsp">嵙学院</a>
          <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/bbs/allPosts">嵙论坛</a>
         <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/shoppingMall/IndexPreview">积分商城</a>

    </div>
    <div class="main-right layout" style="display: flex">

      <a class="top-bar-tag"href="<%=request.getContextPath()%>/main/userspace/allTask">工作台</a>

      <div class="drop-menu">
        <div class="top-bar-account">
          <span style="font-size:2vw;height:10vh"><%=request.getSession().getAttribute("username")%></span>
          <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/curTask">工作台</a></div>
          <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/userInfo">个人中心</a></div>
          <div class="drop"><a href="<%=request.getContextPath()%>/account/exit">退出账户</a></div>
        </div>
      </div>

    </div>
  </div>
<div class="second-header" style="display: flex;height:35vh; justify-content:space-between;">
  <div id="myCarousel" class="carousel slide left-horizon">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner" style="text-align: center;height:35vh"> <!-- 添加 text-align: center; -->
      <div class="item active">
        <img class="show-pictures" src="<%=request.getContextPath()%>/static/images/img/pictures2.png" alt="First slide" style="">
      </div>
      <div class="item">
        <img class="show-pictures" src="<%=request.getContextPath()%>/static/images/img/pictures3.png" alt="Second slide" style="">
      </div>
      <div class="item">
        <img class="show-pictures" src="<%=request.getContextPath()%>/static/images/img/专业团队.png" alt="Second slide" style=" ">
      </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

    <div style="margin-right:5vw;background-size: cover; background-image: url('<%=request.getContextPath()%>/static/images/img/user-card.png') ;width:20vw;border-radius: 2vh 2vh 2vh 2vh;">
      <div onclick="window.location.href='<%=request.getContextPath()%>/main/userspace/userInfo'" style="cursor:pointer; margin-top:2vh;margin-left:1vw;font-size:1vw;">
        <img src="<%=((User)(session.getAttribute("user"))).getHeadPath()%>" alt="header" style="cursor:pointer; object-fit: cover;border-radius: 50vh;width:10vh;"  >  <%=session.getAttribute("username")%>
      </div>

      <div style="margin-top:1vh;margin-left:1vw;font-size:1vw;display:flex;">score:
        <div class="score"><%=((User)(session.getAttribute("user"))).getScore()%></div>
      </div>

      <div style="display:flex;justify-content:space-between;height:10vh;">
        <div class="tasks">
          <div  class="click-task" style="text-align:center; margin-left:3vw;font-size:1vw">所有任务</div>
          <div  style="border-radius: 2vh 2vh 2vh 2vh;background-size:cover;  background-image: url('<%=request.getContextPath()%>/static/images/img/alltasks.png');margin-left:1.5vw;width:7vw;height:13vh;text-align:center ;" onclick="window.location.href='<%=request.getContextPath()%>/main/userspace/curTask'">
          </div>
        </div>
        <div class="tasks">
          <div class=" click-task" style="text-align:center; margin-left:3vw;font-size:1vw">待做任务</div>
          <div  style="border-radius: 2vh 2vh 2vh 2vh;background-size:cover; background-image: url('<%=request.getContextPath()%>/static/images/img/tasks-todo.png'); margin-left:1.5vw;width:7vw;height:13vh;text-align:center;" onclick="window.location.href='<%=request.getContextPath()%>/main/userspace/allTask'">
          </div>
        </div>
      </div>
    </div>

</div>
<div class="task-title left-horizon">
  <div class="title-logo">
  </div>
  <div style="font-size:2vw;margin-left:1vw;line-height:5vh;">全部任务</div>
  <div style="font-size:2vw;margin-left:3vw;line-height:5vh;">直接领取任务，规定时间完成即可</div>
</div>
<div class="task_container left-horizon right-horizon"><!--编写添加任务这里之后需要进行修改，变成遍历输入-->
 <% List<Task> task_list=(List<Task>)session.getAttribute("tasklist");%>
<% for(Task a:task_list){%>
  <div class="task_to_choose taskslist" style="text-align:center;background-color:RGB(175,175,175);border-radius: 2vh 2vh 2vh 2vh;" onclick="window.location.href= '<%=request.getContextPath()%>/mall/ProductSentBetweenPages?productId=<%= a.getTaskId() %>'">
    <%if(a.getUserName().equals("null")){%>
    <img src="<%=request.getContextPath()%>/static/images/img/task-bk.jpg" alt="icon" style="width:13vw;height:6vw;border-radius: 2vh 2vh 0 0; ">
    <%}else{%>
    <img src="<%=request.getContextPath()%>/static/images/img/task-bk-bannd.jpg" alt="icon" style="width:13vw;height:6vw;border-radius: 2vh 2vh 0 0; ">
    <%}%>
    <div class="task-name" style="font-size:2vw;"><%=a.getTaskName()%></div>

  </div>
<% }%>
</div>
</body>

</html>
