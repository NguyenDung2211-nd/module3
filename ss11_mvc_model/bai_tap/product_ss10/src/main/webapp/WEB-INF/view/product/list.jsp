<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/26/2024
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/view/utils/bootstrap.jsp" %>
<%@include file="/WEB-INF/view/utils/navbar.jsp" %>

<html>
<head>
    <title>Title</title>
    <style>
        body {
            background-color: #EEE8AA;
        }
        .container {
            margin-top: 30px;
        }
         .btn-info, .btn-warning, .btn-danger {
            width: 80%;
        }
         tr,td,th{
             border: 1px solid black;
         }
        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
            border: 2px solid black;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;

        }
        .toast-body {
            font-size: 14px;
        }
        .alert {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 30px">

    <form action="/product" method="get" style="margin-bottom: 20px;">
        <input type="hidden" name="action" value="search">
        <input type="text" name="name" placeholder="Tìm sản phẩm theo tên" class="form-control" style="width: 300px; display: inline-block;">
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>
    <button class="btn btn-primary m-4" onclick="window.location.href='/product?action=create'">Thêm mới</button>
    <c:if test="${message != null}">
        <div class="alert alert-warning" role="alert" style="text-align: center;">
                ${message}
        </div>
    </c:if>
    <table class="table table-hover" >
        <thead>
        <h1 style="text-align: center">Quản lí sản phẩm</h1>
        <tr>
            <th>Id</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Mô tả</th>
            <th colspan="3" style="text-align: center;">Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>
                    <a href="/product?action=update&id=${product.id}" class="btn btn-warning">Cập nhật</a>
                </td>
                <td>
                    <button class="btn btn-danger"
                            onclick="if(confirm('Bạn có chắc muốn xóa sản phẩm này?'))
                                    window.location.href='/product?action=delete&id=${product.getId()}';">
                        Xóa
                    </button>
                </td>
                <td>
                    <a href="/product?action=detail&id=${product.getId()}" class="btn btn-info">Xem chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty products}">
            <tr>
                <td colspan="5" style="text-align: center;">Không có sản phẩm nào được tìm thấy.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <c:if test="${message !=null}">
        <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="opacity: 1" id="notification">
            <div class="toast-header">
                <strong class="me-auto">Thông báo</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                    ${message}
            </div>
        </div>
    </c:if>
</div>
</body>
<script>
    setTimeout(function () {
        document.getElementById("notification").classList.add("d-none")
    }, 4000)
</script>
</html>
