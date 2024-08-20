package com.banking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderId = request.getParameter("senderId");
        String receiverId = request.getParameter("receiverId");
        double amount = Double.parseDouble(request.getParameter("amount"));

        Connection conn = null;
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        PreparedStatement pst3 = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            pst1 = conn.prepareStatement("UPDATE customers SET current_balance = current_balance - ? WHERE id = ?");
            pst1.setDouble(1, amount);
            pst1.setString(2, senderId);
            pst1.executeUpdate();

            pst2 = conn.prepareStatement("UPDATE customers SET current_balance = current_balance + ? WHERE id = ?");
            pst2.setDouble(1, amount);
            pst2.setString(2, receiverId);
            pst2.executeUpdate();

            pst3 = conn.prepareStatement("INSERT INTO transactions (sender_id, receiver_id, amount) VALUES (?, ?, ?)");
            pst3.setString(1, senderId);
            pst3.setString(2, receiverId);
            pst3.setDouble(3, amount);
            pst3.executeUpdate();

            conn.commit();
            response.sendRedirect("transfer.jsp?id=" + senderId + "&success=true");
        } catch (Exception e) {
            if (conn != null) try { conn.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            e.printStackTrace();
            response.sendRedirect("transfer.jsp?id=" + senderId + "&error=true");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (pst1 != null) pst1.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (pst2 != null) pst2.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (pst3 != null) pst3.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
