/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chillrend.zugticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author X453SA
 */
public class zugLogin extends HttpServlet {
    Statement stmt = null;
    Connection con = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String uname = request.getParameter("uname");
        String password = request.getParameter("pwd");
        
        //Connect DB
        
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/trendb","akar","akarpohon");  
            stmt = con.createStatement();
            
            PreparedStatement ps = con.prepareStatement("SELECT username,password,role FROM user WHERE username=? AND password=?;");
            
            ps.setString(1, uname);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                String role = rs.getString(3);
                if(role == "admin"){
                    response.setContentType("text/html");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("admin");
                }else if(role == "user"){
                    response.setContentType("text/html");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("user");
                }else{
                   response.setContentType("text/html");
                   response.setCharacterEncoding("UTF-8");
                   response.getWriter().write("user"); 
                }
                HttpSession session = request.getSession();
                session.setAttribute("username", uname);
                session.setAttribute("role", role);
                session.setMaxInactiveInterval(1500);
            }else{
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("unauthorized");
            }
        }catch (Exception E){
            E.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
