package com.pms.controllers;

import java.io.IOException;

import com.pms.dao.UserDao;
import com.pms.models.User;
import com.pms.utils.PasswordUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customer-register")
public class CustomerRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerRegistrationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer-register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String countryCode = request.getParameter("countryCode");
		String mobileNumber = request.getParameter("mobileNumber");
		String address = request.getParameter("address");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String emailNotifications = request.getParameter("emailNotifications");
		String role = "Customer";

		String salt = PasswordUtil.generateSalt(128);
		String hashedPassword = PasswordUtil.hashPassword(password, salt);

		User user = new User(name, email, countryCode, mobileNumber, address, userId, hashedPassword,
				emailNotifications == null ? 0 : 1, role, salt);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer-register.jsp");
		int result = UserDao.registerUser(user);
		if (result > 0) {
			request.setAttribute("status", "success");
		} else {
			request.setAttribute("status", "error");
			request.setAttribute("errorMessage", "Registration Failed");
		}

		dispatcher.forward(request, response);
	}
}