package com.poly.asm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.asm.cart.Cart;
import com.poly.asm.dao.CategoryDao;
import com.poly.asm.dao.ProductDao;
import com.poly.asm.dao.UserDao;
import com.poly.asm.entity.Category;
import com.poly.asm.entity.Product;

/**
 * Servlet implementation class index2
 */
@WebServlet("/index2")
public class index2 extends HttpServlet {
	

	private static final long serialVersionUID = 1L;

	ProductDao productDao = new ProductDao();//view da sp
	CategoryDao categoryDao = new CategoryDao(); //+1 điểm
	UserDao userDao = new UserDao();//+1 điểm

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new Cart());
		}
		
		List<Category> listCategory = categoryDao.findAll();
		req.setAttribute("listCategory", listCategory);
		
	
		List<Product> listProduct = productDao.findAll();
		req.setAttribute("listProduct", listProduct);
		

		req.getRequestDispatcher("views/index2.jsp").forward(req, resp);
	}
	

}
