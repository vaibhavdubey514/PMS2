package com.pms.models;

public class Booking {
	private int bookingId;
	private String senderName, senderAddress, senderCountryCode, senderMobileNumber;
	private String receiverName, receiverAddress, receiverPin, receiverCountryCode, receiverMobileNumber,
			parcelContentsDescription, parcelDeliveryType, parcelPackingPreference, parcelPickupTime, parcelDropoffTime,
			parcelPaymentTime, parcelStatus, dateOfBooking;
	private double parcelWeight, parcelServiceCost;

	public Booking(int bookingId, String senderName, String senderAddress, String senderCountryCode,
			String senderMobileNumber, String receiverName, String receiverAddress, String receiverPin,
			String receiverCountryCode, String receiverMobileNumber, double parcelWeight,
			String parcelContentsDescription, String parcelDeliveryType, String parcelPackingPreference,
			String parcelPickupTime, String parcelDropoffTime, double parcelServiceCost, String parcelPaymentTime,
			String parcelStatus, String dateOfBooking) {
		this.bookingId = bookingId;
		this.senderName = senderName;
		this.senderAddress = senderAddress;
		this.senderCountryCode = senderCountryCode;
		this.senderMobileNumber = senderMobileNumber;
		this.receiverName = receiverName;
		this.receiverAddress = receiverAddress;
		this.receiverPin = receiverPin;
		this.receiverCountryCode = receiverCountryCode;
		this.receiverMobileNumber = receiverMobileNumber;
		this.parcelWeight = parcelWeight;
		this.parcelContentsDescription = parcelContentsDescription;
		this.parcelDeliveryType = parcelDeliveryType;
		this.parcelPackingPreference = parcelPackingPreference;
		this.parcelPickupTime = parcelPickupTime;
		this.parcelDropoffTime = parcelDropoffTime;
		this.parcelServiceCost = parcelServiceCost;
		this.parcelPaymentTime = parcelPaymentTime;
		this.parcelStatus = parcelStatus;
		this.dateOfBooking = dateOfBooking;
	}

	public int getBookingId() {
		return bookingId;
	}

	public String getSenderName() {
		return senderName;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public String getSenderCountryCode() {
		return senderCountryCode;
	}

	public String getSenderMobileNumber() {
		return senderMobileNumber;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getReceiverPin() {
		return receiverPin;
	}

	public void setReceiverPin(String receiverPin) {
		this.receiverPin = receiverPin;
	}

	public String getReceiverCountryCode() {
		return receiverCountryCode;
	}

	public void setReceiverCountryCode(String receiverCountryCode) {
		this.receiverCountryCode = receiverCountryCode;
	}

	public String getReceiverMobileNumber() {
		return receiverMobileNumber;
	}

	public void setReceiverMobileNumber(String receiverMobileNumber) {
		this.receiverMobileNumber = receiverMobileNumber;
	}

	public String getParcelContentsDescription() {
		return parcelContentsDescription;
	}

	public void setParcelContentsDescription(String parcelContentsDescription) {
		this.parcelContentsDescription = parcelContentsDescription;
	}

	public String getParcelDeliveryType() {
		return parcelDeliveryType;
	}

	public void setParcelDeliveryType(String parcelDeliveryType) {
		this.parcelDeliveryType = parcelDeliveryType;
	}

	public String getParcelPackingPreference() {
		return parcelPackingPreference;
	}

	public void setParcelPackingPreference(String parcelPackingPreference) {
		this.parcelPackingPreference = parcelPackingPreference;
	}

	public String getParcelPickupTime() {
		return parcelPickupTime;
	}

	public void setParcelPickupTime(String parcelPickupTime) {
		this.parcelPickupTime = parcelPickupTime;
	}

	public String getParcelDropoffTime() {
		return parcelDropoffTime;
	}

	public void setParcelDropoffTime(String parcelDropoffTime) {
		this.parcelDropoffTime = parcelDropoffTime;
	}

	public String getParcelPaymentTime() {
		return parcelPaymentTime;
	}

	public void setParcelPaymentTime(String parcelPaymentTime) {
		this.parcelPaymentTime = parcelPaymentTime;
	}

	public String getParcelStatus() {
		return parcelStatus;
	}

	public void setParcelStatus(String parcelStatus) {
		this.parcelStatus = parcelStatus;
	}

	public String getDateOfBooking() {
		return dateOfBooking;
	}

	public void setDateOfBooking(String dateOfBooking) {
		this.dateOfBooking = dateOfBooking;
	}

	public double getParcelWeight() {
		return parcelWeight;
	}

	public void setParcelWeight(double parcelWeight) {
		this.parcelWeight = parcelWeight;
	}

	public double getParcelServiceCost() {
		return parcelServiceCost;
	}

	public void setParcelServiceCost(double parcelServiceCost) {
		this.parcelServiceCost = parcelServiceCost;
	}
}