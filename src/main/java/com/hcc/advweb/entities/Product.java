package com.hcc.advweb.entities;

public class Product{
	private int id;
	private String name;
	private int status;
	private String price;
	private String image;
	private String shortname;
	
	public Product() {
		super();
	}
	
	public Product(int id, String name, int status, String price, String image, String shortname) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.price = price;
		this.image = image;
		this.shortname = shortname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
}
