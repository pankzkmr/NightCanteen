package com.pankzkmr;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/order_history")
public class order_history extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null) {
			try {
				DBC(request, response, session);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("order_history.jsp").forward(request, response);
		}
		else {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	private void DBC(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
		DataBase connection = new DataBase(url);
		connection.getAccess("root", "1251");
		ResultSet result = connection.getResult("select * from "+session.getAttribute("reg_no")+"oh");
		List<Order> orderhistory = new ArrayList<Order>();
		while(result.next()) {
			String order_id = result.getString("order_id");
			int total = result.getInt("total");
			orderhistory.add(correctDateTime(order_id, total));
		}
		Collections.reverse(orderhistory);
		session.setAttribute("orderhistory", orderhistory);
		connection.close();
	}

	private Order correctDateTime(String order_id, int total) {
		String Date = order_id.substring(4, 6)+"/"+order_id.substring(2, 4)+"/20"+order_id.substring(0, 2);
		String Time = order_id.substring(6, 8)+":"+order_id.substring(8,10);
		Order temp_order = new Order(Date, Time, order_id, total);
		return temp_order;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
