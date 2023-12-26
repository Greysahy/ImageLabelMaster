<%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/11/30
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        p {
            margin-bottom: 10px;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<%
    request.setAttribute("registerSuccess", true);
%>
<div class="container">
    <h2><%=request.getParameter("username")%>, 恭喜您注册成功！</h2>
    <p>您的密码为: <%=request.getParameter("password")%></p>
    <p>感谢您注册山科众包！您的注册信息已成功提交，您现在可以开始使用您的账户进行登录。</p>
    <p>如果您忘记了密码或需要帮助，请联系我们的客服团队。</p>
    <p>感谢您的信任和支持！</p>
    <a href="<%=request.getContextPath()%>/account/login.jsp" target="_self">点击此处返回登陆页面</a>
</div>
</body>
</html>
