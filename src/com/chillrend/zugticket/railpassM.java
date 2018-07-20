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
import java.util.*;

@WebServlet(name = "/railpassM")
public class railpassM extends HttpServlet {
    Connection conn;
    PreparedStatement stmt;
    Statement stat;
    String price;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList passengerList = new ArrayList();
        ArrayList ident = new ArrayList();
        String passName = request.getParameter("inputpassname");
        String days = request.getParameter("selectDays");
        int htm;
        htm = Integer.parseInt(request.getParameter("htm"));
        String countryOrigin = request.getParameter("selectCountry");
        String dateStarted = request.getParameter("dateStart");
        for (int i=1;i<=htm;i++){ 
        passengerList.add(request.getParameter("nama" +  i));
        ident.add(request.getParameter("ident" + i)); 
        }
        String pricez = request.getParameter("price");
        DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
        Date dateStart = null;
        try{
            dateStart = format.parse(dateStarted);
        }catch (ParseException E){
            E.printStackTrace();
        }

//        railpasscontainer varContain = new railpasscontainer();

//        varContain.setPassName(passName);
//        varContain.setDays(days);
//        varContain.setPassengerName(passengerName);
//        varContain.setIdentification(identification);
//        varContain.setCountryOrigin(countryOrigin);
//        varContain.setDateStart(dateStart);

        HttpSession sess = request.getSession();
        sess.setAttribute("passName", passName);
        sess.setAttribute("days", days);
        sess.setAttribute("passengerName", passengerList);
        sess.setAttribute("identification", ident);
        sess.setAttribute("htm", htm);

        sess.setAttribute("dateStart", dateStarted);
        sess.setAttribute("passName", passName);
        sess.setAttribute("countryOrigin", countryOrigin);
        request.setAttribute("price", pricez);
        String nextResponse = "/payment.jsp";
        getServletContext().getRequestDispatcher(nextResponse).forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
