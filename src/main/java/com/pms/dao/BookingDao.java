package com.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.pms.models.Booking;

public class BookingDao {
	private static final String URL = "jdbc:mysql://localhost:3306/jdbc_demo";
    private static final String username="root";
    private static final String password="6302620627Vv@";

	public static int addBooking(String userId, Booking booking) {
		String INSERT_BOOKINGS_SQL = "INSERT INTO bookings"
				+ "  (userId, senderName, senderAddress, senderCountryCode, senderMobileNumber, receiverName, receiverAddress, receiverPin, receiverCountryCode, receiverMobileNumber, parcelWeight, parcelContentsDescription,"
				+ "parcelDeliveryType,parcelPackingPreference, parcelPickupTime, parcelDropoffTime, parcelServiceCost, parcelPaymentTime, parcelStatus, dateOfBooking"
				+ ") VALUES " + " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		int result = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOKINGS_SQL,
						PreparedStatement.RETURN_GENERATED_KEYS);) {
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, booking.getSenderName());
			preparedStatement.setString(3, booking.getSenderAddress());
			preparedStatement.setString(4, booking.getSenderCountryCode());
			preparedStatement.setString(5, booking.getSenderMobileNumber());
			preparedStatement.setString(6, booking.getReceiverName());
			preparedStatement.setString(7, booking.getReceiverAddress());
			preparedStatement.setString(8, booking.getReceiverPin());
			preparedStatement.setString(9, booking.getReceiverCountryCode());
			preparedStatement.setString(10, booking.getReceiverMobileNumber());
			preparedStatement.setDouble(11, booking.getParcelWeight());
			preparedStatement.setString(12, booking.getParcelContentsDescription());
			preparedStatement.setString(13, booking.getParcelDeliveryType());
			preparedStatement.setString(14, booking.getParcelPackingPreference());
			preparedStatement.setString(15, booking.getParcelPickupTime());
			preparedStatement.setString(16, booking.getParcelDropoffTime());
			preparedStatement.setDouble(17, booking.getParcelServiceCost());
			preparedStatement.setString(18, booking.getParcelPaymentTime());
			preparedStatement.setString(19, booking.getParcelStatus());
			preparedStatement.setString(20, booking.getDateOfBooking());

			result = preparedStatement.executeUpdate();

			try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					booking.setBookingId(generatedKeys.getInt(1));
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public static Booking findBookingByuserIdAndbookingId(String userId, int bookingId) {
		Booking booking = null;

		String SELECT_BOOKINGS_SQL = "SELECT * FROM bookings WHERE userId = ? AND bookingId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKINGS_SQL)) {
			preparedStatement.setString(1, userId);
			preparedStatement.setInt(2, bookingId);

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				booking = new Booking(resultset.getInt(2), resultset.getString(3), resultset.getString(4),
						resultset.getString(5), resultset.getString(6), resultset.getString(7), resultset.getString(8),
						resultset.getString(9), resultset.getString(10), resultset.getString(11),
						resultset.getDouble(12), resultset.getString(13), resultset.getString(14),
						resultset.getString(15), resultset.getString(16), resultset.getString(17),
						resultset.getDouble(18), resultset.getString(19), resultset.getString(20),
						resultset.getString(21));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return booking;
	}

	public static Booking findBookingBybookingId(int bookingId) {
		Booking booking = null;

		String SELECT_BOOKINGS_SQL = "SELECT * FROM bookings WHERE bookingId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKINGS_SQL)) {
			preparedStatement.setInt(1, bookingId);

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				booking = new Booking(resultset.getInt(2), resultset.getString(3), resultset.getString(4),
						resultset.getString(5), resultset.getString(6), resultset.getString(7), resultset.getString(8),
						resultset.getString(9), resultset.getString(10), resultset.getString(11),
						resultset.getDouble(12), resultset.getString(13), resultset.getString(14),
						resultset.getString(15), resultset.getString(16), resultset.getString(17),
						resultset.getDouble(18), resultset.getString(19), resultset.getString(20),
						resultset.getString(21));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return booking;
	}

	public static ArrayList<String> getofficerTrackingDetails(int bookingId) {
		String SELECT_TRACKING_SQL = "SELECT bookingId, senderName, senderAddress, receiverName, receiverAddress, dateOfBooking, parcelStatus"
				+ " FROM bookings WHERE bookingId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		ArrayList<String> details = new ArrayList<>();

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRACKING_SQL)) {
			preparedStatement.setInt(1, bookingId);

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				String bid = String.valueOf(resultset.getInt(1));
				String name = resultset.getString(2);
				String address = resultset.getString(3);
				String receiverName = resultset.getString(4);
				String receiverAddress = resultset.getString(5);
				String dateOfBooking = resultset.getString(6);
				String parcelStatus = resultset.getString(7);
				details.add(bid);
				details.add(name);
				details.add(address);
				details.add(receiverName);
				details.add(receiverAddress);
				details.add(dateOfBooking);
				details.add(parcelStatus);

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return details;
	}

	public static ArrayList<String> getcustomerTrackingDetails(int bookingId, String userId) {
		String SELECT_TRACKING_SQL = "SELECT bookingId, senderName, senderAddress, receiverName, receiverAddress, dateOfBooking, parcelStatus"
				+ " FROM bookings WHERE bookingId = ? AND userId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		ArrayList<String> details = new ArrayList<>();

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRACKING_SQL)) {
			preparedStatement.setInt(1, bookingId);
			preparedStatement.setString(2, userId);

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				String bid = String.valueOf(resultset.getInt(1));
				String name = resultset.getString(2);
				String address = resultset.getString(3);
				String receiverName = resultset.getString(4);
				String receiverAddress = resultset.getString(5);
				String dateOfBooking = resultset.getString(6);
				String parcelStatus = resultset.getString(7);
				details.add(bid);
				details.add(name);
				details.add(address);
				details.add(receiverName);
				details.add(receiverAddress);
				details.add(dateOfBooking);
				details.add(parcelStatus);

			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return details;
	}

	public static ArrayList<String> getofficerSchedulingDetails(int bookingId) {
		String SELECT_TRACKING_SQL = "SELECT bookingId, senderName, senderAddress, receiverName, receiverAddress, dateOfBooking, parcelStatus"
				+ ", parcelPickupTime, parcelDropoffTime FROM bookings WHERE bookingId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		ArrayList<String> details = new ArrayList<>();

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TRACKING_SQL)) {
			preparedStatement.setInt(1, bookingId);

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				String bid = String.valueOf(resultset.getInt(1));
				String name = resultset.getString(2);
				String address = resultset.getString(3);
				String receiverName = resultset.getString(4);
				String receiverAddress = resultset.getString(5);
				String dateOfBooking = resultset.getString(6);
				String parcelStatus = resultset.getString(7);
				String parcelPickupTime = resultset.getString(8);
				String parcelDropoffTime = resultset.getString(9);
				details.add(bid);
				details.add(name);
				details.add(address);
				details.add(receiverName);
				details.add(receiverAddress);
				details.add(dateOfBooking);
				details.add(parcelStatus);
				details.add(parcelPickupTime);
				details.add(parcelDropoffTime);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return details;
	}

	public static int updateScheduling(int bookingId, String parcelPickupTime, String parcelDropoffTime) {
		String UPDATE_SCHEDULING_SQL = "UPDATE bookings SET parcelPickupTime = ?, parcelDropoffTime = ? WHERE bookingId = ?";
		int result = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SCHEDULING_SQL);) {
			preparedStatement.setString(1, parcelPickupTime);
			preparedStatement.setString(2, parcelDropoffTime);
			preparedStatement.setInt(3, bookingId);

			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public static ArrayList<ArrayList<String>> getcustomerBookingHistory(String userId) {
		String SELECT_HISTORY_SQL = "SELECT bookingId, dateOfBooking, receiverName, receiverAddress, parcelServiceCost, parcelStatus"
				+ " FROM bookings WHERE userId = ? ORDER BY dateOfBooking DESC";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		ArrayList<ArrayList<String>> finalDetails = new ArrayList<ArrayList<String>>();

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HISTORY_SQL)) {
			preparedStatement.setString(1, userId);

			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
				ArrayList<String> details = new ArrayList<>();
				String bid = String.valueOf(resultset.getInt(1));
				String dateOfBooking = resultset.getString(2);
				String receiverName = resultset.getString(3);
				String receiverAddress = resultset.getString(4);
				String parcelServiceCost = String.valueOf(resultset.getDouble(5));
				String parcelStatus = resultset.getString(6);
				details.add(bid);
				details.add(dateOfBooking);
				details.add(receiverName);
				details.add(receiverAddress);
				details.add(parcelServiceCost);
				details.add(parcelStatus);
				finalDetails.add(details);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return finalDetails;
	}

	public static ArrayList<ArrayList<String>> getofficerBookingHistory(String userId, String startDate,
			String endDate) {
		String SELECT_HISTORY_SQL = "SELECT bookingId, dateOfBooking, receiverName, receiverAddress, parcelServiceCost, parcelStatus"
				+ " FROM bookings WHERE userId = ? AND dateOfBooking >= ? AND dateOfBooking <= ? ORDER BY dateOfBooking DESC";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		ArrayList<ArrayList<String>> finalDetails = new ArrayList<ArrayList<String>>();

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HISTORY_SQL)) {
			preparedStatement.setString(1, userId);
			preparedStatement.setString(2, startDate);
			preparedStatement.setString(3, endDate);

			ResultSet resultset = preparedStatement.executeQuery();
			while (resultset.next()) {
				ArrayList<String> details = new ArrayList<>();
				String bid = String.valueOf(resultset.getInt(1));
				String dateOfBooking = resultset.getString(2);
				String receiverName = resultset.getString(3);
				String receiverAddress = resultset.getString(4);
				String parcelServiceCost = String.valueOf(resultset.getDouble(5));
				String parcelStatus = resultset.getString(6);
				details.add(bid);
				details.add(dateOfBooking);
				details.add(receiverName);
				details.add(receiverAddress);
				details.add(parcelServiceCost);
				details.add(parcelStatus);
				finalDetails.add(details);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return finalDetails;
	}

	public static int updateParcelStatus(int bookingId, String parcelStatus) {
		String UPDATE_SCHEDULING_SQL = "UPDATE bookings SET parcelStatus = ? WHERE bookingId = ?";
		int result = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SCHEDULING_SQL);) {
			preparedStatement.setString(1, parcelStatus);
			preparedStatement.setInt(2, bookingId);

			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
	
	
//	updated for filtering using userId
//	public static ArrayList<ArrayList<String>> getTrackingListByUserId(String userId) {
//	    ArrayList<ArrayList<String>> list = new ArrayList<>();
//	    try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//		} catch (ClassNotFoundException e) {
//			System.out.println(e.getMessage());
//		}
//	    try (Connection con = DriverManager.getConnection(URL,username,password)) {
//	        String query = "SELECT booking_id, sender_name, sender_address, receiver_name, receiver_address, booking_date, status FROM bookings WHERE user_id = ?";
//	        PreparedStatement ps = con.prepareStatement(query);
//	        ps.setString(1, userId);
//	        ResultSet rs = ps.executeQuery();
//	        while (rs.next()) {
//	            ArrayList<String> row = new ArrayList<>();
//	            row.add(rs.getString("booking_id"));
//	            row.add(rs.getString("sender_name"));
//	            row.add(rs.getString("sender_address"));
//	            row.add(rs.getString("receiver_name"));
//	            row.add(rs.getString("receiver_address"));
//	            row.add(rs.getString("booking_date"));
//	            row.add(rs.getString("status"));
//	            list.add(row);
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    return list;
//	}
	
	public static void cancelBooking(int bookingId) {
		String UPDATE_STATUS_SQL="update bookings set parcelStatus='Cancelled' where bookingId=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		
	    try {
	    	Connection conn = DriverManager.getConnection(URL,username,password);
	        PreparedStatement stmt = conn.prepareStatement(UPDATE_STATUS_SQL);
	        stmt.setInt(1, bookingId);
	        stmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}



}