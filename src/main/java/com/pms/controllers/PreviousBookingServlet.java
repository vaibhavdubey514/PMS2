package com.pms.controllers;

import java.io.IOException;
import java.util.ArrayList;

import com.pms.dao.BookingDao;
import com.pms.dao.UserDao;
import com.pms.models.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/previous-booking")
public class PreviousBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String role = null;

	public PreviousBookingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/previous-booking.jsp");
		User user = UserDao.findUserByUserId((String) request.getSession().getAttribute("name"));
		if (user != null) {
			request.setAttribute("role", user.getRole());

			ArrayList<ArrayList<String>> finalDetails = null;
			role = user.getRole();
			if ("Customer".equals(user.getRole())) {
				finalDetails = BookingDao.getcustomerBookingHistory(user.getUserId());
				request.setAttribute("userId", user.getUserId());
				if (finalDetails.size() != 0) {
					request.setAttribute("history", finalDetails);
				} else {
					request.setAttribute("status", "error");
					request.setAttribute("errorMessage", "No details found");
				}
			}
		}

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/previous-booking.jsp");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String userId = request.getParameter("userId");

		ArrayList<ArrayList<String>> finalDetails = BookingDao.getofficerBookingHistory(userId, startDate, endDate);
		request.setAttribute("userId", userId);
		request.setAttribute("role", role);
		if (finalDetails.size() != 0) {
			request.setAttribute("history", finalDetails);
		} else {
			request.setAttribute("status", "error");
			request.setAttribute("errorMessage", "No details found");
		}
		dispatcher.forward(request, response);
	}
}