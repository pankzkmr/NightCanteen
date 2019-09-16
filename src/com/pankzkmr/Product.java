package com.pankzkmr;

public class Product {
	private int product_id;
	private String product_name;
	private String product_image;
	private int price;
	private int quantity;

	public Product(int product_id, String product_name, String product_image, int price, int quantity) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_image = product_image;
		this.price = price;
		this.quantity = quantity;
	}

	public int getProduct_id() {
		return product_id;
	}

	/*
	 * public void setProduct_id(int product_id) { this.product_id = product_id; }
	 */
	public String getProduct_name() {
		return product_name;
	}

	/*
	 * public void setProduct_name(String product_name) { this.product_name =
	 * product_name; }
	 */
	public String getProduct_image() {
		return product_image;
	}

	/*
	 * public void setProduct_image(String product_image) { this.product_image =
	 * product_image; }
	 */
	public int getPrice() {
		return price;
	}
	/*
	 * public void setPrice(int price) { this.price = price; }
	 */

	public int getQuantity() {
		return quantity;
	}

	/*
	 * public void setQuantity(int quantity) { this.quantity = quantity; }
	 */

}
