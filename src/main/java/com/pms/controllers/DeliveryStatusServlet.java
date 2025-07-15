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

@WebServlet("/delivery-status")
public class DeliveryStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeliveryStatusServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/delivery-status.jsp");
		User user = UserDao.findUserByUserId((String) request.getSession().getAttribute("name"));
		if (user != null) {
			request.setAttribute("role", user.getRole());
		}

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookingId = 0;
		if (request.getParameter("bookingId") != null) {
			bookingId = Integer.parseInt(request.getParameter("bookingId"));
		}
		String parcelStatus = request.getParameter("parcelStatus");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/delivery-status.jsp");

		if (parcelStatus == null) {
			ArrayList<String> details = BookingDao.getofficerTrackingDetails(bookingId);

			if (details.size() != 0) {
				request.setAttribute("status", "success");
				request.setAttribute("bookingId", details.get(0));
				request.setAttribute("name", details.get(1));
				request.setAttribute("address", details.get(2));
				request.setAttribute("receiverName", details.get(3));
				request.setAttribute("receiverAddress", details.get(4));
				request.setAttribute("dateOfBooking", details.get(5));
				request.setAttribute("parcelStatus", details.get(6));
			} else {
				request.setAttribute("status", "error");
				request.setAttribute("errorMessage", "Invalid Booking ID");
			}
		} else {
			int bookingIdValue = Integer.parseInt(request.getParameter("bookingIdValue"));
			int result = BookingDao.updateParcelStatus(bookingIdValue, parcelStatus);
			if (result > 0) {
				request.setAttribute("updateStatus", "success");
			} else {
				request.setAttribute("status", "error");
				request.setAttribute("errorMessage", "Update Failed");
			}
		}

		dispatcher.forward(request, response);
	}
}