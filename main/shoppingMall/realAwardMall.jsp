<%@ page import="pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Product" %><%--
  Created by IntelliJ IDEA.
  User: An
  Date: 2023/12/6
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>工作台</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/userspace-style2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/shoppingMall-subpagestyle.css">
</head>
<body>
<%
    List<Product> products = (List<Product>) request.getAttribute("RealProducts");
%>
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
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/IndexPreview">商城首页</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/PU" >PU学分</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/RealProducts" style="background-color: #087DCE;color:white;">实物奖品</a>
        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/SpecialPowerProducts">特权权益</a>
    </div>
    <div class="tasks-content">
        <div class="choose-area">
            <form class="filter-form" action="<%=request.getContextPath()%>/main/shoppingMall/RealProducts" method="post">
                所需积分
                <input type="number" name="minScore" >
                <span style="text-align: center;">~</span>
                <input type="number" name="maxScore" >
                <input type="submit" value="查询">
            </form>
        </div>
        <%
            if(products != null){
                int productsCount = products.size();
                for(int i = 0; i < productsCount; ++i)
                {
                    if(i % 5 == 0) {
        %>
        <div class="product-area">
            <div class="product-area-title">
                <span><%=products.get(i).getCategory()%></span>
            </div>
            <div class="product-area-content">
                <%
                    }
                %>
                <div class="product-preview">
                    <div class="product-cover">
                        <img src="<%=products.get(i).getCoverPath()%>" alt="">
                    </div>
                    <div class="product-info">
                        <span class="product-name"><%=products.get(i).getProductName()%></span>
                        <span class="product-price">类型：<%=products.get(i).getType()%></span>
                        <span class="product-price">所需积分：<%=products.get(i).getScorePrice()%></span>
                        <span class="product-price">剩余：<%=products.get(i).getNumOfLeft()%></span>
                        <a class="product-button" href="<%=request.getContextPath()%>/main/shoppingMall/singleProduct?productId=<%=products.get(i).getProductId()%>">兑换</a>
                    </div>
                </div>
                <%
                    if ((i + 1) % 5 == 0 || (i + 1) == productsCount) { // 到达五个产品或者已经是最后一个产品时闭合 product-area
                %>
            </div>
        </div>
        <%
                    }
                }
            }
        %>
    </div>
</div>
</body>
</html>
