<%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/11/30
  Time: 20: 11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }
        .container {
            height: 100%;
            display: flex;
            flex-direction: row;
        }
        h1 {
            font-weight: 1;
        }
        h2 {
            text-align: center;
        }
        input[type="text"], input[type="password"] {
            width: 350px;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-weight: 1;
        }
        input[type="submit"] {
            position: relative;
            border-bottom: 0;
            font-size: 16px;
            width: 100%;
            background-color: #087DCE;
            color: #fff;
            border: none;
            padding: 15px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 1;
        }
        input[type="submit"]:hover {
            background-color: rgba(8, 125, 206, 0.8);
            transition: background-color 0.3s ease;
        }
        a {
            text-decoration: none;
        }
        .background-img{
            width: 60%;
            height: 100%;
            display: block;
        }
        .background-img img{
            width: 100%;
            height: 100%;
            display: block;
            opacity: 0.5;
        }
        .login-block {
            margin-left: 150px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .account-area {
            position: relative;
            width: 350px;
            height: 300px;
            padding: 20px;
            top: 28%;
        }
        .right-text {
            position: relative;
            top:15%
        }
        .choose-area {
            flex-direction: row;
            position: relative;
            top:20%
        }
        a.choice {
            color:black;
            padding: 20px;
            border-bottom: 2px solid;
            border-color: rgb(128, 128, 128);
            font-weight: 1;
        }
        a.choice:hover {
            background-color: #817f7f;
            transition: background-color 0.3s ease;
        }
        form {
            width: 100%;
        }
        .checkbox {
            font-weight: 1;
        }
        #login-button {
            border-bottom: 2px solid #087DCE;
        }
        .vis-img {
            
        }
        .vis-img img {
            height: 30px;
            margin-top: 10px;
        }
        .vis-img img:hover{
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
    String username = null;
    String password = null;
    String checkboxStatus = null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            } else if (cookie.getName().equals("password")) {
                password = cookie.getValue();
            } else if (cookie.getName().equals("checkboxStatus")) {
                checkboxStatus = cookie.getValue();
            }
        }
    }
%>
<%
    Boolean registerSuccessObj = (Boolean) request.getAttribute("registerSuccess");
    String loginError = (String)request.getAttribute("loginError");
    if (loginError != null){
%>
<script>
    alert("<%=loginError%>");
</script>
<%
    } else if (registerSuccessObj != null && !registerSuccessObj) {
%>
<script>
    alert("已存在重复用户名，请重新注册！");
</script>
<%
    }
%>

<div class="container">
    <div class="background-img">
        <img src="<%=request.getContextPath()%>/static/images/background.jpg" alt="background image not found">
    </div>

    <div class="login-block">
        <div class="right-text">
            <h1>欢迎来到山科众包</h1>
            <p style="font-weight: 1;color:rgb(128,128,128);">山东科技大学众包图片标注平台</p>
        </div>
        <div class="choose-area">
            <a class="choice" id="login-button" href="#" onclick="displayContent('login-form')">登录</a>
            <a class="choice" id="register-button" href="#" onclick="displayContent('register-form')">注册</a>
        </div>
        <div class="account-area">
<%--            登陆界面--%>
            <div class="login-form" id="login-form">
                <form action="<%=request.getContextPath()%>/account/login" method="post">
                    <input type="text" name="username" value="<%=username==null?"":username%>" placeholder="用户名" required>
                    <div style="width: 400px;display: flex;"> <input id="password" type="password" name="password"  value="<%=password==null?"":password%>" placeholder="密码" required><div class="vis-img" onclick="changePasswordVisibility()">
                        <img id="vis-img" src="/ImageLabelMaster/static/images/pw-no-vis.png" alt=""></div></div>
                    <label class="checkbox" for="rememberMe" style="color:rgb(128,128,128)" >记住我</label>
                    <input type="checkbox" id="rememberMe" name="rememberMe" <%=checkboxStatus%>><br><br>
                    <input type="submit" value="登录">
                </form>
            </div>
<%--            注册界面--%>
            <div class="register-form" id="register-form" style="display: none" >
                <form action="<%=request.getContextPath()%>/account/register" method="post" onsubmit="return validateRegistration()">
                    <input type="text" name="username" placeholder="用户名" required>
                    <input type="password" name="password" placeholder="密码" required>

                    <input type="checkbox" id="checkRule" name="checkRule">
                    <label class="checkbox" for="checkRule" style="color:rgb(128,128,128)">我已阅读并同意
                        《山科众包使用许可及服务协议》和《山科众包平台隐私政策》</label><br><br>
                    <input type="submit" value="注册" >
                </form>
            </div>
        </div>

    </div>
</div>
</body>
<script>
    function displayContent(content) {
        event.preventDefault();
        const loginForm = document.getElementById('login-form');
        const registerForm = document.getElementById('register-form');
        const loginButton = document.getElementById('login-button');
        const registerButton = document.getElementById('register-button');

        if (content === 'login-form') {
            registerButton.style.borderColor = 'rgb(128,128,128)';
            loginButton.style.borderColor = '#087DCE';

            registerForm.style.display = 'none';
            loginForm.style.display = 'block';
        } else if (content === 'register-form') {
            loginForm.style.display = 'none';
            registerForm.style.display = 'block';

            loginButton.style.borderColor = 'rgb(128,128,128)';
            registerButton.style.borderColor = '#087DCE';
        }
    }

    function validateRegistration() {
        var checkBox = document.getElementById('checkRule');
        if (!checkBox.checked) {
            alert('请同意相关协议');
            return false;
        }
        return true;
    }

    function changePasswordVisibility() {
        const pwInput = document.getElementById("password");
        const visImg = document.getElementById("vis-img");

        if (pwInput.type === "password") {
            pwInput.type = "text";
            visImg.src = "/ImageLabelMaster/static/images/pw-vis.png";
        } else {
            pwInput.type = "password";
            visImg.src = "/ImageLabelMaster/static/images/pw-no-vis.png";
        }
    }
</script>
</html>
