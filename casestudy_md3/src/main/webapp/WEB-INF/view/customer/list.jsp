<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/29/2024
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/utils/bootstrap.jsp" %>
<%@include file="/WEB-INF/utils/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <style>
        .container{
            margin-top: 200px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Danh Sách Khách Hàng</h1>
    <button class="btn btn-primary m-4" onclick="window.location.href='/customer?action=create'">Add New</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Tuổi</th>
            <th>Điện Thoại</th>
            <th>Email</th>
            <th colspan="2">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customers}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${customer.name}</td>
                <td>${customer.age}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>
                    <button class="btn btn-warning"
                            onclick="window.location.href='/customer?action=update&id=${customer.id}'">Update
                    </button>
                </td>
                <td>
                    <button class="btn btn-danger"
                            onclick="window.location.href='/customer?action=delete&id=${customer.id}'">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
