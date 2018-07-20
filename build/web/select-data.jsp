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
String _stdepart=request.getParameter("std");
String _starrive=request.getParameter("sta");
String _departure=request.getParameter("dpt");
//String _stdepart="1";
//String _starrive="2";
//String _departure="2018-07-28";
%>
<% 

try
{
Connection dbc = null; //Make connection to the database
ResultSetMetaData md;
Class.forName("com.mysql.jdbc.Driver");
String query="SELECT ticket.tkt_id,series.name,ticket.std_id,ticket.sta_id,ticket.date_depart,ticket.price,ticket.time_depart "
                                + "    FROM ticket,train,series WHERE ticket.std_id ='" + _stdepart + "' AND ticket.sta_id = '" + _starrive + "' AND ticket.date_depart = '" + _departure + "' "
                                + "AND ticket.tr_id = train.tr_id AND series.id = train.series_id";
dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb", "root", "root");
Statement stmt=dbc.createStatement();
if (dbc != null) 
{
  
}
ResultSet rs = stmt.executeQuery(query);
if (!rs.first()) {
        out.print("<tr><td colspan='6'>no result found</td></tr>");
      } else {

do{ %>  <tr>
                                    <td>
                                        <div class="form-check">
                                        <input type="radio" class="form-check-input" name="tktid" id="tktid<%out.print(rs.getInt("tkt_id"));%>" value="<%out.print(rs.getInt("tkt_id"));%>">
                                        <label for="tktid<%out.print(rs.getInt("tkt_id"));%>" class="label-table"></label>
                                    </td>
</div>
                                    <%

out.print("<td>" + rs.getInt("tkt_id") + "</td>"); 
 out.print("<td>" + rs.getString("name") + "</td>");
 out.print("<td>" + rs.getString("date_depart") + "</td>");
out.print("<td>" + rs.getString("time_depart") + "</td>");
out.print("<td>" + rs.getString("price") + "</td>");
out.print("</tr>");                           
}
while (rs.next()); 
out.print("<tr><td colspan='6'><input type='submit' class='btn btn-red lanjut ea' id='ikuzo' type='button' value='Order Now' /></td></tr>");
%>

<% } %>

<%
    rs.close();
    stmt.close();
    dbc.close();
    }
catch(Exception e){
    e.printStackTrace();
    }%>

                                            </body>
</html>

                
