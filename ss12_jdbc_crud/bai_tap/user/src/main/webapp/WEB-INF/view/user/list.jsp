<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/27/2024
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/view/utils/bootstrap.jsp" %>
<%@include file="/WEB-INF/view/utils/narbar.jsp" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            padding-top: 30px;
        }

        .container {
            background-color: #FFFACD;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 28px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 300px;
            display: inline-block;
        }

        .btn {
            padding: 10px 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #565e64;
            border-color: #565e64;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: center;
            border: 2px solid black;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 2px solid black;
        }

        th {
            background-color: #f1f1f1;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh sách người dùng</h2>
    <c:if test="${not empty message}">
        <div class="alert alert-warning" role="alert">
                ${message}
        </div>
    </c:if>
    <form method="get" action="/user">
        <div class="form-group">
            <label for="country">Tìm kiếm theo quốc gia:</label>
            <input type="text" class="form-control" id="country" name="country"
                   placeholder="Nhập tên quốc gia bạn muốn tìm" style="width: 300px; display: inline-block;">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </div>
        <div>
            <form method="get" action="/user">
                <button type="submit" class="btn btn-secondary" name="action" value="sort">Sắp xếp theo tên</button>
            </form>
        </div>
    </form>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Quốc gia</th>
        </tr>
        </thead>
        <tbody>
        <%--        for(Student student: students)--%>
        <c:forEach items="${users}" var="user" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${user.getName()}</td>
                <td>${user.getEmail()}</td>
                <td>${user.getCountry()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
