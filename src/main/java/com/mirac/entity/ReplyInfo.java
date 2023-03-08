package com.mirac.entity;

import java.util.Date;

/**
 * 
 * @Description: 回帖信息类（联表查询）
 *
 */
public class ReplyInfo {
	
	private int replyid;
	private int msgid;
	private String replycontents;
	private Date replytime;
	private String replyip;
	private int userid;
	private String username;		// 回帖人姓名
	private String realname;		// 回帖人昵称
	private String sex;				// 回帖人性别
	private String city;			// 回帖人城市
	
	public int getReplyid() {
		return replyid;
	}
	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getReplycontents() {
		return replycontents;
	}
	public void setReplycontents(String replycontents) {
		this.replycontents = replycontents;
	}
	public Date getReplytime() {
		return replytime;
	}
	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}
	public String getReplyip() {
		return replyip;
	}
	public void setReplyip(String replyip) {
		this.replyip = replyip;
	}
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "ReplyInfo [replyid=" + replyid + ", msgid=" + msgid + ", replycontents=" + replycontents
				+ ", replytime=" + replytime + ", replyip=" + replyip + ", userid=" + userid + ", username=" + username
				+ ", realname=" + realname + ", sex=" + sex + ", city=" + city + "]";
	}
}
