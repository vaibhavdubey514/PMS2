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
<title>Pickup Scheduling</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f6f8;
    margin: 0;
    padding: 0;
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

h2 {
    font-size: 2rem;
    color: #2c3e50;
    text-align: center;
    margin-top: 40px;
}

.form-container, .update-form {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

form {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px;
    background-color: white;
    padding: 25px 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    width: fit-content;
}

input[type="number"], input[type="datetime-local"] {
    padding: 10px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 6px;
    width: 250px;
}

button {
    padding: 10px 20px;
    background-color: #34495e;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #2c3e50;
}

table {
    width: 90%;
    margin: 30px auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

thead {
    background-color: #2c3e50;
    color: white;
}

th, td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

tbody tr:hover {
    background-color: #e1e7ed;
    transition: background-color 0.3s ease;
}

.alert {
    padding: 12px 20px;
    margin: 20px auto;
    width: 500px;
    font-weight: bold;
    border-radius: 6px;
    box-shadow: 0 0 6px rgba(0,0,0,0.1);
    text-align: center;
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

<%
if ("Customer".equals(request.getAttribute("role"))) {
%>
<h2 class="text-center">Access Denied</h2>
<%
} else {
%>

<h2>Pickup Scheduling</h2>

<div class="form-container">
	<form action="<%=request.getContextPath()%>/pickup-scheduling" method="post" onsubmit="return validateBookingId()">
		<input type="number" name="bookingId" id="bookingId" placeholder="Enter Booking ID" oninput="this.value=this.value.slice(0,9)" required />
		<button type="submit">Search</button>
	</form>
</div>

<% if ("success".equals(request.getAttribute("status"))) { %>
<table>
	<thead>
		<tr>
			<th>Booking Id</th>
			<th>Name</th>
			<th>Address</th>
			<th>Receiver Name</th>
			<th>Receiver Address</th>
			<th>Date of Booking</th>
			<th>Parcel Status</th>
			<th>Parcel Pickup Time</th>
			<th>Parcel Dropoff Time</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><%=request.getAttribute("bookingId")%></td>
			<td><%=request.getAttribute("name")%></td>
			<td><%=request.getAttribute("address")%></td>
			<td><%=request.getAttribute("receiverName")%></td>
			<td><%=request.getAttribute("receiverAddress")%></td>
			<td><%=request.getAttribute("dateOfBooking")%></td>
			<td><%=request.getAttribute("parcelStatus")%></td>
			<td><%=request.getAttribute("parcelPickupTime")%></td>
			<td><%=request.getAttribute("parcelDropoffTime")%></td>
		</tr>
	</tbody>
</table>

<div class="update-form">
	<form action="<%=request.getContextPath()%>/pickup-scheduling" method="post" onsubmit="return validateDeliveryTimes()">
		<input type="hidden" name="bookingIdValue" value="<%=request.getAttribute("bookingId")%>" readonly />

		<div style="display: flex; gap: 20px; flex-wrap: wrap; justify-content: center;">
			<div>
				<label for="parcelPickupTime">Pickup Time</label><br/>
				<input type="datetime-local" name="parcelPickupTime" id="parcelPickupTime" required />
			</div>

			<div>
				<label for="parcelDropoffTime">Dropoff Time</label><br/>
				<input type="datetime-local" name="parcelDropoffTime" id="parcelDropoffTime" required />
			</div>
		</div>

		<div style="margin-top: 20px; text-align: center;">
			<button type="submit" onclick="confirmUpdate(event)">Update</button>
		</div>
	</form>
</div>
<% } %>
<% } %>

<% if ("success".equals(request.getAttribute("updateStatus"))) { %>
	<div class="alert alert-success">Updated Successfully</div>
<% } %>

<% if ("error".equals(request.getAttribute("status"))) { %>
	<div class="alert alert-danger"><%=request.getAttribute("errorMessage")%></div>
<% } %>

<script>
	function validateBookingId() {
		const bookingId = document.getElementById("bookingId").value;
		const pattern = /^\d+$/;
		if (!pattern.test(bookingId)) {
			alert("Booking ID must be a number");
			return false;
		}
		return true;
	}

	document.addEventListener("DOMContentLoaded", function() {
		const pickup = document.getElementById("parcelPickupTime");
		const dropoff = document.getElementById("parcelDropoffTime");
		if (pickup && dropoff) {
			const now = new Date();
			const year = now.getFullYear();
			const month = String(now.getMonth() + 1).padStart(2, '0');
			const day = String(now.getDate() + 1).padStart(2, '0');
			const hours = String(now.getHours()).padStart(2, '0');
			const minutes = String(now.getMinutes()).padStart(2, '0');
			const minDate = `${year}-${month}-${day}T${hours}:${minutes}`;
			pickup.min = minDate;
			dropoff.min = minDate;
		}
	});

	function validateDeliveryTimes() {
		const pickup = document.getElementById("parcelPickupTime");
		const dropoff = document.getElementById("parcelDropoffTime");

		const pickupTime = new Date(pickup.value);
		const dropoffTime = new Date(dropoff.value);

		pickup.classList.remove("is-invalid");
		dropoff.classList.remove("is-invalid");

		if (!dropoff.value || dropoffTime <= pickupTime) {
			pickup.classList.add("is-invalid");
			dropoff.classList.add("is-invalid");
			
			alert("Dropoff time must be after Pickup time.");
			return false;
		}
		return true;
	}

	function confirmUpdate(event) {
		if (!validateDeliveryTimes()) {
			event.preventDefault();
			return;
		}
		if (!confirm("Are you sure you want to update pickup and dropoff?")) {
			event.preventDefault();
		}
	}
</script>
</body>
</html>
