<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.banking.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers</title>
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
        td a {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 5px 10px;
            border-radius: 5px;
        }
        td a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>Our Customers</h1>
    </header>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="customers.jsp">Customers</a>
        <a href="transaction.jsp">Transactions</a>
        <a href="https://internship.thesparksfoundation.info/" target="_blank">Sparks Foundation</a>
    </nav>
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Current Balance</th>
            <th>Action</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                conn = DBConnection.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM customers LIMIT 10";
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    double balance = rs.getDouble("current_balance");
        %>
        <tr>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><%= balance %></td>
            <td><a href="transfer.jsp?id=<%= id %>">Pay</a></td>
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
