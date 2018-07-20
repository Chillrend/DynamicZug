package com.chillrend.zugticket;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Statement;



@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateUser() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String name = request.getParameter("name");
                String ident = request.getParameter("ident");
                int id = Integer.parseInt(Id);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendb?user=root&password=root");
			String query = "UPDATE user SET username='"+username+"',password='"+password+"',role='"+role+"',name='"+name+"',ident='"+ident+"' WHERE user_id="+id;
			PreparedStatement ps = con.prepareStatement(query);
			int count = ps.executeUpdate();
			
			if(count!=0){
				//out.println("<h1>data updated successfully</h1>");
				response.sendRedirect("http://localhost:8080/DynamicZug/DisplayUser");
			}
			else{
				System.out.println("<h2> Failed </h1>");
			}
			con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


}
