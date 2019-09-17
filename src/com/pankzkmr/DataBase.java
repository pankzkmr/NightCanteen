package com.pankzkmr;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

public class DataBase {
	private String url;
	private Connection connection;
	private Statement statement;

	public DataBase(String url) {
		this.url = url;
	}


	public void getAccess(String username, String password) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
		
	}
	
	public ResultSet getResult(String query) throws SQLException {
		statement = connection.createStatement();
		return statement.executeQuery(query);
	}
	
	public String getImage(Blob imageBlob) throws IOException, SQLException {
		InputStream inputStream = imageBlob.getBinaryStream();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, bytesRead);
		}
		byte[] imageBytes = outputStream.toByteArray();
		String base64Image = Base64.getEncoder().encodeToString(imageBytes);
		inputStream.close();
		outputStream.close();
		return base64Image;
	}

	public void close() throws SQLException {
		connection.close();
		statement.close();
	}


	public int getUpdate(String query) throws SQLException {
		return statement.executeUpdate(query);
	}


	public int prepareStatement(String query, String order_id, int total) throws SQLException {
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, order_id);
		statement.setInt(2, total);
		return statement.executeUpdate();		
	}
}
