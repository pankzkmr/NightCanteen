package com.pankzkmr;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cartDAO")
public class cartDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void getSelected(HttpServletRequest request, HttpSession session)
			throws ClassNotFoundException, SQLException, IOException {

//		ArrayList<Product> productarray2 = new ArrayList<Product>();
//		ArrayList<Product> productarray = (ArrayList<Product>) session.getAttribute("productList");
//		int total = productarray.size();
//		for(int i=0; i<total; i++) {
//			if(request.getParameter(String.valueOf((productarray.get(i)).getProduct_id())).equals("ADD")) {
//				productarray2.add(productarray.get(i));
//			}
//		}
//		session.setAttribute("productList2", productarray2);	
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
		DataBase connection = new DataBase(url);
		connection.getAccess("root", "1251");
		ResultSet result = connection.getResult("select * from product");
		List<Product> productarray2 = new ArrayList<Product>();
		int product_id;
		String product_name;
		int price;
		Blob imageBlob;
		String base64Image;
		String product_id_string;
//		System.out.println(request.getParameter("1001"));
//		System.out.println(request.getParameter("1002"));
//		System.out.println(request.getParameter("1003"));
//		System.out.println(request.getParameter("1004"));
		String add = "ADD";
		String condition;
		boolean isEmpty = true;
		while (result.next()) {
			product_id_string = "" + (result.getInt("product_id"));
			System.out.println(product_id_string);
			condition = (String) request.getParameter(product_id_string);
			System.out.println(request.getParameter(product_id_string));

			if (add.equals(condition)) {
				product_id = result.getInt("product_id");
				product_name = result.getString("product_name");
				price = result.getInt("price");
				imageBlob = result.getBlob("product_image");
				base64Image = connection.getImage(imageBlob);
//					product_cat = result.getInt("product_cat");

				Product product_temp = new Product(product_id, product_name, base64Image, price, 0);
				productarray2.add(product_temp);
				isEmpty = false;
			}
		}
		if(isEmpty == true) {
			if(session.getAttribute("productList2") == null) {
				session.setAttribute("isEmpty", true);
				return;
			}
			else {
				session.setAttribute("isEmpty", false);
				return;
			}
		}
		else {
			session.setAttribute("isEmpty", false);
			session.setAttribute("productList2", productarray2);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			try {
				getSelected(request, session);
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("error in cartDAO");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} else {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		response.getWriter().println("Can't proceed further with get method. :(  ");
	}

}
