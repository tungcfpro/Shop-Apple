package com.poly.asm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.asm.cart.Cart;
import com.poly.asm.dao.CategoryDao;
import com.poly.asm.dao.ProductDao;
import com.poly.asm.dao.UserDao;
import com.poly.asm.entity.Category;
import com.poly.asm.entity.User;
import com.poly.asm.service.CartService;

@WebServlet("/cart2")
public class CartController2 extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	CartService cartService = new CartService();
	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	UserDao userDao = new UserDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		List<Category> listCategory = categoryDao.findAll();
		req.setAttribute("listCategory", listCategory);
		
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new Cart());
		}
		
		String action = req.getParameter("action");
		
		if (action.equals("view")) {
			
			doGetViewCart(req, resp);
		} else if (action.equals("add")) {
			
			String masp = req.getParameter("masp");
			int soluong = Integer.parseInt(req.getParameter("soluong"));
			doGetAddSP(req, resp, session, masp, soluong);
		} else if (action.equals("remove")) {
			
			String masp = req.getParameter("masp");
			doGetRemoveSP(req, resp, masp);
		} else if (action.equals("paying")) {
			
			doGetPaying(req, resp, session);
		}
	}
	
	protected void doGetViewCart(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("views/cart.jsp").forward(req, resp);
	}
	
	protected void doGetAddSP(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String masp, int soluong) 
			throws ServletException, IOException {
		Cart cart = (Cart) session.getAttribute("cart");
		boolean isUpdate = req.getParameter("isUpdate").equals("1");
		cartService.updateCart(cart, masp, soluong, isUpdate);
		ObjectMapper mapper = new ObjectMapper();
		String cartToJsonString = mapper.writeValueAsString(cart);
		resp.setContentType("application/json");
		PrintWriter out = resp.getWriter();
		out.print(cartToJsonString);
		out.flush();
	}

	protected void doGetRemoveSP(HttpServletRequest req, HttpServletResponse resp, String masp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("views/cart.jsp").forward(req, resp);
	}
	
	protected void doGetPaying(HttpServletRequest req, HttpServletResponse resp, HttpSession session) 
			throws ServletException, IOException {
		
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute("user");
		if (currentUser != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			String phoneNumber = req.getParameter("phone");
			String address = req.getParameter("address");
			cart.setDienthoai(phoneNumber);
			cart.setDiachi(address);
			cart.setUserId(currentUser.getId());
			if (cartService.insertHoaDon(cart)) {
				session.setAttribute("cart", new Cart());
				resp.setStatus(200); 
			} else {
				resp.setStatus(400); 
			}
		} else {
			resp.setStatus(400);
		}
	}
}
