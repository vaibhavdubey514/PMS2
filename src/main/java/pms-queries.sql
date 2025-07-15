CREATE TABLE users (
	name VARCHAR(50),
	email VARCHAR(50),
	countryCode VARCHAR(25),
	mobileNumber VARCHAR(10),
	address VARCHAR(200),
	userId VARCHAR(20) PRIMARY KEY,
	password VARCHAR(255),
	emailNotifications smallint,
	role VARCHAR(25),
	salt VARCHAR(255)
);

INSERT INTO users VALUES ('Siddharth Sharma', 'siddharth@gmail.com','+91','7734872391','Chattarpur Delhi', '12345', 'q4Z9V87dPjcZIMa6jSy6AAnDWIKaZ97/n18baXqIqQtoV7ufyUY/dbIhegP5RDroI37ytsWE2A0FvmiNGEdnqw==', TRUE, 'Officer', 'BoxGuISfir2POKr8GjQjwQea5h2aiel2w5Xw9N4cjDBcu6G0DfpPYffh7Zj38qBucdB9BaAe/ZJuTHihADjdHdehV9tI9eJAEna+Ti4C733IsMZqFCTKUl9SEOFFBz47kAQuiYO0xqjmEXCxj9QqGmjihWPC96uDljjhB2e8VU8=');

SELECT * FROM users;
DELETE FROM users WHERE userId = '123456';
TRUNCATE TABLE users;

DELETE FROM bookings WHERE bookingId = 200;

CREATE TABLE bookings (
    userId VARCHAR(20),
	bookingId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 100, INCREMENT BY 1),
	senderName VARCHAR(50),
	senderAddress VARCHAR(200),
	senderCountryCode VARCHAR(25),
	senderMobileNumber VARCHAR(10),
	receiverName VARCHAR(50),
	receiverAddress VARCHAR(200),
	receiverPin VARCHAR(6),
	receiverCountryCode VARCHAR(25),
	receiverMobileNumber VARCHAR(10),
	parcelWeight DOUBLE,
	parcelContentsDescription VARCHAR(200),
	parcelDeliveryType VARCHAR(40),
	parcelPackingPreference VARCHAR(40),
	parcelPickupTime TIMESTAMP,
	parcelDropoffTime TIMESTAMP,
	parcelServiceCost DOUBLE,
	parcelPaymentTime TIMESTAMP,
	parcelStatus VARCHAR(50),
	dateOfBooking DATE,
	FOREIGN KEY (userId) REFERENCES users(userId)
);

INSERT INTO bookings(userId, receiverName, receiverAddress, receiverPin, receiverCountryCode, receiverMobileNumber, parcelWeight, parcelContentsDescription, parcelDeliveryType,
	parcelPackingPreference, parcelPickupTime, parcelDropoffTime, parcelServiceCost, parcelPaymentTime, parcelStatus, dateOfBooking
)  VALUES ('12345', 'Arjun', 'Bhutan', '110065', '+91','1234567895', 240.5, 'Lunch box', 'Standard', 'Fragile', '2024-02-01 12:00:00', '2024-02-11 18:00:00',
	200, '2024-01-01 11:00:00', 'Booked', '2024-01-01'
);

SELECT * FROM bookings;
TRUNCATE TABLE bookings;
DROP TABLE bookings;
DELETE FROM bookings WHERE userId = '12345';

SELECT bookings.bookingId, users.name, users.address, bookings.receiverName, bookings.receiverAddress, bookings.dateOfBooking, bookings.parcelStatus 
FROM bookings JOIN users ON users.userId = bookings.userId WHERE bookingId = 62851;