<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.banking.DBConnection" %>
<%
    String customerId = request.getParameter("id");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String name = "", email = "";
    double balance = 0;
    try {
        conn = DBConnection.getConnection();
        stmt = conn.createStatement();
        String sql = "SELECT * FROM customers WHERE id=" + customerId;
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            balance = rs.getDouble("current_balance");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Money</title>
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
            margin: 20px auto;
            width: 80%;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="text"], .form-group select {
            width: 100%;
            padding: 10px;
            margin: 0;
            box-sizing: border-box;
        }
        .actions {
            margin-top: 20px;
        }
        .actions button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .actions button:hover {
            background-color: #45a049;
        }
        .actions a {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-left: 10px;
        }
        .actions a:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <header>
        <h1>Transfer Money</h1>
    </header>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="customers.jsp">Customers</a>
        <a href="transaction.jsp">Transactions</a>
        <a href="https://internship.thesparksfoundation.info/" target="_blank">Sparks Foundation</a>
    </nav>
    <div class="container">
        <h2>Transfer From: <%= name %> (Balance: <%= balance %>)</h2>
        <form action="TransferServlet.java" method="post">
            <input type="hidden" name="senderId" value="<%= customerId %>">
            <div class="form-group">
                <label for="receiverId">Select Customer to Transfer To:</label>
                <select name="receiverId" id="receiverId" required>
                    <%
                        try {
                            conn = DBConnection.getConnection();
                            stmt = conn.createStatement();
                            String sql = "SELECT id, name FROM customers WHERE id != " + customerId;
                            rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                    %>
                    <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="amount">Amount to Transfer:</label>
                <input type="text" name="amount" id="amount" required>
            </div>
            <div class="actions">
                <button type="submit">Pay</button>
                <a href="customers.jsp">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
