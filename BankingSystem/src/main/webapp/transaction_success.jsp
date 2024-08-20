<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 20px;
        }
        .options {
            margin-top: 30px;
        }
        .options a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 0 10px;
            font-weight: bold;
        }
        .options a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Transaction Successful</h1>
        <div class="options">
            <a href="home.jsp">HOME</a>
            <a href="transaction.jsp">VIEW TRANSACTION</a>
        </div>
    </div>
</body>
</html>
