<%-- 
    Document   : select-data
    Created on : Jul 11, 2018, 1:18:09 PM
    Author     : arie
--%>
<!DOCTYPE HTML>
<html>
<head></head>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<body>

<%
String _userid=request.getParameter("userid");
String _username=request.getParameter("username");
String _password=request.getParameter("password");
String _role=request.getParameter("role");
String _gender=request.getParameter("gender");
String _name=request.getParameter("name");
String _identifier=request.getParameter("identifier");
//String _stdepart="1";
//String _starrive="2";
//String _departure="2018-07-28";
%>
<% 
Connection con;
Statement stmt;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/trendb","akar","akarpohon");
            stmt = con.createStatement();

            PreparedStatement stmts = con.prepareStatement("INSERT INTO `user`(`user_id`, `username`, `password`, `role`, `gender`, `name`, `ident`) "
                    + "VALUES (?,?,?,?,?,?,?)");

            stmts.setString(1, _userid);
            stmts.setString(2, _username);
            stmts.setString(3, _password);
            stmts.setString(4, _role);
            stmts.setString(5, _gender);
            stmts.setString(6, _name);
            stmts.setString(7, _identifier);


            int i = stmts.executeUpdate();
            out.print("SUCCESS");
        }catch (Exception E){
            E.printStackTrace();
            out.print("NOT ADDED");
            out.print(_userid + _username + _password + _role + _gender + _name + _identifier);
        } %>
                                            </body>
</html>

                
