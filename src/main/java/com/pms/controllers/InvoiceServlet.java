package com.pms.controllers;

import java.io.IOException;

import com.pms.dao.BookingDao;
import com.pms.dao.UserDao;
import com.pms.models.Booking;
import com.pms.models.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String role = null;

	public InvoiceServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/invoice.jsp");
		User user = UserDao.findUserByUserId((String) request.getSession().getAttribute("name"));
		String bId = request.getParameter("bid");
		if (user != null) {
			request.setAttribute("role", user.getRole());
			if (bId != null)
				request.setAttribute("bId", bId);
			role = user.getRole();
		}

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bookingId = Integer.parseInt(request.getParameter("bookingId"));
		Booking booking = BookingDao.findBookingByuserIdAndbookingId((String) request.getSession().getAttribute("name"),
				bookingId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/invoice.jsp");
		request.setAttribute("role", role);
		if (booking != null) {
			request.setAttribute("status", "success");
			request.setAttribute("bookingId", booking.getBookingId());
			request.setAttribute("receiverName", booking.getReceiverName());
			request.setAttribute("receiverAddress", booking.getReceiverAddress());
			request.setAttribute("receiverPin", booking.getReceiverPin());
			request.setAttribute("receiverMobileNumber", booking.getReceiverMobileNumber());
			request.setAttribute("parcelWeight", booking.getParcelWeight());
			request.setAttribute("parcelContentsDescription", booking.getParcelContentsDescription());
			request.setAttribute("parcelDeliveryType", booking.getParcelDeliveryType());
			request.setAttribute("parcelPackingPreference", booking.getParcelPackingPreference());
			request.setAttribute("parcelPickupTime", booking.getParcelPickupTime());
			request.setAttribute("parcelDropoffTime", booking.getParcelDropoffTime());
			request.setAttribute("parcelServiceCost", booking.getParcelServiceCost());
			request.setAttribute("parcelPaymentTime", booking.getParcelPaymentTime());
		} else {
			request.setAttribute("status", "error");
			request.setAttribute("errorMessage", "Invalid Booking ID");
		}

		dispatcher.forward(request, response);
	}
}