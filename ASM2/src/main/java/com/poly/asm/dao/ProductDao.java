package com.poly.asm.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import com.poly.asm.entity.Product;

public class ProductDao extends ConnectDao {
	
    public List<Product> findAll(){
    	String sql = "SELECT o FROM Product o";
		TypedQuery<Product> query = entityManager.createQuery(sql, Product.class);
		return query.getResultList();
    }
    
    public List<Product> findAllByMadm(String madm){
		String sql = "SELECT o FROM Product o WHERE o.danhmuc.madm = ?0";
		TypedQuery<Product> query = entityManager.createQuery(sql, Product.class);
		query.setParameter(0, madm);
		return query.getResultList();
    }
    
    public Product findByMaSP(String maSP){
    	String sql = "SELECT o FROM Product o WHERE o.masp = ?0";
    	TypedQuery<Product> query = entityManager.createQuery(sql, Product.class);
    	query.setParameter(0, maSP);
		List<Product> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
    }
}
