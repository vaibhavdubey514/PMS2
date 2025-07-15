package com.pms.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.pms.dao.BookingDao;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int bookingId = Integer.valueOf(request.getParameter("bookingId"));
//        if (bookingId != 0) {
//            BookingDao.cancelBooking(bookingId);  // call your DAO logic
//        }
//        response.sendRedirect(request.getContextPath() + "/previous-booking");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bookingId = Integer.valueOf(request.getParameter("bookingId"));
        if (bookingId != 0) {
            BookingDao.cancelBooking(bookingId);  // call your DAO logic
        }
        response.sendRedirect(request.getContextPath() + "/previous-booking");
	}

}
