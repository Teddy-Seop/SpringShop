package com.ms.shop.Vo;

import java.util.Date;

public class OrderVo {

	private int purchaseno;
	private String brand;
	private int no;
	private String name;
	private String id;
	private String address;
	private String phone;
	private int complete;
	private Date date;
	private String content; //리뷰 내용
	private String image; //리뷰 이미지
	
	public int getPurchaseno() {
		return purchaseno;
	}
	public void setPurchaseno(int purchaseno) {
		this.purchaseno = purchaseno;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
