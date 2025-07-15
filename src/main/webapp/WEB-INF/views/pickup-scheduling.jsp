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
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pickup Scheduling</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    primary: '#2563eb',
                    secondary: '#64748b',
                    accent: '#0f172a'
                }
            }
        }
    }
</script>
<style>
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px); }
        50% { transform: translateY(-10px); }
    }

    .fade-in {
        animation: fadeIn 0.8s ease-out;
    }

    .floating-shape {
        animation: float 6s ease-in-out infinite;
    }

    .floating-shape:nth-child(2) {
        animation-delay: -2s;
    }

    .floating-shape:nth-child(3) {
        animation-delay: -4s;
    }

    .background-pattern {
        background-image:
            radial-gradient(circle at 20% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 80%, rgba(99, 102, 241, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 40% 60%, rgba(139, 92, 246, 0.05) 0%, transparent 50%);
    }

    .glass-effect {
        backdrop-filter: blur(20px);
        background: rgba(255, 255, 255, 0.9);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    /* Add padding to account for fixed navbar */
    body {
        padding-top: 60px;
    }

    @media (max-width: 768px) {
        body {
            padding-top: 120px;
        }
    }

    /* Additional styles for invalid feedback (from original code, integrated with Tailwind) */
    .is-invalid {
        border-color: #ef4444; /* red-500 */
        box-shadow: 0 0 0 2px rgba(239, 68, 68, 0.2); /* red-500 with opacity */
    }
    .invalid-feedback {
        color: #ef4444; /* red-500 */
        font-size: 0.875rem; /* text-sm */
        margin-top: 0.5rem; /* mt-2 */
        display: none;
    }
    .is-invalid + .invalid-feedback {
        display: block;
    }
</style>
</head>
<body class="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 background-pattern">
    <div class="fixed inset-0 pointer-events-none z-0">
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute top-40 right-20 w-40 h-40 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-20 left-1/3 w-36 h-36 bg-indigo-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-40 right-1/3 w-28 h-28 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
    </div>

<jsp:include page="navbar.jsp" />

<%
if ("Customer".equals(request.getAttribute("role"))) {
%>
    <div class="relative z-10 min-h-screen py-8 px-4 flex items-center justify-center">
        <div class="glass-effect rounded-2xl shadow-xl p-8 max-w-md w-full text-center fade-in">
            <div class="w-16 h-16 mx-auto mb-6 bg-red-500 rounded-full flex items-center justify-center">
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636"></path>
                </svg>
            </div>
            <h1 class="text-3xl font-bold mb-4 bg-gradient-to-r from-red-600 to-pink-600 bg-clip-text text-transparent">Access Denied</h1>
            <p class="text-gray-600 text-lg">You do not have permission to view this page.</p>
        </div>
    </div>
<%
} else {
%>
<div class="relative z-10 min-h-screen py-8 px-4">
    <div class="max-w-7xl mx-auto fade-in">
        <div class="text-center mb-10">
            <h1 class="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                Pickup Scheduling
            </h1>
            <p class="text-gray-600 text-lg">Schedule pickup and dropoff times for parcels</p>
        </div>

        <div class="flex justify-center mb-10">
            <form action="<%=request.getContextPath()%>/pickup-scheduling" method="post" onsubmit="return validateBookingId()" class="glass-effect rounded-2xl shadow-lg p-8 w-full max-w-xl space-y-6">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gradient-to-r from-blue-500 to-cyan-500 rounded-xl flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-800">Search Booking</h3>
                        <p class="text-gray-600 text-sm">Enter Booking ID to find details</p>
                    </div>
                </div>
                <input type="number" name="bookingId" id="bookingId" placeholder="Enter Booking ID" oninput="this.value=this.value.slice(0,9)" required
                       class="w-full p-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-indigo-400 focus:outline-none transition-all duration-200 text-sm" />
                <button type="submit" class="w-full py-3 rounded-lg bg-gradient-to-r from-blue-600 to-purple-600 text-white font-semibold shadow-md hover:shadow-lg hover:-translate-y-1 transition-all duration-300">
                    <svg class="w-4 h-4 mr-2 inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                    Search
                </button>
            </form>
        </div>

        <% if ("success".equals(request.getAttribute("status"))) { %>
        <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden mb-10 fade-in">
            <div class="bg-gradient-to-r from-blue-50 to-purple-50 p-4 border-b border-blue-200">
                <h3 class="text-xl font-bold text-blue-800">Booking Details</h3>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Booking Id</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Name</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Address</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Receiver Name</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Receiver Address</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Date of Booking</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Parcel Status</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Parcel Pickup Time</th>
                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Parcel Dropoff Time</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <tr class="hover:bg-gray-50 transition-colors duration-200">
                            <td class="px-4 py-4 text-sm font-semibold text-gray-900"><%=request.getAttribute("bookingId")%></td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("name")%></td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("address")%></td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("receiverName")%></td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("receiverAddress")%></td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("dateOfBooking")%></td>
                            <td class="px-4 py-4 text-sm">
                                <span class="px-3 py-1 rounded-full text-xs font-semibold
                                    <% String parcelStatus = ((String) request.getAttribute("parcelStatus")).trim().toLowerCase();
                                       if ("delivered".equals(parcelStatus)) { %>
                                            bg-green-100 text-green-800
                                        <% } else if ("booked".equals(parcelStatus)) { %>
                                            bg-blue-100 text-blue-800
                                        <% } else if ("in transit".equals(parcelStatus)) { %>
                                            bg-yellow-100 text-yellow-800
                                        <% } else if ("cancelled".equals(parcelStatus)) { %>
                                            bg-red-100 text-red-800
                                        <% } else { %>
                                            bg-gray-100 text-gray-800
                                        <% } %>">
                                    <%=request.getAttribute("parcelStatus")%>
                                </span>
                            </td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("parcelPickupTime")%></td>
                            <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("parcelDropoffTime")%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%
            String currentStatusForUpdate = ((String) request.getAttribute("parcelStatus")).trim().toLowerCase();
            boolean isCancelled = "cancelled".equals(currentStatusForUpdate);
        %>

        <div class="flex justify-center fade-in">
            <% if (!isCancelled) { %>
                <form action="<%=request.getContextPath()%>/pickup-scheduling" method="post" onsubmit="return confirmUpdate(event)" class="glass-effect rounded-2xl shadow-lg p-8 w-full max-w-xl space-y-6">
                    <input type="hidden" name="bookingIdValue" value="<%=request.getAttribute("bookingId")%>" readonly />

                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 bg-gradient-to-r from-green-500 to-teal-500 rounded-xl flex items-center justify-center mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004 14.582V12m.008-6.008z"></path>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-xl font-bold text-gray-800">Update Pickup/Dropoff Times</h3>
                            <p class="text-gray-600 text-sm">Set specific times for parcel collection and delivery</p>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="parcelPickupTime" class="block text-sm font-semibold text-gray-700 mb-2">Pickup Time:</label>
                            <input type="datetime-local" name="parcelPickupTime" id="parcelPickupTime" required
                                   class="w-full p-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-purple-500 focus:outline-none transition-all duration-200 text-sm" />
                            <span class="invalid-feedback" id="pickupTimeError">Pickup time is required.</span>
                        </div>

                        <div>
                            <label for="parcelDropoffTime" class="block text-sm font-semibold text-gray-700 mb-2">Dropoff Time:</label>
                            <input type="datetime-local" name="parcelDropoffTime" id="parcelDropoffTime" required
                                   class="w-full p-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-purple-500 focus:outline-none transition-all duration-200 text-sm" />
                            <span class="invalid-feedback" id="dropoffTimeError">Dropoff time must be after pickup time.</span>
                        </div>
                    </div>

                    <div class="text-center pt-4">
                        <button type="submit" class="w-full py-3 bg-gradient-to-r from-purple-600 to-indigo-600 text-white font-semibold rounded-lg shadow-md hover:shadow-lg hover:-translate-y-1 transition-all duration-300">
                            <svg class="w-4 h-4 mr-2 inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                            </svg>
                            Update Schedule
                        </button>
                    </div>
                </form>
            <% } else { %>
                <div class="bg-red-100 text-red-800 text-center font-semibold p-4 rounded-lg max-w-xl mx-auto glass-effect fade-in">
                    <div class="flex items-center justify-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                        Status is <strong>Cancelled</strong>. Cannot be edited.
                    </div>
                </div>
            <% } %>
        </div>
        <% } %>

        <% if ("success".equals(request.getAttribute("updateStatus"))) { %>
            <div class="bg-green-100 text-green-800 text-center font-semibold p-4 rounded-lg max-w-xl mx-auto mb-6 glass-effect fade-in">
                <div class="flex items-center justify-center">
                    <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    Updated Successfully
                </div>
            </div>
        <% } %>

        <% if ("error".equals(request.getAttribute("status"))) { %>
            <div class="bg-red-100 text-red-800 text-center font-semibold p-4 rounded-lg max-w-xl mx-auto mb-6 glass-effect fade-in">
                <div class="flex items-center justify-center">
                    <svg class="w-6 h-6 mr-2" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                    </svg>
                    <%=request.getAttribute("errorMessage")%>
                </div>
            </div>
        <% } %>
    </div>
</div>
<% } %>

<script>
	function validateBookingId() {
		const bookingIdInput = document.getElementById("bookingId");
		const bookingId = bookingIdInput.value;
		const pattern = /^\d+$/;

		if (!pattern.test(bookingId)) {
			alert("Booking ID must be a number.");
			return false;
		}
		return true;
	}

	document.addEventListener("DOMContentLoaded", function() {
		const pickupTimeInput = document.getElementById("parcelPickupTime");
		const dropoffTimeInput = document.getElementById("parcelDropoffTime");

		if (pickupTimeInput && dropoffTimeInput) {
			const now = new Date();
            // Set minimum date to tomorrow for new pickups
            const tomorrow = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1);
            const tomorrowYear = tomorrow.getFullYear();
            const tomorrowMonth = String(tomorrow.getMonth() + 1).padStart(2, '0');
            const tomorrowDay = String(tomorrow.getDate()).padStart(2, '0');
            const minTime = "00:00"; // Start of the day

            const minDateTomorrow = `${tomorrowYear}-${tomorrowMonth}-${tomorrowDay}T${minTime}`;
			pickupTimeInput.min = minDateTomorrow;
			dropoffTimeInput.min = minDateTomorrow;

            // Set current values if they exist (for pre-filled forms)
            const existingPickupTime = "<%= request.getAttribute("parcelPickupTime") != null ? request.getAttribute("parcelPickupTime") : "" %>";
            const existingDropoffTime = "<%= request.getAttribute("parcelDropoffTime") != null ? request.getAttribute("parcelDropoffTime") : "" %>";

            if (existingPickupTime) {
                pickupTimeInput.value = existingPickupTime;
            }
            if (existingDropoffTime) {
                dropoffTimeInput.value = existingDropoffTime;
            }
		}
	});


	function validateDeliveryTimes() {
		const pickupTimeInput = document.getElementById("parcelPickupTime");
		const dropoffTimeInput = document.getElementById("parcelDropoffTime");
        const pickupTimeError = document.getElementById("pickupTimeError");
        const dropoffTimeError = document.getElementById("dropoffTimeError");

		const pickupTime = new Date(pickupTimeInput.value);
		const dropoffTime = new Date(dropoffTimeInput.value);

		// Clear previous validation styles
		pickupTimeInput.classList.remove("is-invalid");
		dropoffTimeInput.classList.remove("is-invalid");
        pickupTimeError.style.display = "none";
        dropoffTimeError.style.display = "none";


		if (!pickupTimeInput.value) {
            pickupTimeInput.classList.add("is-invalid");
            pickupTimeError.textContent = "Pickup time is required.";
            pickupTimeError.style.display = "block";
            return false;
        }

        if (!dropoffTimeInput.value) {
            dropoffTimeInput.classList.add("is-invalid");
            dropoffTimeError.textContent = "Dropoff time is required.";
            dropoffTimeError.style.display = "block";
            return false;
        }

        if (dropoffTime <= pickupTime) {
            pickupTimeInput.classList.add("is-invalid");
            dropoffTimeInput.classList.add("is-invalid");
            dropoffTimeError.textContent = "Dropoff time must be after Pickup time.";
            dropoffTimeError.style.display = "block";
            return false;
        }

        // Check if times are in the past
        const now = new Date();
        if (pickupTime < now) {
            pickupTimeInput.classList.add("is-invalid");
            pickupTimeError.textContent = "Pickup time cannot be in the past.";
            pickupTimeError.style.display = "block";
            return false;
        }
        if (dropoffTime < now) {
            dropoffTimeInput.classList.add("is-invalid");
            dropoffTimeError.textContent = "Dropoff time cannot be in the past.";
            dropoffTimeError.style.display = "block";
            return false;
        }

		return true;
	}

	function confirmUpdate(event) {
		if (!validateDeliveryTimes()) {
			event.preventDefault(); // Prevent form submission if validation fails
			return;
		}
		if (!confirm("Are you sure you want to update pickup and dropoff times?")) {
			event.preventDefault(); // Prevent form submission if user cancels
		}
	}
</script>
</body>
</html>