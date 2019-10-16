package com.pankzkmr;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/finalDAO")
public class finalDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			try {

				DBC(session, request);
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("error in finalDAO");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("last");
			request.getRequestDispatcher("final.jsp").forward(request, response);
		} else {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void DBC(HttpSession session, ServletRequest request)
			throws SQLException, IOException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
		DataBase connection = new DataBase(url);
		connection.getAccess("root", "1251");
		ResultSet result = connection.getResult("select * from product");
		List<Product> productarray3 = new ArrayList<Product>();
		int product_id;
		String product_name;
		int price, quantity = 0, total = 0;
		String product_id_string;
		String remove = "REMOVE";
		String condition;

		boolean isEmpty = true;
		while (result.next()) {

			product_id_string = "" + (result.getInt("product_id"));
			condition = (String) request.getParameter(product_id_string);
			System.out.println(condition);
			if (!remove.equals(condition)) {
				price = result.getInt("price");
				if (request.getParameter(product_id_string + price) == null)
					quantity = 0;
				else {
					product_id = result.getInt("product_id");
					product_name = result.getString("product_name");
					quantity = Integer.parseInt(request.getParameter(product_id_string + price));
					System.out.println(quantity);
					total += quantity * price;
					Product product_temp = new Product(product_id, product_name, null, price, quantity);
					product_temp.setTotal(price * quantity);
					System.out.println(product_id);
					productarray3.add(product_temp);
					isEmpty = false;
				}
			}
		}
		session.removeAttribute("productList2");
		if (isEmpty == true) {
			session.setAttribute("isEmptyOrder", true);
			session.setAttribute("message", "whoops! you removed all products.");
		} else {
			session.setAttribute("isEmptyOrder", false);
			session.setAttribute("productOrdered", productarray3);
			session.setAttribute("message", "" + total);
			addOrderHistory(session, total, connection);
			return;
		}
	}

	private void addOrderHistory(HttpSession session, int total, DataBase connection) throws SQLException {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyMMddHHmmss");
		LocalDateTime now = LocalDateTime.now();
		String order_id = dtf.format(now) + session.getAttribute("reg_no");
		System.out.println(now);
		connection.getUpdate("create table if not exists "+session.getAttribute("reg_no")+"oh(order_id varchar(18) not null, total int not null)");
		int n = connection.prepareStatement("insert into "+session.getAttribute("reg_no")+"oh values(?,?)", order_id, total);
		System.out.println(n +"row/s affected");
		connection.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
