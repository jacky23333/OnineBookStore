package com.sise.bean;

import java.io.Serializable;
import java.util.Vector;

public class Orders implements Serializable{
	private OrderInfo orderInfo;
	private Vector<CartProduct> orderitem;
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(OrderInfo orderInfo, Vector<CartProduct> orderitem) {
		super();
		this.orderInfo = orderInfo;
		this.orderitem = orderitem;
	}
	public OrderInfo getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}
	public Vector<CartProduct> getOrderitem() {
		return orderitem;
	}
	public void setOrderitem(Vector<CartProduct> orderitem) {
		this.orderitem = orderitem;
	}
	
	
}
