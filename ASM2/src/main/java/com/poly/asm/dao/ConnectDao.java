package com.poly.asm.dao;

import javax.persistence.EntityManager;

import com.poly.asm.util.JpaUtil;

public class ConnectDao {

	public static final EntityManager entityManager = JpaUtil.getEntityManager();

	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}
}
