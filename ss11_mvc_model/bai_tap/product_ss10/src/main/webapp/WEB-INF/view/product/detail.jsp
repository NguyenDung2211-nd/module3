<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/26/2024
  Time: 9:41 PM
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
  <h1>Chi tiết sản phẩm</h1>
  <table class="table">
    <tr>
      <th>ID:</th>
      <td>${product.getId()}</td>
    </tr>
    <tr>
      <th>Tên sản phẩm:</th>
      <td>${product.getName()}</td>
    </tr>
    <tr>
      <th>Giá:</th>
      <td>${product.getPrice()}</td>
    </tr>
    <tr>
      <th>Mô tả:</th>
      <td>${product.getDescription()}</td>
    </tr>
  </table>
  <button class="btn btn-secondary" onclick="window.location.href='/product'">Quay lại danh sách</button>
</div>
</body>
</html>
