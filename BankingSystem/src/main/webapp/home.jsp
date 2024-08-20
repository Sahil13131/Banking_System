<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banking Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        header h1 {
            margin: 0;
        }
        nav {
            background-color: #495057;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #343a40;
        }
        .container {
            padding: 0px;
        }
        .watermark {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 100px;
            color: rgba(0,0,0,0.05);
            z-index: -1;
        }
    </style>
</head>
<body>

    <header>
        <h1>BANKING SYSTEM</h1>
    </header>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="customers.jsp">Customers</a>
        <a href="transaction.jsp">Transactions</a>
        <a href="https://internship.thesparksfoundation.info/" target="_blank">Sparks Foundation</a>
    </nav>
    <div class="container">
        <div class="watermark">Bank</div>
        <img src="assets/images/bankk3.png" alt="Bank Image" class="bg"></body>
         <p>Empowering secure and seamless financial transactions with our user-friendly banking system. Experience efficient money transfers, reliable customer service, and robust security tailored to your needs.</p>
         </div>
</html>
