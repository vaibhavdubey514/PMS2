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
<title>Delivery Status Update</title>

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
}

nav a:hover {
    background-color: #2c3e50;
    border-radius: 4px;
}

h2 {
    font-size: 2rem;
    color: #2c3e50;
    text-align: center;
    margin-top: 40px;
}

.tracking-form-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.tracking-form-container form {
    display: flex;
    align-items: center;
    gap: 10px;
    background-color: #fff;
    padding: 20px 25px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.tracking-form-container input[type="number"] {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 200px;
}

.tracking-form-container button {
    padding: 10px 18px;
    background-color: #34495e;
    color: white;
    border: none;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
}

.tracking-form-container button:hover {
    background-color: #2c3e50;
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

table {
    width: 90%;
    border-collapse: collapse;
    margin: 30px auto;
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

.form-group {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

select {
    padding: 10px;
    font-size: 14px;
    border-radius: 6px;
    border: 1px solid #ccc;
    width: 220px;
}

select.is-invalid {
    border-color: red;
}

.invalid-feedback {
    color: red;
    font-size: 12px;
    margin-top: 5px;
    display: none;
}

.access-denied {
    text-align: center;
    margin-top: 80px;
    font-size: 24px;
    color: #c0392b;
}

h4{
	margin:0px;
}
</style>
</head>
<body>

<%
if ("Customer".equals(request.getAttribute("role"))) {
%>
	<div class="access-denied">Access Denied</div>
<%
} else {
%>

<jsp:include page="navbar.jsp" />

<h2>Delivery Status Update</h2>

<div class="tracking-form-container">
	<form action="<%=request.getContextPath()%>/delivery-status" method="post" onsubmit="return validateForm()">
		<input type="number" id="bookingId" name="bookingId" placeholder="Enter Booking ID" oninput="this.value=this.value.slice(0,9)" required />
		<button type="submit">Search</button>
	</form>
</div>

<%
if ("success".equals(request.getAttribute("status"))) {
%>
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
		</tr>
	</tbody>
</table>

<form action="<%=request.getContextPath()%>/delivery-status" method="post">
	<div class="form-group">
		<input type="hidden" name="bookingIdValue" value="<%=request.getAttribute("bookingId")%>" />
		<h4><label for="parcelStatus">Parcel Status</label></h4>
		<select name="parcelStatus" id="parcelStatus" required>
			<option value="" disabled selected>Select Parcel Status</option>
			<option value="Booked">Booked</option>
			<option value="In Transit">In Transit</option>
			<option value="Delivered">Delivered</option>
			<option value="Returned">Returned</option>
		</select>
		<span class="invalid-feedback" id="statusError">Please choose a status</span>
	</div>
	<div class="form-group">
		<button class="tracking-form-container button" type="submit" onclick="confirmUpdate(event)" style="padding: 10px 18px; background-color: #34495e; color: white; border: none; border-radius: 4px; font-weight: bold; cursor: pointer;">Update</button>
	</div>
</form>
<%
}
%>
<%
}
%>

<%
if ("success".equals(request.getAttribute("updateStatus"))) {
%>
	<div class="alert alert-success">Updated Successfully</div>
<%
}
if ("error".equals(request.getAttribute("status"))) {
%>
	<div class="alert alert-danger"><%=request.getAttribute("errorMessage")%></div>
<%
}
%>

<script>
function validateForm() {
	const bookingId = document.getElementById("bookingId").value;
	if (!/^\d+$/.test(bookingId)) {
		alert("Booking ID must be a number");
		return false;
	}
	return true;
}

function confirmUpdate(event) {
	const parcelStatus = document.getElementById("parcelStatus");
	const errorSpan = document.getElementById("statusError");

	parcelStatus.classList.remove("is-invalid");
	errorSpan.style.display = "none";

	if (!parcelStatus.value) {
		event.preventDefault();
		parcelStatus.classList.add("is-invalid");
		errorSpan.style.display = "block";
		return;
	}

	if (!confirm("Are you sure you want to update delivery status?")) {
		event.preventDefault();
	}
}
</script>
</body>
</html>
