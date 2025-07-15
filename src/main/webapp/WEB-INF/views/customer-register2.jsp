<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<body>
	<div class="bg-dark d-flex justify-content-center p-4">
		<div class="border bg-light p-4" style="width: 500px;">
			<h1>Registration</h1>
			<%
			if ("success".equals(request.getAttribute("status"))) {
			%>
			<div class="alert alert-success">
				Registration successfull. Procced to <a
					href="<%=request.getContextPath()%>/login">Log In</a>
			</div>
			<%
			} else if ("error".equals(request.getAttribute("status"))) {
			%>
			<div class="alert alert-danger"><%=request.getAttribute("errorMessage")%></div>
			<%
			}
			%>
			<form action="<%=request.getContextPath()%>/customer-register"
				method="post" onsubmit="return validateRegistration()">
				<p>
					<label class="form-label" for="name">Name</label> <input
						class="form-control" type="text" name="name" id="name"
						placeholder="Enter Name" required /> <small
						class="invalid-feedback">Name can only have alphabets and
						spaces</small>
				</p>
				<p>
					<label class="form-label" for="email">Email</label> <input
						class="form-control" type="email" name="email" id="email"
						placeholder="Enter Email" required />
				</p>
				<p>
					<label class="form-label" for="mobileNumber">Mobile Number</label>
					<span> <select class="form-select mt-1 mb-1"
						name="countryCode" id="countryCode" required>
							<option value="+91">+91 (India)</option>
							<option value="+1">+1 (USA)</option>
					</select> <input class="form-control" type="number"
						oninput="this.value=this.value.slice(0,10)" maxlength="10"
						name="mobileNumber" id="mobileNumber"
						placeholder="Enter mobile number" required /> <small
						class="invalid-feedback">Mobile Number should be 10 digits</small>
					</span>
				</p>
				<p>
					<label class="form-label" for="address">Address</label>
					<textarea maxlength="150" class="form-control" name="address"
						id="address" placeholder="Enter address" required></textarea>
					<small class="invalid-feedback">Address must have only
						alphabets, numbers and spaces</small>
				</p>
				<p>
					<label class="form-label" for="userId">User ID</label> <input
						class="form-control" minlength="5" maxlength="15" type="text"
						name="userId" id="userId" placeholder="Enter User Id" required />
					<small class="invalid-feedback">User Id must be between 5
						and 15 characters</small>
				</p>
				<p>
					<label class="form-label" for="password">Password</label> <input
						class="form-control" type="password" name="password" id="password"
						placeholder="Enter Password" required /> <small
						class="invalid-feedback">Password must be maximum 8
						characters long having minimum one uppercase, lowercase and
						special character</small>
				</p>
				<p>
					<label class="form-label" for="confirmPassword">Confirm
						Password</label> <input class="form-control" type="password"
						name="confirmPassword" id="confirmPassword"
						placeholder="Confirm Password" required /> <small
						class="invalid-feedback">Password and Confirm Password
						fields must match</small>
				</p>
				<p>
					<input type="checkbox" id="emailNotifications"
						name="emailNotifications" id="emailNotifications" /> <label
						class="form-label" for="emailNotifications">Receive email
						notifications related to delivery</label>
				</p>

				<div class="d-flex justify-content-center">
					<button class="btn btn-primary" style="margin-right: 8px;"
						type="submit">Register</button>
					<button class="btn btn-primary" type="reset" onclick="resetForm()">Reset</button>
				</div>

				<div class="text-center mt-2">
					Already have an account ? <a
						href="<%=request.getContextPath()%>/login">Log In</a>
				</div>
			</form>
		</div>

	</div>

	<script>
		function validateRegistration() {
			const name = document.getElementById("name");
		    const phonenumber = document.getElementById("mobileNumber");
		    const address = document.getElementById("address");
		    const userid = document.getElementById("userId");
		    const password = document.getElementById("password");
		    const confirmPassword = document.getElementById("confirmPassword");
		    const nameRegex = /^[A-Za-z\s]+$/;
		    
		    name.classList.remove("is-invalid");
		    phonenumber.classList.remove("is-invalid");
		    address.classList.remove("is-invalid");
		    userid.classList.remove("is-invalid");
		    password.classList.remove("is-invalid");
		    confirmPassword.classList.remove("is-invalid");
		    
		    let flag = true;
		    
		    if(name.value.length > 50) {
		    	name.classList.add("is-invalid");
		    	flag = false;
		    }
		    
		    if(!nameRegex.test(name.value)) {
		    	name.classList.add("is-invalid");
	            flag = false;
			}
		    
		    const phoneRegex = /^\d{10}$/;
		    if(!phoneRegex.test(phonenumber.value)) {
		    	phonenumber.classList.add("is-invalid");
		        flag =  false;
		    }
		    
		    const noSpecialCharRegex = /^[A-Za-z0-9 ]+$/;
		    if(!noSpecialCharRegex.test(address.value)) {
		    	address.classList.add("is-invalid");
		    	flag = false;
		    }
		    
		    if(userid.value.length < 5 || userid.value.length > 20) {
		    	userid.classList.add("is-invalid");
		        flag = false;
		    }
		    
		    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{1,8}$/;
		    if(!passwordRegex.test(password.value)) {
		    	password.classList.add("is-invalid");
		        flag = false;
		    }
		    
		    if(password.value != confirmPassword.value) {
		    	confirmPassword.classList.add("is-invalid");
		        flag = false;
		    }
		    return flag;
		}
		
		function resetForm() {
			const name = document.getElementById("name");
		    const phonenumber = document.getElementById("mobileNumber");
		    const userid = document.getElementById("userId");
		    const password = document.getElementById("password");
		    const confirmPassword = document.getElementById("confirmPassword");
		    const nameRegex = /^[A-Za-z\s]+$/;
		    
		    name.classList.remove("is-invalid");
		    phonenumber.classList.remove("is-invalid");
		    address.classList.remove("is-invalid");
		    userid.classList.remove("is-invalid");
		    password.classList.remove("is-invalid");
		    confirmPassword.classList.remove("is-invalid");
		}
	</script>
</body>
</html>
