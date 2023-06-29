package com.poly.asm.cart;

import java.io.Serializable;

public class CartDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	private String masp;
	private String tensp;
	private double giasp;
	private String hinh;
	private int slMua;

	public String getMasp() {
		return masp;
	}

	public void setMasp(String masp) {
		this.masp = masp;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public double getGiasp() {
		return giasp;
	}

	public void setGiasp(double giasp) {
		this.giasp = giasp;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public int getSlMua() {
		return slMua;
	}

	public void setSlMua(int slMua) {
		this.slMua = slMua;
	}
}
