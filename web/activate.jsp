<%-- 
    Document   : activate
    Created on : Jul 15, 2018, 12:29:58 AM
    Author     : arie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center><h1 style='font-face:"Segoe UI";'>
    <%
    String activator = request.getParameter("suuid");    
    Connection con;
    Statement stmt;
            try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "akar", "akarpohon");
            stmt = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM invoicepass WHERE inv_id=?");

            ps.setString(1, activator);

            ResultSet rs = ps.executeQuery();
            ResultSet rs1;

            if (rs.next()) {
            out.print("YOU MAY PASS");
                }
             else {
            out.print("INVALID PASS");
            }

        } catch (Exception e) {

        }
    %>    </h1></center></body>
</html>
