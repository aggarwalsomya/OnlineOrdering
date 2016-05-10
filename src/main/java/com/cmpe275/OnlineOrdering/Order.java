package com.cmpe275.OnlineOrdering;

import java.util.Map;

public class Order {
	private int orderid;
	private String username;
	private String email;
	private String status;
	private String menu_items;
	private Map<String, Integer>menumap;
	private String pickup_date;
	private String pickup_time;
	
	public Order(Integer orderid, String username, String email, String menu_items, String status, String pickup_date, String pickup_time) {
		this.orderid = orderid;
		this.username = username;
		this.email = email;
		this.status = status;
		this.menu_items = menu_items;
		this.pickup_date = pickup_date;
		this.pickup_time = pickup_time;
	}
	
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/*public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}*/
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMenu_items() {
		return menu_items;
	}
	public void setMenu_items(String menu_items) {
		this.menu_items = menu_items;
	}

	public Map<String, Integer> getMenumap() {
		return menumap;
	}

	public void setMenumap(Map<String, Integer> menumap) {
		this.menumap = menumap;
	}

	public String getpickup_date() {
		return pickup_date;
	}

	public void setpickup_date(String date) {
		this.pickup_date = date;
	}

	public String getpickup_time() {
		return pickup_time;
	}

	public void setpickup_time(String time) {
		this.pickup_time = time;
	}
}
