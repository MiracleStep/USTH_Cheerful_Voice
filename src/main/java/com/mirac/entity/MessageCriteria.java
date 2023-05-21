package com.mirac.entity;

/**
 * 帖子查询条件
 * @author Administrator
 *
 */
public class MessageCriteria {
	
	/**
	 * 用户ID
	 */
	private int userid = -1;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 主题ID
	 */
	private int theid = -1;
	/**
	 * 状态 0表示正常 -1表示逻辑删除 1表示待审核
	 */
	private int state = 1;
	/**
	 * 关键字查询
	 */
	private String key;
	/**
	 * 排序规则
	 */
	private OrderRuleEnum orderRule = OrderRuleEnum.ORDER_BY_ACCESS_COUNT;

	private String orderType;

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	/**
	 * 升降序
	 */
	private boolean asc = false;
	
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
	public int getTheid() {
		return theid;
	}
	public void setTheid(int theid) {
		this.theid = theid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}	
	
	public OrderRuleEnum getOrderRule() {
		return orderRule;
	}
	public void setOrderRule(OrderRuleEnum orderRule) {
		this.orderRule = orderRule;
	}
	public boolean isAsc() {
		return asc;
	}
	public void setAsc(boolean asc) {
		this.asc = asc;
	}

	
	/**
	 * 排序规则枚举值(访问量和时间)
	 * @author Administrator
	 *
	 */
	public enum OrderRuleEnum{
		ORDER_BY_ACCESS_COUNT,
		ORDER_BY_MSG_TIME
	}
}
