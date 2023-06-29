package com.poly.asm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.poly.asm.cart.Cart;
import com.poly.asm.cart.CartDetail;
import com.poly.asm.dao.CartDao;
import com.poly.asm.dao.ProductDao;
import com.poly.asm.dao.UserDao;
import com.poly.asm.entity.Order;
import com.poly.asm.entity.OrderDetail;
import com.poly.asm.entity.Product;
import com.poly.asm.entity.User;

public class CartService {
	
	ProductDao productDao = new ProductDao();
	UserDao userDao = new UserDao();
	CartDao cartDao = new CartDao();
	
	public boolean checkBeforeInsert(Cart cart) {
		// kiem tra cart co ton tai sp hay khong, neu khong ton tai thi ko insert
		if (cart.getTongsl() == 0) {
			return false;
		}
		return insertHoaDon(cart);
	}
	
	public boolean insertHoaDon(Cart cartDto) {
		Order hoadon = mappingDtoToOrderEntity(cartDto);
		List<OrderDetail> listHDCT = mappingDtoToOrderDetailEntity(cartDto.getDetail(), hoadon);
		return cartDao.insertCart(hoadon, listHDCT);
	}
	
	public Cart updateCart(Cart cart, String masp, int soLuong, boolean isUpdate) {
		Product product = productDao.findByMaSP(masp);
		
		HashMap<String, CartDetail> cartDetail = cart.getDetail();
		
		if (cartDetail.containsKey(masp)) {
			if (soLuong < 1) {
				cartDetail.remove(masp);
			} else {
				if (isUpdate) {
					cartDetail.get(masp).setSlMua(soLuong);
				} else {
					int slCu = cartDetail.get(masp).getSlMua();
					cartDetail.get(masp).setSlMua(slCu + soLuong);
				}
			}
		} else {
			CartDetail cartDetailDto = new CartDetail();
			cartDetailDto.setTensp(product.getTensp());
			cartDetailDto.setGiasp(product.getGiasp());
			cartDetailDto.setMasp(product.getMasp());
			cartDetailDto.setHinh(product.getHinh());
			cartDetailDto.setSlMua(soLuong);
			cartDetail.put(masp, cartDetailDto);
		}
		
		cart.setTongsl(this.getTongSL(cart));
		cart.setTongtien(this.getTongTien(cart));
		
		return cart;
	}
	
	public double getTongTien(Cart cart) {
		HashMap<String, CartDetail> cartDetail = cart.getDetail();
		Double tongTien = 0D;
		for (CartDetail cartDetailDto : cartDetail.values()) {
			Product product = productDao.findByMaSP(cartDetailDto.getMasp());
			tongTien += product.getGiasp() * cartDetailDto.getSlMua();
		}
		return tongTien;
	}
	
	public int getTongSL(Cart cart) {
		HashMap<String, CartDetail> cartDetail = cart.getDetail();
		int tongSL = 0;
		for (CartDetail productDto : cartDetail.values()) {
			tongSL += productDto.getSlMua();
		}
		return tongSL;
	}
	
	private Order mappingDtoToOrderEntity(Cart cartDto) {
		Order hoadon = new Order();
		hoadon.setDiachi(cartDto.getDiachi());
		hoadon.setDienthoai(cartDto.getDienthoai());
		hoadon.setTongtien(cartDto.getTongtien());
		User user = userDao.findById(cartDto.getUserId());
		hoadon.setUser(user);
		return hoadon;
	}
	
	private List<OrderDetail> mappingDtoToOrderDetailEntity(HashMap<String, CartDetail> details, Order hoadon) {
		List<OrderDetail> result = new ArrayList<>();
		details.forEach((key, hdct) -> {
			OrderDetail hoadonchitiet = new OrderDetail();
			Product sanpham = productDao.findByMaSP(hdct.getMasp());
			hoadonchitiet.setSanpham(sanpham);
			hoadonchitiet.setGia(hdct.getGiasp());
			hoadonchitiet.setSoluong(hdct.getSlMua());
			hoadonchitiet.setHoadon(hoadon);
			result.add(hoadonchitiet);
		});
		return result;
	}
}
