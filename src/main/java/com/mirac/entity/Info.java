package com.mirac.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 
 * @Description: 帖子实体类
 *
 */
public class Info {
	
	private int infoid;			// 帖ID
	private int userid;			// 发布人
	private String title;	// 帖子标题
	private String content;	// 帖子内容
	private String targeturl; //帖子url
	private String detail;
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	private Date infotime;		// 发帖时间
	private String infoip;		// 创建主题帖的人的IP
	private int state;			// 帖子状态

	@Override
	public String toString() {
		return "Info{" +
				"infoid=" + infoid +
				", userid=" + userid +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", targeturl='" + targeturl + '\'' +
				", detail='" + detail + '\'' +
				", infotime=" + infotime +
				", infoip='" + infoip + '\'' +
				", state=" + state +
				'}';
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getInfoid() {
		return infoid;
	}

	public void setInfoid(int infoid) {
		this.infoid = infoid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTargeturl() {
		return targeturl;
	}

	public void setTargeturl(String targeturl) {
		this.targeturl = targeturl;
	}

	public Date getInfotime() {
		return infotime;
	}

	public void setInfotime(Date infotime) {
		this.infotime = infotime;
	}

	public String getInfoip() {
		return infoip;
	}

	public void setInfoip(String infoip) {
		this.infoip = infoip;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
