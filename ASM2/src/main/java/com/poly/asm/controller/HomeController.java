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
import com.poly.asm.entity.User;

@WebServlet({"/index", "/login", "/logout"})
public class HomeController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	UserDao userDao = new UserDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new Cart());
		}
		
		List<Category> listCategory = categoryDao.findAll();
		req.setAttribute("listCategory", listCategory);
		
		String url = req.getServletPath();
		if (url.equals("/index")) {
			doGetIndex(req, resp);
		} else if (url.equals("/login")) {
			doGetLogin(req, resp);
		} else if (url.equals("/logout")) {
			doGetLogout(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getServletPath();
		if (url.equals("/login")) {
			doPostLogin(req, resp);
		}
	}
	
	protected void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> listProduct = productDao.findAll();
		req.setAttribute("listProduct", listProduct);
		req.getRequestDispatcher("views/index.jsp").forward(req, resp);
	}
	
	protected void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("views/login.jsp").forward(req, resp);
	}
	
	protected void doGetLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		session.removeAttribute("cart");
		resp.sendRedirect("index");
	}
	
	protected void doPostLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = userDao.checkLogin(username, password);
		if (user == null) {
			req.setAttribute("errorMessage", "Login failed!");
			req.getRequestDispatcher("views/login.jsp").forward(req, resp);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("index");
		}
	}
}
