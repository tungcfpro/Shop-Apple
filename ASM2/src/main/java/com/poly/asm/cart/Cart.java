package com.poly.asm.cart;

import java.io.Serializable;
import java.util.HashMap;

public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private int userId;
	private double tongtien = 0;
	private int tongsl = 0;
	private String dienthoai;
	private String diachi;
	private HashMap<String, CartDetail> detail = new HashMap<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getTongtien() {
		return tongtien;
	}

	public void setTongtien(double tongtien) {
		this.tongtien = tongtien;
	}

	public int getTongsl() {
		return tongsl;
	}

	public void setTongsl(int tongsl) {
		this.tongsl = tongsl;
	}
	
	public String getDienthoai() {
		return dienthoai;
	}

	public void setDienthoai(String dienthoai) {
		this.dienthoai = dienthoai;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public HashMap<String, CartDetail> getDetail() {
		return detail;
	}

	public void setDetail(HashMap<String, CartDetail> detail) {
		this.detail = detail;
	}
}
