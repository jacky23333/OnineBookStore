package com.sise.bean;

import java.io.Serializable;

public class ReceiverInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String receiverPhone;
	private String receiverName;
	private String receiverAddress;
	public ReceiverInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReceiverInfo(String receiverPhone, String receiverName, String receiverAddress) {
		super();
		this.receiverPhone = receiverPhone;
		this.receiverName = receiverName;
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
