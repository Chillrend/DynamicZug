package com.chillrend.zugticket;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DisplayUser")
public class DisplayUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DisplayUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		
		Statement st;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb?user=root&password=root");
		
			ArrayList al=null;
			ArrayList userList =new ArrayList();
			String query = "select user_id,username,password,role,name,ident from user";
			st = conn.createStatement();
			ResultSet  rs = st.executeQuery(query);


			while(rs.next())
			{
				al  = new ArrayList();
				al.add(rs.getInt(1));
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
				al.add(rs.getString(5));
                                al.add(rs.getString(6));
                                userList.add(al);
			}

			request.setAttribute("userList",userList);
			
			RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/home1.jsp");
			dispatcher1.forward(request,response);
			
			conn.close();
			
		} catch (Exception e) {
		e.printStackTrace();
		} 
	}
}