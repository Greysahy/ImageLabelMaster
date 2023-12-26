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
    <title>商品</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/userspace-style2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/shoppingMall-productshowstyle.css">
</head>
<body>
<%
    Product product = (Product) request.getAttribute("product");
    String exchangeSuc = (String) request.getAttribute("exchangeSuc");
    if(exchangeSuc.equals("true")) {
%>
<script>
    alert("兑换成功！")
</script>
<%} else if(exchangeSuc.equals("false")) {%>
<script>
    alert("余额不足！")
</script>
<%}%>

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
    <div class="single-product-img">
        <img src="<%=product.getCoverPath()%>" alt="">
    </div>
    <div class="single-product-area">
        <div class="single-product-title">
            <span><%=product.getProductName()%></span>
        </div>

        <div class="single-product-description">
            <%
                if(product.getCategory().equals("pu学分")) {
            %>
            <p>PU学分是山东科技大学第二课堂中的一种学分体系，通过参与各种活动，您可以获得这些学分。这些活动多种多样，旨在丰富您的大学经历，让您不仅在课堂内获得知识，还可以在课外探索、学习并培养技能。</p>
            <p>PU学分为您提供了更广泛的学习机会，就像打开一扇通往多元领域的大门。参与这些活动，就像是探索新的知识和技能的旅程，让您更全面地成长，丰富您的大学生活。无论是学术、文化、技能还是社会服务类的活动，PU学分都是您拓展自我、开拓视野的重要途径。</p>
            <p>PU学分不仅是学业上的补充，更是为了让您在大学期间拥有更加丰富多彩的经历和成长机会。让PU学分成为您大学生活中的伙伴，一起探索新的可能性！</p>
            <%}%>
            <%
                if(product.getCategory().equals("实物奖品")) {
            %>
            <p>完成山东科技大学众包平台上的图像标注任务，您将获得积分，用于兑换令人瞠目结舌的实物奖品。这些奖品包括梦寐以求的直升机和游艇，代表着您在平台上勤奋努力的成果。就像PU学分一样，这些实物奖品是对您贡献和努力的肯定，激励着您持续参与并做出更多贡献。</p>
            <p>这些珍贵的实物奖品都是您坚持不懈的证明，是对您在平台上努力的回馈。完成任务、赚取积分、赢得独特奢华的实物奖品，这是您在山科众包平台上精彩努力的最佳奖励！</p>
            <%}%>
            <%
                if(product.getCategory().equals("特权权益")) {
            %>
            <p>完成山科众包平台上图像标注任务的学生将有机会获得一些特权权益。这一礼物为您带来更多机会和特殊经历,让您享有额外的特殊待遇和体验。</p>
            <p>这些特权不仅为您提供了参与最独特活动的直通车，更是个性化指导的极致享受；有全程 VIP 待遇的私人陪同！更不可思议的是，您将有机会与世界顶级专家近距离交流，领略独家视角！特权为您带来的是一场奇妙、前所未有的超级体验，是您在众包平台上杰出贡献的终极回馈！</p>
            <p>这些特权权益代表着众包平台对您积极参与科研活动的认可，并致力于为您提供更为丰富、更具价值的学习和成长体验。</p>
            <%}%>
            <span>类型：<%=product.getType()%></span>
            <span style="color:#087DCE;">山科自营</span>
        </div>
        <div class="single-product-info-item">
            <span>价格：<%=product.getScorePrice()%></span>
            <span>剩余数量：<%=product.getNumOfLeft()%></span>
        </div>
        <div class="exchange-button">
            <a onclick="return confirm('确定兑换？')" href="<%=request.getContextPath()%>/main/shoppingMall/exchange?productId=<%=product.getProductId()%>">确认兑换</a>
        </div>
    </div>
</div>
</body>
</html>
