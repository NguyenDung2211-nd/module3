<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/26/2024
  Time: 2:21 PM
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
<div class="container" style="margin-top: 30px">
    <h1 style="text-align: center">Cập nhật sản phẩm</h1>
    <form action="/product?action=update" method="post">
        <input type="hidden" name="id" value="${product.id}" />

        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="name" name="name" value="${product.name}" required />
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Giá</label>
            <input type="number" class="form-control" id="price" name="price" value="${product.price}" required />
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Mô tả</label>
            <input type="text" class="form-control" id="description" name="description" value="${product.description}" required />
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="/product" class="btn btn-secondary">Hủy</a>
    </form>
</div>
</body>
</html>
