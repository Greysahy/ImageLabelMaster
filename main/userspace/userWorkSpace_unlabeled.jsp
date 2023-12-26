<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pojo.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Image" %><%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/12/6
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>任务</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/userspace-doworkstyle.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userspace-previewimagestyle.css">
</head>
<body>
<%
    List<Image> images = (List<Image>) session.getAttribute("unlabeledImages");
    int taskId = (int)session.getAttribute("taskId");
    int currentImageId = 0;
    if(!images.isEmpty()) {
        currentImageId = images.get(0).getImageId();
    }
%>
<script>
    function changeCurrentImage(imageId, imagePath) {
        const currentImage = document.getElementById("current-img");
        const idInputer = document.getElementById("imageId");
        const imagePaths = document.getElementById("imagePaths").value.split(",");
        const idxInputer = document.getElementById("img-idx");
        idxInputer.value = imagePaths.indexOf(imagePath);
        currentImage.src = imagePath;
        idInputer.value = imageId;
    }

    function changeToPreImage() {
        event.preventDefault();
        const idxInputer = document.getElementById("img-idx");
        const currentImage = document.getElementById("current-img");
        const idInputer = document.getElementById("imageId");
        const imageIds = document.getElementById("imageIds").value.split(",");
        const imagePaths = document.getElementById("imagePaths").value.split(",");

        let currentIndex = parseInt(idxInputer.value);
        if(currentIndex === 0) {
            alert("已经是第一张图片！")
        }
        else {
            currentIndex = currentIndex - 1;
            idxInputer.value = currentIndex;
            currentImage.src = imagePaths[currentIndex];
            idInputer.value = imageIds[currentIndex];
        }

    }

    function changeToNextImage() {
        event.preventDefault();
        const idxInputer = document.getElementById("img-idx");
        const currentImage = document.getElementById("current-img");
        const idInputer = document.getElementById("imageId");
        const imageIds = document.getElementById("imageIds").value.split(",");
        const imagePaths = document.getElementById("imagePaths").value.split(",");

        let currentIndex = parseInt(idxInputer.value);
        if(currentIndex === <%=images.size() - 1%>) {
            alert("已经是最后一张图片！")
        }
        else {
            currentIndex = currentIndex + 1;
            idxInputer.value = currentIndex;
            currentImage.src = imagePaths[currentIndex];
            idInputer.value = imageIds[currentIndex];
        }
    }
    function checkImageNum() {
        var imageCount = parseInt(document.getElementById("imageCount").value);

        if (imageCount === 0) {
            alert('没有图片了！');
            return false;
        } else {
            return true;
        }
    }
</script>
<div class="top-bar">
    <div class="top-bar-logo">
        <a  href="<%=request.getContextPath()%>/mall/AllTask"><img id="logo" src="<%=request.getContextPath()%>/static/images/logo.jpg" alt="" ></a>
        <a id="logo-text" href="<%=request.getContextPath()%>/mall/AllTask">山科众包</a>
    </div>
    <div class="top-bar-btn">
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/mall/AllTask">任务广场</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/userspace/userSkillLearning.jsp">嵙学院</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/bbs/allPosts">嵙论坛</a>
        <a class="top-bar-tag" href="<%=request.getContextPath()%>/main/shoppingMall/IndexPreview">积分商城</a>
    </div>
    <div class="top-bar-right">
        <div class="drop-menu">
            <div class="top-bar-account">
                <span><%=request.getSession().getAttribute("username")%></span>
                <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/curTask">工作台</a></div>
                <div class="drop"><a href="<%=request.getContextPath()%>/main/userspace/userInfo">个人中心</a></div>
                <div class="drop"><a href="<%=request.getContextPath()%>/account/exit">退出账户</a></div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="side-bar">
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userspaceAllImage" >所有图像</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userspaceUnlabeled" style="background-color: #087DCE;color:white;">未标注</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/userspace/userspaceLabeled">已标注</a>
    </div>

    <div class="tasks-content">
        <div class="preview">
            <span style="font-size: 20px;margin-left:75px;margin-bottom: 20px;">图像预览👇</span>
            <%
                int cnt = 0;
                for(Image image:images) {
            %>
            <div  class="img-preview">
                <img onclick="changeCurrentImage(<%=image.getImageId()%>, '<%=image.getImagePath()%>')" id="img-preivew-<%=image.getImageId()%>" src="<%=image.getImagePath()%>" alt="">
            </div>
            <%
                    if(cnt ++ >= 4)break;
                }
            %>
        </div>
        <div class="work-area">
            <div class="img-area">
                <img id="current-img"
                     <%
                    if(images.size() == 0){
                     %>
                        src="<%=request.getContextPath()%>/static/images/nopic.jpeg" style="border: none;box-shadow: 0 0 0"
                    <%
                    }
                    else {
                    %>
                     src="<%=images.get(0).getImagePath()%>"
                     <%
                    }
                     %>
                     alt="图片已耗尽">
            </div>
            <div class="operation-area">
                <%
                    if(!images.isEmpty()){
                %>
                <a class="operation-btn" href="#" onclick="changeToPreImage()">上一张</a>
                <%
                    }
                %>
                <form id="label-form" action="<%=request.getContextPath()%>/main/userspace/updateLabel" method="get" onsubmit="return checkImageNum()">
                    <%
                        StringBuilder imagePaths = new StringBuilder();
                        StringBuilder imageIds = new StringBuilder();
                        for (Image image : images) {
                            imagePaths.append(image.getImagePath()).append(",");
                            imageIds.append(image.getImageId()).append(",");
                        }
                    %>
                    <input type="hidden" id="imagePaths" value="<%= imagePaths.toString() %>">
                    <input type="hidden" id="imageIds" value="<%= imageIds.toString() %>">
                    <input type="hidden" id="imageCount" value="<%= images.size() %>">
                    <input type="number" id="img-idx" value="0" style="display:none;">
                    <input type="text" name="fromPage" value="Unlabeled" style="display: none">
                    <input type="number" id="imageId" name="imageId" value="<%=currentImageId%>" style="display: none;">

                    <%
                        if(images.isEmpty()) {
                    %>
                    <a class="operation-btn" style="width: 120px;" href="<%=request.getContextPath()%>/main/userspace/allTask">回到工作台</a>
                    <%
                        }else {
                    %>
                    <input type="text" name="classLabel" placeholder="类别">
                    <input type="submit" value="提交">
                    <%
                        }
                    %>
                </form>
                <%
                    if(!images.isEmpty()){
                %>
                <a class="operation-btn" href="#" onclick="changeToNextImage()">下一张</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>

