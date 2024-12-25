<%--
  Created by IntelliJ IDEA.
  User: dung
  Date: 12/24/2024
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #FFFF99;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 400px;
            height: 470px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            border: 3px solid #fd9644 ;
            background-color:#FFFFCC;
        }

        h1 {
            color: #fd9644;
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            font-size: 14px;
            color: #333;
            vertical-align: middle;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            background-color: #fd9644;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        button:hover {
            background-color: #e27a3f;
        }

        p {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="/caculator" method="post">
        <table>
            <tr>
                <td colspan="2" style="text-align: center;"><h1>Product Discount Calculator</h1></td>
            </tr>
            <tr>
                <td>Product Description:</td>
                <td><input type="text" name="description" placeholder="Enter product description"></td>
            </tr>
            <tr>
                <td>List Price:</td>
                <td><input type="number" name="price" placeholder="Enter price"></td>
            </tr>
            <tr></tr>
            <tr>
                <td>Discount Percent:</td>
                <td><input type="number" name="discount" placeholder="Enter discount percent"></td>
            </tr>
            <tr></tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">Result</button>
                </td>
            </tr>
        </table>
        <c:if test="${not empty error}">
            <p style="color: red; font-weight: bold;">${error}</p>
        </c:if>
    </form>
    <p>Discount Amount : ${discountAmount}</p>
    <p>Discount Price : ${discountPrice}</p>
</div>
</body>
</html>
