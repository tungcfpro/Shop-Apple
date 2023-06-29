package com.poly.asm.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "sanpham")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "masp")
	private String masp;
	
	@Column(name = "tensp")
	private String tensp;
	
	@Column(name = "giasp")
	private double giasp;
	
	@Column(name = "mota")
	private String mota;
	
	@Column(name = "soluong")
	private int soluong;
	
	@Column(name = "hinh")
	private String hinh;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "madm", referencedColumnName = "madm")
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private Category danhmuc;

	public Product() {
		
	}
	
	public Product(String masp, String tensp, double giasp, String mota, int soluong, String hinh) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.giasp = giasp;
		this.mota = mota;
		this.soluong = soluong;
		this.hinh = hinh;
	}

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

	public String getMota() {
		return mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public double getGiasp() {
		return giasp;
	}

	public void setGiasp(double giasp) {
		this.giasp = giasp;
	}
	
	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	public Category getDanhmuc() {
		return danhmuc;
	}

	public void setDanhmuc(Category danhmuc) {
		this.danhmuc = danhmuc;
	}

	@Override
	public String toString() {
		return "Product{" + "masp=" + masp + ", tensp=" + tensp + ", mota=" + mota + ", hinh=" + hinh + ", gia=" + giasp
				+ '}';
	}
}
