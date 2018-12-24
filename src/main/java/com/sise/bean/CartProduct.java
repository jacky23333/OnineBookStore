package com.sise.bean;

import java.io.Serializable;

import com.sise.OnlineBookStore.products;

public class CartProduct implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private products product;
	private int count;
	public CartProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartProduct(products product, int count) {
		super();
		this.product = product;
		this.count = count;
	}
	public products getProduct() {
		return product;
	}
	public void setProduct(products product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public void addcount(int count) {
		this.count+=count;
	}
	
	
}
