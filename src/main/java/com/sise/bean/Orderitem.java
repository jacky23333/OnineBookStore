package com.sise.bean;

import java.io.Serializable;

public class Orderitem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int order_id;
	private String product_id;
	private int buynum;
	public Orderitem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orderitem(int order_id, String product_id, int buynum) {
		super();
		this.order_id = order_id;
		this.product_id = product_id;
		this.buynum = buynum;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
