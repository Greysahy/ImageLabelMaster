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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/shoppingMall-indexstyle.css">
</head>
<body>
<%
    List<Product> puProductsPreview = (List<Product>) request.getAttribute("puProductsPreview");
    List<Product> realProductsPreview = (List<Product>) request.getAttribute("realProductsPreview");
    List<Product> specialPowerPreview = (List<Product>) request.getAttribute("specialPowerPreview");
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
<div class="index-container">
<%--    <div class="side-bar">--%>
<%--        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/IndexPreview">商城首页</a>--%>
<%--        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/PU">PU学分</a>--%>
<%--        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/RealProducts">实物奖品</a>--%>
<%--        <a class="side-bar-button" href="<%=request.getContextPath()%>/main/shoppingMall/SpecialPowerProducts">特权权益</a>--%>
<%--    </div>--%>
    <div class="main-content">
        <div class="top-content">
            <div class="top-left-content">
                <div class="medium-content-block">
                    <a style="background-color: rgba(8,125,206,0.5)" href="<%=request.getContextPath()%>/main/shoppingMall/PU">
                        <span class="product-title" style="color: #087DCE;">PU学分</span>
                        <span class="product-info">第二课堂学分</span>
                        <span class="product-info">即时兑换</span>
                        <img src="<%=request.getContextPath()%>/static/images/scoremore.png" alt="">
                    </a>
                </div>
                <div class="medium-content-block">
                    <a style="background-color: rgba(17,150,219,0.5)" href="<%=request.getContextPath()%>/main/shoppingMall/RealProducts">
                        <span class="product-title" style="color: #1196db;">实物奖品</span>
                        <span class="product-info">豪华大奖</span>
                        <span class="product-info">点击即得</span>
                        <img src="<%=request.getContextPath()%>/static/images/awards.png" alt="">
                    </a>
                </div>
            </div>
            <div class="top-right-content">
                <div class="top-little-content-block">
                    <div class="little-title">
                        <span class="little-title-title">PU学分</span>
                        <span class="little-title-info">拓展视野 开启新境界</span>
                    </div>
                    <div class="little-img">
                        <img src="<%=request.getContextPath()%>/static/images/products/pu.png" alt="">
                    </div>
                </div>
                <div class="top-little-content-block">
                    <div class="little-title">
                    <span class="little-title-title">PU学分</span>
                    <span class="little-title-info">拓展视野 开启新境界</span>
                </div>
                    <div class="little-img">
                        <img src="<%=request.getContextPath()%>/static/images/products/pu.png" alt="">
                    </div>
                </div>
                <div class="top-little-content-block">
                    <div class="little-title">
                        <span class="little-title-title">PU学分</span>
                        <span class="little-title-info">拓展视野 开启新境界</span>
                    </div>
                    <div class="little-img">
                        <img src="<%=request.getContextPath()%>/static/images/products/pu.png" alt="">
                    </div>
                </div>
                <div class="top-little-content-block">
                    <div class="little-title">
                        <span class="little-title-title">PU学分</span>
                        <span class="little-title-info">拓展视野 开启新境界</span>
                    </div>
                    <div class="little-img">
                        <img src="<%=request.getContextPath()%>/static/images/products/pu.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-content">
            <div class="bottom-little-content-block">
                <div class="little-title">
                    <span class="little-title-title">PU学分</span>
                    <span class="little-title-info">拓展视野 开启新境界</span>
                </div>
                <div class="little-img">
                    <img src="<%=request.getContextPath()%>/static/images/products/pu.png" alt="">
                </div>
            </div>
            <div class="long-content-block">
                <a style="background-color: rgb(0 65 152 / 50%);" href="<%=request.getContextPath()%>/main/shoppingMall/SpecialPowerProducts">
                    <span class="long-title" style="color:rgb(0, 65, 152)">特权权益</span>
                    <span class="long-info">成为人上人</span>
                    <img src="<%=request.getContextPath()%>/static/images/special-power.png" alt="">
                </a>
            </div>
            <div class="bottom-little-content-block">
                <div class="little-title">
                    <span class="little-title-title">PU学分</span>
                    <span class="little-title-info">拓展视野 开启新境界</span>
                </div>
                <div class="little-img">
                    <img src="<%=request.getContextPath()%>/static/images/products/pu.png" alt="">
                </div>
            </div>
        </div>
        <script>
            function displayPUPreview() {
                event.preventDefault();
                const pu_content = document.getElementById("pu-content");
                const pu_button = document.getElementById("pu-button");
                const real_content = document.getElementById("real-content");
                const real_button = document.getElementById("real-button");
                const special_content = document.getElementById("special-content");
                const special_button = document.getElementById("special-button");
                pu_button.classList.add('active');
                real_button.classList.remove('active');
                special_button.classList.remove('active');

                pu_content.style.display = "flex";
                real_content.style.display = "none";
                special_content.style.display = "none";

            }

            function displayRealPreview() {
                event.preventDefault();
                const real_content = document.getElementById("pu-content");
                const real_button = document.getElementById("pu-button");
                const pu_content = document.getElementById("real-content");
                const pu_button = document.getElementById("real-button");
                const special_content = document.getElementById("special-content");
                const special_button = document.getElementById("special-button");
                pu_button.classList.add('active');
                real_button.classList.remove('active');
                special_button.classList.remove('active');

                pu_content.style.display = "flex";
                real_content.style.display = "none";
                special_content.style.display = "none";
            }

            function displaySpecialPreview() {
                event.preventDefault();
                const special_content = document.getElementById("pu-content");
                const special_button = document.getElementById("pu-button");
                const real_content = document.getElementById("real-content");
                const real_button = document.getElementById("real-button");
                const pu_content = document.getElementById("special-content");
                const pu_button = document.getElementById("special-button");
                pu_button.classList.add('active');
                real_button.classList.remove('active');
                special_button.classList.remove('active');

                pu_content.style.display = "flex";
                real_content.style.display = "none";
                special_content.style.display = "none";
            }
        </script>
        <div class="recommend-content">
            <div class="top-button-content">
                <a class="product-button" id="pu-button" onclick="displayPUPreview()" href="#">
                    PU学分
                </a>
                <a class="product-button" id="real-button" onclick="displayRealPreview()" href="#">
                    实物奖品
                </a>
                <a class="product-button" id="special-button" onclick="displaySpecialPreview()" href="#">
                    特权权益
                </a>

            </div>
            <div class="products-content" id="pu-content">
                <%
                    int cnt = 0;
                    for (Product product: puProductsPreview) {
                        if(cnt ++ > 5)break;
                %>
                <div class="product-block">
                    <div class="product-block-cover">
                        <img src="<%=product.getCoverPath()%>" alt="">
                    </div>
                    <div class="product-block-title">
                        <span style="font-size: 18px;margin-bottom: 6%;font-weight: bold;"><%=product.getProductName()%></span>
                        <span style="font-size: 14px;">所需积分：<%=product.getScorePrice()%></span>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="products-content" id="real-content" style="display: none">
                <%
                    cnt = 0;
                    for (Product product: realProductsPreview) {
                        if(cnt ++ > 5)break;
                %>
                <div class="product-block">
                    <div class="product-block-cover">
                        <img src="<%=product.getCoverPath()%>" alt="">
                    </div>
                    <div class="product-block-title">
                        <span style="font-size: 18px;margin-bottom: 6%;font-weight: bold;"><%=product.getProductName()%></span>
                        <span style="font-size: 14px;">所需积分：<%=product.getScorePrice()%></span>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="products-content" id="special-content" style="display: none">
                <%
                    cnt = 0;
                    for (Product product: specialPowerPreview) {
                        if(cnt ++ > 5)break;
                %>
                <div class="product-block">
                    <div class="product-block-cover">
                        <img src="<%=product.getCoverPath()%>" alt="">
                    </div>
                    <div class="product-block-title">
                        <span style="font-size: 18px;margin-bottom: 6%;font-weight: bold;"><%=product.getProductName()%></span>
                        <span style="font-size: 14px;">所需积分：<%=product.getScorePrice()%></span>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>

</div>
</body>
</html>
<script>

    function displayProductsPreview(products) {
        event.preventDefault();
        const productContainer = document.querySelector('.product-content');
        console.log(products.get(0).toString());
        // productContainer.innerHTML = '';
        <%--if (products && products.length > 0) {--%>
        <%--    const maxProducts = Math.min(5, products.length);--%>
        <%--    for (let i = 0; i < maxProducts; i++) {--%>
        <%--        const product = products[i];--%>
        <%--        const productBlock = document.createElement('div');--%>
        <%--        productBlock.classList.add('product-block');--%>
        <%--        // 在此处根据产品信息的属性填充产品块的内容--%>
        <%--        productBlock.innerHTML = `<p>${product.name}</p><p>${product.description}</p>`; // 示例，根据实际情况修改--%>
        <%--        productContainer.appendChild(productBlock);--%>
        <%--    }--%>
        <%--} else {--%>
        <%--    // 如果没有产品信息--%>
        <%--    const noProductMessage = document.createElement('p');--%>
        <%--    noProductMessage.textContent = '暂无产品信息';--%>
        <%--    productContainer.appendChild(noProductMessage);--%>
        <%--}--%>
    }
</script>