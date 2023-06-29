package com.poly.asm.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import com.poly.asm.entity.User;

public class UserDao extends ConnectDao {

	public User checkLogin(String username, String password) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0 AND o.password = ?1";
		TypedQuery<User> query = entityManager.createQuery(sql, User.class);
    	query.setParameter(0, username);
    	query.setParameter(1, password);
		List<User> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}

	public List<User> findAll() {
		String sql = "SELECT o FROM User o";
		TypedQuery<User> query = entityManager.createQuery(sql, User.class);
		return query.getResultList();
	}

	public User findById(int id) {
		String sql = "SELECT o FROM User o WHERE o.id = ?0";
		TypedQuery<User> query = entityManager.createQuery(sql, User.class);
    	query.setParameter(0, id);
		List<User> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}

	public boolean update(User user) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(user);
			entityManager.getTransaction().commit();
			System.out.println("Update succeed");
			return true;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot update entity");
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(int id) {
		User user = findById(id);
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(user);
			entityManager.getTransaction().commit();
			System.out.println("Delete succeed");
			return true;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot delete entity");
			e.printStackTrace();
			return false;
		}
	}

	public boolean insert(User user) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(user);
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
