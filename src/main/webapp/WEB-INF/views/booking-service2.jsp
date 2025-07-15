<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
	response.sendRedirect(request.getContextPath() + "/login");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<title>Booking Service</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f6f8;
    color: #333;
}

nav {
    background-color: #34495e;
    padding: 15px 0;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}

nav li {
    margin: 0 15px;
}

nav a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    padding: 6px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

nav a:hover {
    background-color: #2c3e50;
}

.container {
    max-width: 960px;
    margin: 40px auto;
    background: #ffffff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-size: 2rem;
}

label {
    font-weight: 600;
    display: block;
    margin-bottom: 6px;
    color: #2c3e50;
}

input, select, textarea {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
    box-sizing: border-box;
    transition: border-color 0.3s;
    background-color: #fff;
}

input:focus, select:focus, textarea:focus {
    border-color: #3498db;
    outline: none;
}

textarea {
    resize: vertical;
}

.row {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-bottom: 20px;
}

.col {
    flex: 1;
    min-width: 260px;
}

button {
    background-color: #34495e;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #2c3e50;
}

.text-center {
    text-align: center;
    margin-top: 30px;
}

.alert {
    padding: 12px 20px;
    margin-bottom: 20px;
    border-radius: 6px;
    font-size: 15px;
    font-weight: bold;
    box-shadow: 0 0 6px rgba(0,0,0,0.1);
    width: 100%;
}

.alert-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert-danger {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.invalid-feedback {
    color: red;
    font-size: 12px;
    display: none;
    margin-top: 5px;
}

.is-invalid + .invalid-feedback {
    display: block;
}
</style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
	<% if ("success".equals(request.getAttribute("status"))) { %>
		<div class="alert alert-success">
			Booking Successful. Your Booking ID:
			<%=request.getAttribute("bookingId")%>. 
			<a href="<%=request.getContextPath()%>/invoice?bid=<%=request.getAttribute("bookingId")%>">View Invoice</a>
		</div>
	<% } else if ("error".equals(request.getAttribute("status"))) { %>
		<div class="alert alert-danger"><%=request.getAttribute("errorMessage")%></div>
	<% } %>

	<h2>Booking Service</h2>

	<form id="booking-form" action="<%=request.getContextPath()%>/booking-service" method="post" onsubmit="return validateBooking()">
		<!-- Sender Details (Customer or Staff) -->
		<% if ("Customer".equals(request.getAttribute("role"))) { %>
			<div class="row">
				<p class="col">
					<label for="senderNameCustomer">Sender Name</label>
					<input type="text" name="senderName" id="senderNameCustomer" value="<%=request.getAttribute("senderName")%>" readonly />
				</p>
				<p class="col">
					<label for="senderAddressCustomer">Sender Address</label>
					<input type="text" name="senderAddress" id="senderAddressCustomer" value="<%=request.getAttribute("senderAddress")%>" readonly />
				</p>
				<p class="col">
					<label for="senderCountryCodeCustomer">Sender Country Code</label>
					<select name="senderCountryCode" id="senderCountryCodeCustomer" disabled>
						<option selected value="<%=request.getAttribute("senderCountryCode")%>"><%=request.getAttribute("senderCountryCode")%></option>
					</select>
				</p>
			</div>
			<div class="row">
				<p class="col">
					<label for="senderMobileNumberCustomer">Sender Mobile Number</label>
					<input type="number" minlength="10" maxlength="10" name="senderMobileNumber" id="senderMobileNumberCustomer" value="<%=request.getAttribute("senderMobileNumber")%>" readonly />
				</p>
			</div>
		<% } else { %>
			<div class="row">
				<p class="col">
					<label for="senderNameOfficer">Sender Name</label>
					<input type="text" maxlength="50" name="senderName" id="senderNameOfficer" placeholder="Enter Sender Name" required />
					<small class="invalid-feedback">Only alphabets and spaces</small>
				</p>
				<p class="col">
					<label for="senderAddressOfficer">Sender Address</label>
					<input type="text" maxlength="150" name="senderAddress" id="senderAddressOfficer" placeholder="Enter Sender Address" required />
					<small class="invalid-feedback">Only alphanumeric and spaces</small>
				</p>
				<p class="col">
					<label for="senderCountryCodeOfficer">Country Code</label>
					<select name="senderCountryCode" id="senderCountryCodeOfficer" required>
						<option value="+91">+91 (India)</option>
						<option value="+1">+1 (USA)</option>
					</select>
				</p>
			</div>
			<div class="row">
				<p class="col">
					<label for="senderMobileNumberOfficer">Sender Mobile Number</label>
					<input type="number" minlength="10" maxlength="10" name="senderMobileNumber" id="senderMobileNumberOfficer" placeholder="Enter Sender Mobile Number" oninput="this.value=this.value.slice(0,10)" required />
					<small class="invalid-feedback">Exactly 10 digits</small>
				</p>
			</div>
		<% } %>

		<!-- Receiver & Parcel Info -->
		<div class="row">
			<p class="col">
				<label for="receiverName">Receiver Name</label>
				<input type="text" maxlength="50" name="receiverName" id="receiverName" placeholder="Enter Receiver Name" required />
				<small class="invalid-feedback">Only alphabets and spaces</small>
			</p>
			<p class="col">
				<label for="receiverAddress">Receiver Address</label>
				<input type="text" maxlength="150" name="receiverAddress" id="receiverAddress" placeholder="Enter Receiver Address" required />
				<small class="invalid-feedback">Only alphanumeric and spaces</small>
			</p>
			<p class="col">
				<label for="receiverPin">Receiver Pin</label>
				<input type="number" minlength="6" maxlength="6" name="receiverPin" id="receiverPin" placeholder="Enter Receiver Pin" oninput="this.value=this.value.slice(0,6)" required />
				<small class="invalid-feedback">Exactly 6 digits</small>
			</p>
		</div>

		<div class="row">
			<p class="col">
				<label for="receiverCountryCode">Country Code</label>
				<select name="receiverCountryCode" id="receiverCountryCode" required>
					<option value="+91">+91 (India)</option>
					<option value="+1">+1 (USA)</option>
				</select>
			</p>
			<p class="col">
				<label for="receiverMobileNumber">Receiver Mobile Number</label>
				<input type="number" minlength="10" maxlength="10" name="receiverMobileNumber" id="receiverMobileNumber" placeholder="Enter Receiver Mobile Number" oninput="this.value=this.value.slice(0,10)" required />
				<small class="invalid-feedback">Exactly 10 digits</small>
			</p>
			<p class="col">
				<label for="parcelWeight">Parcel Weight (g)</label>
				<input type="number" name="parcelWeight" id="parcelWeight" placeholder="Enter Parcel Weight" oninput="this.value=this.value.slice(0,4)" required />
				<small class="invalid-feedback">Must be positive</small>
			</p>
		</div>

		<div class="row">
			<p class="col">
				<label for="parcelContentsDescription">Contents Description</label>
				<textarea maxlength="150" name="parcelContentsDescription" id="parcelContentsDescription" placeholder="Enter Description" required></textarea>
				<small class="invalid-feedback">Only alphabets and spaces</small>
			</p>
			<p class="col">
				<label for="parcelDeliveryType">Delivery Type</label>
				<select name="parcelDeliveryType" id="parcelDeliveryType" required>
					<option value="" disabled selected>Select Delivery Type</option>
					<option value="Standard">Standard</option>
					<option value="Express">Express</option>
				</select>
			</p>
			<p class="col">
				<label for="parcelPackingPreference">Packing Preference</label>
				<select name="parcelPackingPreference" id="parcelPackingPreference" required>
					<option value="" disabled selected>Select Packing Preference</option>
					<option value="Standard">Standard</option>
					<option value="Fragile">Fragile</option>
				</select>
			</p>
		</div>

		<div class="row">
			<p class="col">
				<label for="parcelPickupTime">Pickup Time</label>
				<input type="datetime-local" name="parcelPickupTime" id="parcelPickupTime" required />
			</p>
			<p class="col">
				<label for="parcelDropoffTime">Dropoff Time</label>
				<input type="datetime-local" name="parcelDropoffTime" id="parcelDropoffTime" required />
			</p>
			<p class="col">
				<label for="parcelServiceCost">Service Cost (Rs)</label>
				<input type="text" name="parcelServiceCost" id="parcelServiceCost" value="0" readonly />
			</p>
		</div>

		<div class="text-center">
			<button type="submit">Book</button>
		</div>
	</form>
</div>

<script>
// Set min date for pickup/dropoff
document.addEventListener("DOMContentLoaded", function() {
	const pickup = document.getElementById("parcelPickupTime");
	const dropoff = document.getElementById("parcelDropoffTime");
	const now = new Date();
	const year = now.getFullYear();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	const day = String(now.getDate() + 1).padStart(2, '0');
	const hours = String(now.getHours()).padStart(2, '0');
	const minutes = String(now.getMinutes()).padStart(2, '0');
	const minDate = `${year}-${month}-${day}T${hours}:${minutes}`;
	pickup.min = minDate;
	dropoff.min = minDate;
});

// Cost Calculation
function calculateServiceCost() {
	let cost = 0;
	const weight = parseFloat(document.getElementById("parcelWeight").value) || 0;
	const type = document.getElementById("parcelDeliveryType").value;
	const pack = document.getElementById("parcelPackingPreference").value;

	if (type === "Standard") cost += 50;
	else if (type === "Express") cost += 100;

	if (pack === "Standard") cost += 20;
	else if (pack === "Fragile") cost += 40;

	cost += weight * 0.1;
	document.getElementById("parcelServiceCost").value = Math.round(cost * 10) / 10;
}

document.getElementById("booking-form").addEventListener("input", calculateServiceCost);

// Simple final form validation
function validateBooking() {
	return true;
}
</script>

</body>
</html>
