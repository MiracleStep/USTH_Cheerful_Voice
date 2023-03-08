package com.mirac.entity;

/**
 
 * @Description: 管理员信息实体类

 */

//构建了一个Admin类，并且实现了java.lang.Cloneable接口，类可以被克隆

public class Admin implements Cloneable{
	private int id;			// id
	private String name;	// 账号
	private String pwd;		// 密码
	private int authority;	// 权力
	
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	
	@Override
	public Admin clone() {
		Admin admin = null;
		try{
			admin = (Admin)super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return admin;
	}
}
