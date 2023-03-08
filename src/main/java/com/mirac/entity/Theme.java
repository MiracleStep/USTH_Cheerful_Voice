package com.mirac.entity;

public class Theme {
	private int theid;			// 主题ID
	private String thename;		// 主题名
	private int count;			// 主题帖数
	
	public int getTheid() {
		return theid;
	}
	public void setTheid(int theid) {
		this.theid = theid;
	}
	public String getThename() {
		return thename;
	}
	public void setThename(String thename) {
		this.thename = thename;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "Theme [theid=" + theid + ", thename=" + thename + ", count=" + count + "]";
	}
}
