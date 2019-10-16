package com.pankzkmr;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/modifyDAO")
public class modifyDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			try {
				modify(request, response, session);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("sdf");
			ServletContext sc = this.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/profileDAO");
			rd.include(request, response);
		}
		else {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void modify(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ClassNotFoundException, SQLException {
		String name = request.getParameter("name");
		String reg_no = request.getParameter("regNo");
		String branch = request.getParameter("branch");
		String flank = request.getParameter("flank");
		String room_no = request.getParameter("roomNo");
		String phone_no = request.getParameter("phoneNo");
//		Statement statement2 = connection.createStatement();
//		ResultSet rs = statement2.executeQuery(query2);
//		rs.next();
//		int branch_id = rs.getInt("branch_id");
		if(phone_no == "") 
			phone_no = (String) session.getAttribute("phone");
		String query2 = "select branch_id from branch_table where branch = '" + branch + "'";
		System.out.println("modify");
		System.out.println(name);
		System.out.println(reg_no);
		System.out.println(branch);
		System.out.println(flank);
		System.out.println(room_no);
		System.out.println(phone_no);
		session.setAttribute("name", name);
		session.setAttribute("reg_no", reg_no);
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
		DataBase connection = new DataBase(url);
		connection.getAccess("root", "1251");
		ResultSet result = connection.getResult(query2);
		result.next();
		int branch_id = result.getInt("branch_id");
		String query = "update profile set name = '"+name+"', reg_no = "+reg_no+", branch_id = "+branch_id+", flank = '"+flank+"', room_no = "+room_no+", phone_no = '"+phone_no+"' where reg_no = " + reg_no;                                                        
		int n = connection.getUpdate(query);
		System.out.println(n + " row/s affected");
	}

//	private String phoneNoQ(String phone_no, HttpSession session) {
//		if(phone_no == null || phone_no == (String) session.getAttribute("phone")) {
//			return null;
//		}
//		return "phone_no = '" +phone_no +"'";
//	}
//
//	private String roomNoQ(String room_no, HttpSession session) {
//		if(room_no == (String) session.getAttribute(""))
//		return null;
//	}
//
//	private String flankQ(String flank) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	private String branchQ(String branch) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	private String regNoQ(String reg_no) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	private String nameQ(String name) {
//		if()
//		return null;
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
