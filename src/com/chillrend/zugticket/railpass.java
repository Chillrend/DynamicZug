package com.chillrend.zugticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@WebServlet(name = "railpass")
public class railpass extends HttpServlet {
    Connection conn;
    PreparedStatement stmt;
    Statement stat;
    String price;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String passName = request.getParameter("inputpassname");
        String days = request.getParameter("selectDays");
        String passengerName = request.getParameter("inputName");
        String identification = request.getParameter("inputPassport");
        String countryOrigin = request.getParameter("selectCountry");
        String dateStarted = request.getParameter("dateStart");

        DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
        Date dateStart = null;
        try{
            dateStart = format.parse(dateStarted);
        }catch (ParseException E){
            E.printStackTrace();
        }

        HttpSession sess = request.getSession();
        sess.setAttribute("passName", passName);
        sess.setAttribute("days", days);
        sess.setAttribute("passengerName", passengerName);
        sess.setAttribute("identification", identification);
        sess.setAttribute("dateStart", dateStart);
        sess.setAttribute("passName", passName);
        sess.setAttribute("countryOrigin", countryOrigin);
            sess.setAttribute("htm", 1);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb","akar","akarpohon");
            stat = conn.createStatement();
            stmt = conn.prepareStatement("SELECT price FROM railpass WHERE name=? AND days=?");
            stmt.setString(1, passName);
            stmt.setString(2, days);
            ResultSet rs = stmt.executeQuery();

            while(rs.next()){
                price = rs.getString(1);
}
            ResultSet res = stat.executeQuery("SELECT name FROM user WHERE username='" + (String) sess.getAttribute("username") + "';");
        }catch (Exception i){
            i.printStackTrace();
        }finally {
            if (conn != null){
                try{
                    conn.close();
                }catch (SQLException ex){
                    ex.printStackTrace();
                }
            }
            request.setAttribute("price", price);
            request.setAttribute("htm", 1);
            String nextResponse = "/payment.jsp";
            getServletContext().getRequestDispatcher(nextResponse).forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
