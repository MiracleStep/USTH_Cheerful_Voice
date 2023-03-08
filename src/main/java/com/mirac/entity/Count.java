package com.mirac.entity;

/**
 * 
 * @Description: 浏览及回复计数	（基本上没用）

 *
 */
public class Count {
	private int msgid;
	private int accessCount;
	private int replyCount;
	
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public int getAccessCount() {
		return accessCount;
	}
	public void setAccessCount(int accessCount) {
		this.accessCount = accessCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	@Override
	public String toString() {
		return "Count [msgid=" + msgid + ", accessCount=" + accessCount + ", replyCount=" + replyCount + "]";
	}
}
