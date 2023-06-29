package com.poly.asm.dao;

import java.util.List;

import com.poly.asm.entity.Order;
import com.poly.asm.entity.OrderDetail;

public class CartDao extends ConnectDao {
	
	public boolean insertCart(Order hoadon, List<OrderDetail> listHDCT) {
		/*
		 	Insert vao table HoaDon truoc sau do moi insert vao table HoaDonChiTiet
		 	Neu insert vao HoaDon that bai thi khong insert vao HDCT
		 	Neu insert vao HDCT that bai thi rollback data (tuc la huy data da insert vao HoaDon)
		 */
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(hoadon);
			int maHDVuaInsert = hoadon.getId();
			if (maHDVuaInsert > 0) {
				// neu insert thanh cong thi insert tiep HDCT
				hoadon.setId(maHDVuaInsert);
				listHDCT.forEach(hdct -> entityManager.persist(hdct));
			} else {
				return false;
			}
			entityManager.getTransaction().commit();
			System.out.println("Create succeed");
			return true;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot insert entity");
			e.printStackTrace();
			return false;
		}
	}
}
