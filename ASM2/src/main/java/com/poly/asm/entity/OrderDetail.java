package com.poly.asm.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "hoadonchitiet")
public class OrderDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "soluong")
	private int soluong;
	
	@Column(name = "gia")
	private double gia;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "mahd", referencedColumnName = "id")
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private Order hoadon;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "masp", referencedColumnName = "masp")
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private Product sanpham;
	
	public OrderDetail() {
		
	}

	public OrderDetail(int id, int soluong, double gia, Order hoadon, Product sanpham) {
		this.id = id;
		this.soluong = soluong;
		this.gia = gia;
		this.hoadon = hoadon;
		this.sanpham = sanpham;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public double getGia() {
		return gia;
	}

	public void setGia(double gia) {
		this.gia = gia;
	}

	public Order getHoadon() {
		return hoadon;
	}

	public void setHoadon(Order hoadon) {
		this.hoadon = hoadon;
	}

	public Product getSanpham() {
		return sanpham;
	}

	public void setSanpham(Product sanpham) {
		this.sanpham = sanpham;
	}
}
