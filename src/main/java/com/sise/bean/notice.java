package com.sise.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class notice implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int n_id;
	private String title;
	private String details;
	private Timestamp n_time;
	public notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public notice(int n_id, String title, String details, Timestamp n_time) {
		super();
		this.n_id = n_id;
		this.title = title;
		this.details = details;
		this.n_time = n_time;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Timestamp getN_time() {
		return n_time;
	}
	public void setN_time(Timestamp n_time) {
		this.n_time = n_time;
	}

}
