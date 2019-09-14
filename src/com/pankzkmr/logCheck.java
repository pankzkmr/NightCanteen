package com.pankzkmr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/log_check")
public class logCheck extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    protected static String url = "jdbc:mysql://localhost:3306/nightcanteen";
	protected static String uname = "root";
	protected static String passwd = "1251";
	
	protected void DBC(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException, ServletException {
		String tableName = "logindata";
		String query = "select * from "+ tableName;
//		PrintWriter out = response.getWriter();
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(url, uname, passwd);
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query);
		String reg_no = request.getParameter("reg_no");
		String password = request.getParameter("password");
		while(rs.next()) {  
			if(Integer.parseInt(reg_no) == rs.getInt("reg_no") && password.equals(rs.getString("password"))) {
//				need to see this below Example name should be replaced by real name from database
				request.setAttribute("username", "Example_Name");
				ServletContext sc = this.getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/index.html");
				rd.include(request, response);
			}
				
		}
		statement.close();
		connection.close();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			DBC(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			out.println("error in logCheck.java");
			e.printStackTrace();
		}
		out.append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
