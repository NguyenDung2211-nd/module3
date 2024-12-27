<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/26/2024
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/view/utils/bootstrap.jsp" %>
<%@include file="/WEB-INF/view/utils/navbar.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h2>Thêm mới sản phẩm</h2>
    <form method="post">
        <div class="form-group">
            <label for="name">Tên:</label>
            <input type="text" class="form-control" id="name" name="name">

        </div>
        <div class="form-group">
            <label for="price">Giá:</label>
            <input type="number" class="form-control" id="price" name="price">

        </div>
        <div class="form-group">
            <label for="description">Mô tả:</label>
            <input type="text" class="form-control" id="description" name="description">
        </div>
        <div>
        <button type="submit" class="btn btn-primary">Thêm mới</button>
        </div>
    </form>
    <c:if test="${not empty message}">
        <p style="color: red;">${message}</p>
    </c:if>
</div>
</body>
</html>
