package com.pms.controllers;

import java.io.IOException;

import com.pms.dao.UserDao;
import com.pms.models.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contact-support")
public class ContactSupportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContactSupportServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/contact-support.jsp");
		User user = UserDao.findUserByUserId((String) request.getSession().getAttribute("name"));
		if (user != null) {
			request.setAttribute("role", user.getRole());
		}
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
