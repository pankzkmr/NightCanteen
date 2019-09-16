package com.pankzkmr;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.*;

@WebServlet("/itemsDAO")
public class itemsDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArrayList<Product> getProducts(ArrayList<Product> productarray, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
		HttpSession session = request.getSession();
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
//		String table1 = "product";
//		String table2 = "product_category";
//		String query1 = "select count(*) from " + table2;
//		String query2 = "select * from " + table1;
//		String query3 = "select * from " + table2;
//		String query4 = "select count(*) from "+ table1;
		DataBase connection = new DataBase(url);
		connection.getAccess("root", "1251");
		ResultSet result = connection.getResult("select * from product");
		Blob imageBlob = null;
		int product_id;
		String product_name;
//		int product_cat;
		int price;
		String base64Image;
		/*
		 * result.next(); // int total_no_category = result.getInt(1); result.close();
		 */
		while (result.next()) {
			product_id = result.getInt("product_id");
			product_name = result.getString("product_name");
			price = result.getInt("price");
			imageBlob = result.getBlob("product_image");
			base64Image = connection.getImage(imageBlob);
//				product_cat = result.getInt("product_cat");

			Product product_temp = new Product(product_id, product_name, base64Image, price, 0);
			productarray.add(product_temp);
		}
		result.close();
		session.setAttribute("productList", productarray);
		connection.close();
		return productarray;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			ArrayList<Product> productarray = new ArrayList<Product>();

			try {
				getProducts(productarray, request, response);
			} catch (ClassNotFoundException | SQLException e) {

				e.printStackTrace();
			}

			RequestDispatcher rd = request.getRequestDispatcher("/items.jsp");

			rd.forward(request, response);
		}
		else {
			request.setAttribute("login", true);
			request.setAttribute("message", "Please login first!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
