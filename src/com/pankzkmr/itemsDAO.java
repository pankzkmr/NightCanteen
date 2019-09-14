package com.pankzkmr;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.*;

@WebServlet("/itemsDAO")
public class itemsDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> productarray = new ArrayList<Product>();
		String url = "jdbc:mysql://localhost:3306/nightcanteen";
		String uname = "root";
		String passwd = "1251";
		String table1 = "product";
		String table2 = "product_category";
		String query1 = "select count(*) from "+ table2;
		String query2 = "select * from "+ table1;
		String query3 = "select * from "+ table2;
//		String query4 = "select count(*) from "+ table1;
		Blob image = null;
		Connection con = null;
		int product_id;
		String product_name;
		int product_cat;
		int price;
		int index = 0;
		String base64Image;
		Statement statement = null;
		ResultSet rs = null;
//		PrintWriter out = response.getWriter();
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, uname, passwd);
		statement = con.createStatement();
		rs = statement.executeQuery(query1);
		rs.next();
		int total_no_category = rs.getInt(1);
		
		Pair[] productpair = new Pair[total_no_category];
		rs.close();
		rs = statement.executeQuery(query2);
		while(rs.next()) {
			System.out.println("a");
			product_id = rs.getInt("product_id");
			product_name = rs.getString("product_name");
			price = rs.getInt("price");
			image = rs.getBlob("product_image");
			product_cat = rs.getInt("product_cat");
			System.out.println("b");
			InputStream inputStream = image.getBinaryStream();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
            	outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
            inputStream.close();
            outputStream.close();
            Product product_temp = new Product(product_id, product_name, base64Image, price);
            productarray.add(product_temp);
           
            //imgData.add(image.getBytes(1,(int)image.length()));
		}
		rs.close();
		/*index = 0;
		rs = statement.executeQuery(query3);
		System.out.println("c");
		while(rs.next()) {
			System.out.println("d");
			productpair[index].setFirst(rs.getInt("product_cat"));
			System.out.println("e");

			productpair[index].setSecond(rs.getString("product_cat_name"));
		}*/
		request.setAttribute("productList", productarray);
		} catch (Exception e) {
		System.out.println("Unable To Display image");
		System.out.println("Image Display Error=" + e.getMessage());
		return;
		} finally {
		try {
		rs.close();
		statement.close();
		con.close();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		}
		RequestDispatcher rd = request.getRequestDispatcher("/items.jsp");
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
