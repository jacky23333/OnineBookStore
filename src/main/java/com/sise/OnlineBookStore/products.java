package com.sise.OnlineBookStore;

import java.io.Serializable;

public class products implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private double price;
	private int pnum;
	private String imgurl;
	private String description;
	private String category;
	private int insale;
	
	public products(int id, String name, double price, int pnum, String imgurl, String description, String category,
			int insale) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.pnum = pnum;
		this.imgurl = imgurl;
		this.description = description;
		this.category = category;
		this.insale = insale;
	}
	
	public products() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getInsale() {
		return insale;
	}

	public void setInsale(int insale) {
		this.insale = insale;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
