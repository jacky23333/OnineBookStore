package com.sise.OnlineBookStore;

import java.io.Serializable;
import java.sql.Timestamp;
public class UserBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3868888051154148376L;
	private int id,state;
	private String username,password,gender,email,telephone,introduce,activeCode,role;
	private Timestamp registTime;

public UserBean() {
		super();
		// TODO Auto-generated constructor stub
	}


public UserBean(int id, int state, String username, String password, String gender, String email, String telephone,
		String introduce, String activeCode, String role, Timestamp registTime) {
	super();
	this.id = id;
	this.state = state;
	this.username = username;
	this.password = password;
	this.gender = gender;
	this.email = email;
	this.telephone = telephone;
	this.introduce = introduce;
	this.activeCode = activeCode;
	this.role = role;
	this.registTime = registTime;
}


@Override
public String toString() {
	return "User [id=" + id + ", state=" + state + ", username=" + username + ", password=" + password + ", gender="
			+ gender + ", email=" + email + ", telephone=" + telephone + ", introduce=" + introduce + ", activeCode="
			+ activeCode + ", role=" + role + ", registTime=" + registTime + "]";
}

public void setId(int id){
	this.id=id;
}
public int getId(){
	return id;
}
public void setUsername(String username){
	this.username=username;
}
public String getUsername(){
	return username;
}
public void setPassword(String password){
	this.password=password;
}
public String getPassword(){
	return password;
}
public void setGender(String gender){
	this.gender=gender;
}
public String getGender(){
	return gender;
}
public void setEmail(String email){
	this.email=email;
}
public String getEmail(){
	return email;
}
public void setTelephone(String telephone){
	this.telephone=telephone;
}
public String getTelephone(){
	return telephone;
}
public void setIntroduce(String introduce){
	this.introduce=introduce;
}
public String getIntroduce(){
	return introduce;
}
public void setActiveCode(String activeCode){
	this.activeCode=activeCode;
}
public String getActiveCode(){
	return activeCode;
}
public void setState(int state){
	this.state=state;
}
public int getState(){
	return state;
}
public void setRole(String role){
	this.role=role;
}
public String getRole(){
	return role;
}
public void setRegistTime(Timestamp registTime){
	this.registTime=registTime;
}
public Timestamp getRegistTime(){
	return registTime;
}
}