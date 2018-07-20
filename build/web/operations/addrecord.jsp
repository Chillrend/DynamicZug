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
int identint = Integer.parseInt(_identifier);
String _email=request.getParameter("email");
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


            int i = stmt.executeUpdate("INSERT INTO user(user_id, username, password, role, gender, name, ident, email,city,zip,address) "
                    + "VALUES ('"+_userid+"','"+_username+"','"+_password+"','"+_role+"','"+_gender+"','"+_name+"','"+identint+"','"+_email+"','Koinzburg', '0000', 'Default')");
            out.print("SUCCESS");
        }catch (Exception E){
            E.printStackTrace();
            out.println(E.getMessage());
        } %>
                                            </body>
</html>

                
