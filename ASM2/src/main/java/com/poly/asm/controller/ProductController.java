package com.poly.asm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.microsoft.sqlserver.jdbc.StringUtils;
import com.poly.asm.cart.Cart;
import com.poly.asm.dao.CategoryDao;
import com.poly.asm.dao.ProductDao;
import com.poly.asm.entity.Category;
import com.poly.asm.entity.Product;

@WebServlet({"/sanpham"})
public class ProductController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new Cart());
		}
		
		List<Category> listCategory = categoryDao.findAll();
		req.setAttribute("listCategory", listCategory);
		
		String maDM = req.getParameter("maDM");
		String maSP = req.getParameter("maSP");
		if (!StringUtils.isEmpty(maSP)) {
			doGetSanPham(req, resp, maSP);
		} else if (!StringUtils.isEmpty(maDM)) {
			doGetDanhMuc(req, resp, maDM);
		}
	}
	
	protected void doGetSanPham(HttpServletRequest req, HttpServletResponse resp, String maSP) throws ServletException, IOException {
		Product product = productDao.findByMaSP(maSP);
		req.setAttribute("product", product);
		req.getRequestDispatcher("views/detail2.jsp").forward(req, resp);
	}
	
	protected void doGetDanhMuc(HttpServletRequest req, HttpServletResponse resp, String maDM) throws ServletException, IOException {
		List<Product> listProduct = productDao.findAllByMadm(maDM);
		req.setAttribute("listProduct", listProduct);
		
		Category category = categoryDao.findByMaDM(maDM);
		req.setAttribute("category", category);
		
		req.getRequestDispatcher("views/danhmuc.jsp").forward(req, resp);
	}
}
