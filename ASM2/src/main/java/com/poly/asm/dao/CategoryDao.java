package com.poly.asm.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import com.poly.asm.entity.Category;

public class CategoryDao extends ConnectDao {
    
    public List<Category> findAll(){
    	String sql = "SELECT o FROM Category o";
		TypedQuery<Category> query = entityManager.createQuery(sql, Category.class);
		return query.getResultList();
    }   
    
    public Category findByMaDM(String maDM){
    	String sql = "SELECT o FROM Category o WHERE o.madm = ?0";
    	TypedQuery<Category> query = entityManager.createQuery(sql, Category.class);
    	query.setParameter(0, maDM);
		List<Category> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
    }
}
