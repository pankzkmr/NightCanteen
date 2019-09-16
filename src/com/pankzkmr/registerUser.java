package com.pankzkmr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/registerUser")
public class registerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static String url = "jdbc:mysql://localhost:3306/nightcanteen";
	protected static String uname = "root";
	protected static String passwd = "1251";

	protected void DBC(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		String name = request.getParameter("name");
		String regNo = request.getParameter("regNo");
		String branch = request.getParameter("branch");
		String flank = request.getParameter("flank");
		String roomNo = request.getParameter("roomNo");
		String phoneNo = request.getParameter("phoneNo");
		String password = request.getParameter("password");
		String image = request.getParameter("pic");
		System.out.println(image);
		String tableName = "profile";
		String tableName2 = "branch_table";
		String tableName3 = "logindata";
		String query = "insert into " + tableName + " values (?,?,?,?,?,?)";
		String query2 = "select branch_id from " + tableName2 + " where branch = \"" + branch + "\"";
		String query3 = "insert into " + tableName3 + " values (?,?)";
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(url, uname, passwd);
		Statement statement2 = connection.createStatement();
		ResultSet rs = statement2.executeQuery(query2);
		rs.next();
		int branch_id = rs.getInt("branch_id");
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, Integer.parseInt(regNo));
		statement.setString(2, name);
		statement.setString(3, flank);
		statement.setInt(4, Integer.parseInt(roomNo));
		statement.setString(5, phoneNo);
		statement.setInt(6, branch_id);
		int n = statement.executeUpdate();
		System.out.println(n + "row/s affected by query1");
		statement = connection.prepareStatement(query3);
		statement.setInt(1, Integer.parseInt(regNo));
		statement.setString(2, password);
		n = statement.executeUpdate();
		System.out.println(n + "row/s affected by query1");
		statement2.close();
		statement.close();
		connection.close();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc = this.getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
		request.setAttribute("login", true);
		request.setAttribute("message", "Thanks for registration!");
		rd.include(request, response);
		PrintWriter out = response.getWriter();
		try {
			DBC(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			out.println("error in registerUser");
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
