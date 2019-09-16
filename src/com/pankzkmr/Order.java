package com.pankzkmr;

public class Order {
	private String date;
	private String time;
	private String order_id;
	private int total;
	
	
	
	public Order(String date, String time, String order_id, int total) {
		this.date = date;
		this.time = time;
		this.order_id = order_id;
		this.total = total;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

}
