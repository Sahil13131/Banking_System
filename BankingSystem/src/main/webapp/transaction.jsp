<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.banking.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transactions</title>
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <h1>Transaction History</h1>
    </header>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="customers.jsp">Customers</a>
        <a href="transaction.jsp">Transactions</a>
        <a href="https://internship.thesparksfoundation.info/" target="_blank">Sparks Foundation</a>
    </nav>
    <table>
        <tr>
            <th>Sr No</th>
            <th>Sender</th>
            <th>Receiver</th>
            <th>Amount</th>
            <th>Date and Time</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                conn = DBConnection.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT t.id, s.name AS sender, r.name AS receiver, t.amount, t.transaction_date FROM transactions t " +
                             "JOIN customers s ON t.sender_id = s.id " +
                             "JOIN customers r ON t.receiver_id = r.id";
                rs = stmt.executeQuery(sql);
                int count = 1;
                while (rs.next()) {
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= rs.getString("sender") %></td>
            <td><%= rs.getString("receiver") %></td>
            <td><%= rs.getDouble("amount") %></td>
            <td><%= rs.getTimestamp("transaction_date") %></td>
        </tr>
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
    </table>
</body>
</html>
