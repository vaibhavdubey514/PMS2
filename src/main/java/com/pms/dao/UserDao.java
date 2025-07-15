package com.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pms.models.User;

public class UserDao {
	private static final String URL = "jdbc:mysql://localhost:3306/jdbc_demo";
    private static final String username="root";
    private static final String password="6302620627Vv@";

	public static int registerUser(User user) {
		String INSERT_USERS_SQL = "INSERT INTO users"
				+ "  (name, email, countryCode, mobileNumber, address, userId, password, emailNotifications, role, salt) VALUES "
				+ " (?,?,?,?,?,?,?,?,?,?)";

		int result = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getCountryCode());
			preparedStatement.setString(4, user.getMobileNumber());
			preparedStatement.setString(5, user.getAddress());
			preparedStatement.setString(6, user.getUserId());
			preparedStatement.setString(7, user.getPassword());
			preparedStatement.setInt(8, user.getEmailNotifications());
			preparedStatement.setString(9, user.getRole());
			preparedStatement.setString(10, user.getSalt());

			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return result;
	}

	public static User findUserByUserId(String userId) {
		User user = null;

		String SELECT_USERS_SQL = "SELECT * FROM users WHERE userId = ?";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try (Connection connection = DriverManager.getConnection(URL,username,password);
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_SQL)) {
			preparedStatement.setString(1, userId);

			ResultSet resultset = preparedStatement.executeQuery();
			if (resultset.next()) {
				user = new User(resultset.getString(1), resultset.getString(2), resultset.getString(3),
						resultset.getString(4), resultset.getString(5), resultset.getString(6), resultset.getString(7),
						resultset.getInt(8), resultset.getString(9), resultset.getString(10));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return user;
	}
}