<%--
  Created by IntelliJ IDEA.
  User: HBH
  Date: 2023/12/20
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%String url=request.getContextPath()+"/mall/AllTask";%>
  <meta http-equiv="refresh" content="0;url=<%=url%>">
  <title>Title</title>
</head>
<body>
<%request.getRequestDispatcher(request.getContextPath()+"/mall/AllTask");%>
</body>
</html>
