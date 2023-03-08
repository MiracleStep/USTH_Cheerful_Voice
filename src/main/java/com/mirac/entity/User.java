package com.mirac.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 
 * @Description: 用户信息实体类
 *
 */
public class User implements Cloneable{
	private int userid;
	private String username;
	private String password;
	private String realname;
	private String sex;
	private String hobbys;
	private String birthday;
	private String city;
	private String email;
	private String qq;
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	private Date createtime;
	private int state;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHobbys() {
		return hobbys;
	}
	public void setHobbys(String hobbys) {
		this.hobbys = hobbys;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", realname=" + realname
				+ ", sex=" + sex + ", hobbys=" + hobbys + ", birthday=" + birthday + ", city=" + city + ", email="
				+ email + ", qq=" + qq + ", createtime=" + createtime + "]";
	}
	
	@Override
	public User clone() {
		User user = null;
		try {
			user = (User) super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
