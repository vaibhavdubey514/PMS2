package com.pms.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

@WebServlet("/booking-service")
public class BookingServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookingServiceServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/booking-service.jsp");
		User user = UserDao.findUserByUserId((String) request.getSession().getAttribute("name"));
		if (user != null) {
			request.setAttribute("role", user.getRole());
			request.setAttribute("senderName", user.getName());
			request.setAttribute("senderAddress", user.getAddress());
			request.setAttribute("senderCountryCode", user.getCountryCode());
			request.setAttribute("senderMobileNumber", user.getMobileNumber());
		}

		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		String senderName = request.getParameter("senderName");
		String senderAddress = request.getParameter("senderAddress");
		String senderCountryCode = request.getParameter("senderCountryCode");
		String senderMobileNumber = request.getParameter("senderMobileNumber");
		String receiverName = request.getParameter("receiverName");
		String receiverAddress = request.getParameter("receiverAddress");
		String receiverPin = request.getParameter("receiverPin");
		String receiverCountryCode = request.getParameter("receiverCountryCode");
		String receiverMobileNumber = request.getParameter("receiverMobileNumber");
		double parcelWeight = Double.parseDouble(request.getParameter("parcelWeight"));
		String parcelContentsDescription = request.getParameter("parcelContentsDescription");
		String parcelDeliveryType = request.getParameter("parcelDeliveryType");
		String parcelPackingPreference = request.getParameter("parcelPackingPreference");
		String parcelPickupTime = request.getParameter("parcelPickupTime").replace('T', ' ') + ":00";
		String parcelDropoffTime = request.getParameter("parcelDropoffTime").replace('T', ' ') + ":00";
		double parcelServiceCost = Double.parseDouble(request.getParameter("parcelServiceCost"));
		String parcelPaymentTime = LocalDateTime.now().format(formatter);
		String parcelStatus = "Booked";
		String dateOfBooking = LocalDate.now().toString();

		Booking bk = new Booking(0, senderName, senderAddress, senderCountryCode, senderMobileNumber, receiverName,
				receiverAddress, receiverPin, receiverCountryCode, receiverMobileNumber, parcelWeight,
				parcelContentsDescription, parcelDeliveryType, parcelPackingPreference, parcelPickupTime,
				parcelDropoffTime, parcelServiceCost, parcelPaymentTime, parcelStatus, dateOfBooking);

		int result = BookingDao.addBooking((String) request.getSession().getAttribute("name"), bk);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/booking-service.jsp");
		if (result > 0) {
			request.setAttribute("status", "success");
			request.setAttribute("bookingId", bk.getBookingId());
		} else {
			request.setAttribute("status", "error");
			request.setAttribute("errorMessage", "Some error occured");
		}
		dispatcher.forward(request, response);

	}
}