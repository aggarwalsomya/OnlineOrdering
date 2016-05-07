package com.cmpe275.OnlineOrdering;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/** This is the main menu item class containing the various menu items.
 * All the fields are private in nature and getters and setters are written for them
 * @author Somya
 * *
 */

@Entity
@Table(name = "menuitem")
public class MenuItem {

	@Id
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String category;
	private String name;
	@Column(name="picture",columnDefinition="longblob")
	private byte[] picture;
	private String unitprice;
	@Column(name="calories", nullable=false)
	private String calories;
	private String preptime;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}

	public String getCalories() {
		return calories;
	}

	public void setCalories(String calories) {
		this.calories = calories;
	}

	public String getPreptime() {
		return preptime;
	}

	public void setPreptime(String preptime) {
		this.preptime = preptime;
	}

	public MenuItem() {

	}

}