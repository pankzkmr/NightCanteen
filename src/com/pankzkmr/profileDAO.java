package com.pankzkmr;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profileDAO")
public class profileDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void DBC(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ClassNotFoundException, SQLException {
		String name = (String)session.getAttribute("name");
		int reg_no = (int)session.getAttribute("reg_no");
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
		DataBase connection = new DataBase(url);
		connection.getAccess("root", "1251");
		ResultSet result = connection.getResult("select * from profile where reg_no = "+ reg_no);
		result.next();
		System.out.println("a");
		String flank = result.getString("flank");
		System.out.println("a");
		String phone_no = result.getString("phone_no");
		System.out.println("a");
		int room_no = result.getInt("room_no");
		System.out.println("a");
		int branch_id = result.getInt("branch_id");
		System.out.println("a");
		result.close();
		System.out.println("a");
		connection.getAccess("root", "1251");
		System.out.println("a");
		result = connection.getResult("select branch from branch_table where branch_id = "+ branch_id);
		System.out.println("a");
		result.next();
		System.out.println("a");
		String branch = result.getString("branch");
		String room_no_string = correctRoomNo(room_no, flank);
		String phone_no_hidden = correctPhoneNo(phone_no);
		session.setAttribute("phone_no", phone_no_hidden);
		session.setAttribute("room_no", room_no_string);
		session.setAttribute("branch", branch);
		System.out.println(name);
		System.out.println(reg_no);
		System.out.println(phone_no);
		System.out.println(room_no);
		System.out.println(branch);
	}
	
	private String correctPhoneNo(String phone_no) {
		return "*******"+phone_no.substring(7);
	}

	private String correctRoomNo(int room_no, String flank) {
		if(room_no > 0 && room_no < 10)	
			return flank+"-00"+room_no;
		else if(room_no >= 10 && room_no <100)
			return flank+"-0"+room_no;
		else
			return flank+"-"+room_no;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			try {
				DBC(request, response, session);
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("error in profileDAO.java" + e);
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
