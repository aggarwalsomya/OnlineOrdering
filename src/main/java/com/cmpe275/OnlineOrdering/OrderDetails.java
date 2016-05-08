package com.cmpe275.OnlineOrdering;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity @IdClass(OrderDetailsId.class)
@Table(name = "orderdetails")
public class OrderDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -847676040253140856L;

	@Id
	private int userid;
	
	@Id
	private int orderid;

	private String menu_items;

	private String status;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public String getMenu_items() {
		return menu_items;
	}

	public void setMenu_items(String menu_items) {
		this.menu_items = menu_items;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return this.userid + ": " + this.orderid;
	}
}

class OrderDetailsId implements Serializable {
	private static final long serialVersionUID = 7223242979687916889L;
	int orderid;
    int userid;
}
