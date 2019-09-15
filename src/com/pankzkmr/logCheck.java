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
import javax.servlet.http.HttpSession;

@WebServlet("/log_check")
public class logCheck extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected static String url = "jdbc:mysql://localhost:3306/nightcanteen";
	protected static String uname = "root";
	protected static String passwd = "1251";

	protected void DBC(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException, ServletException {
		String table = "logindata";
		String table2 = "profile";
		int reg_no = Integer.parseInt(request.getParameter("reg_no"));
		String password = request.getParameter("password");
		String query = "select * from " + table;
		String query2 = "select name from " + table2 + " where reg_no = " + reg_no;
		boolean login = false;
//		PrintWriter out = response.getWriter();
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(url, uname, passwd);
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(query);
		while (rs.next()) {
			if (reg_no == rs.getInt("reg_no") && password.equals(rs.getString("password"))) {
				login = true;
				break;
			}
		}
		rs.close();
		if (login == true) {
//			need to see this below Example name should be replaced by real name from database
			rs = statement.executeQuery(query2);
			rs.next();
			HttpSession session = request.getSession();
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("reg_no", reg_no);
			System.out.println("welcome " + rs.getString("name"));
			ServletContext sc = this.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
			rd.include(request, response);
			rs.close();
		} 
		else {
			request.setAttribute("login", login);
			request.setAttribute("message", "Invalid username or password.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		statement.close();
		connection.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			DBC(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			out.println("error in logCheck.java");
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().println("Can't proceed further with get method. :(  ");
	}

}
