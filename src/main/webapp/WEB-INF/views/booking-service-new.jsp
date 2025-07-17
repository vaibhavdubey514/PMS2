<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
	response.sendRedirect(request.getContextPath() + "/login");
}
%>

<%String role=(String)session.getAttribute("role"); %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<title>Booking Service</title>
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

    .block-gradient-1 {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    .block-gradient-2 {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    }

    .block-gradient-3 {
        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    }

    .block-gradient-4 {
        background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
    }

    /* Modal Styles */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
    }

    .modal-overlay.show {
        opacity: 1;
        visibility: visible;
    }

    .modal-content {
        background: white;
        border-radius: 20px;
        max-width: 600px;
        width: 90%;
        max-height: 80vh;
        overflow-y: auto;
        transform: scale(0.8);
        transition: transform 0.3s ease;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
    }

    .modal-overlay.show .modal-content {
        transform: scale(1);
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

    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="modal-overlay">
        <div class="modal-content">
            <div class="p-8">
                <div class="text-center mb-6">
                    <div class="w-20 h-20 bg-gradient-to-r from-green-400 to-blue-500 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-bold text-gray-800 mb-2">Confirm Your Booking</h3>
                    <p class="text-gray-600">Please review your booking details before confirming</p>
                </div>

                <div class="space-y-6 mb-8">
                    <!-- Sender Information -->
                    <div class="bg-gradient-to-r from-purple-50 to-blue-50 rounded-xl p-4">
                        <h4 class="font-semibold text-gray-800 mb-3 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                            Sender Information
                        </h4>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                            <div><span class="font-medium text-gray-600">Name:</span> <span id="confirmSenderName" class="text-gray-800"></span></div>
                            <div><span class="font-medium text-gray-600">Mobile:</span> <span id="confirmSenderMobile" class="text-gray-800"></span></div>
                            <div class="md:col-span-2"><span class="font-medium text-gray-600">Address:</span> <span id="confirmSenderAddress" class="text-gray-800"></span></div>
                        </div>
                    </div>

                    <!-- Receiver Information -->
                    <div class="bg-gradient-to-r from-pink-50 to-red-50 rounded-xl p-4">
                        <h4 class="font-semibold text-gray-800 mb-3 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            </svg>
                            Receiver Information
                        </h4>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                            <div><span class="font-medium text-gray-600">Name:</span> <span id="confirmReceiverName" class="text-gray-800"></span></div>
                            <div><span class="font-medium text-gray-600">Mobile:</span> <span id="confirmReceiverMobile" class="text-gray-800"></span></div>
                            <div><span class="font-medium text-gray-600">PIN Code:</span> <span id="confirmReceiverPin" class="text-gray-800"></span></div>
                            <div class="md:col-span-2"><span class="font-medium text-gray-600">Address:</span> <span id="confirmReceiverAddress" class="text-gray-800"></span></div>
                        </div>
                    </div>

                    <!-- Parcel Information -->
                    <div class="bg-gradient-to-r from-cyan-50 to-blue-50 rounded-xl p-4">
                        <h4 class="font-semibold text-gray-800 mb-3 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-cyan-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                            </svg>
                            Parcel Details
                        </h4>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                            <div><span class="font-medium text-gray-600">Weight:</span> <span id="confirmWeight" class="text-gray-800"></span> grams</div>
                            <div><span class="font-medium text-gray-600">Delivery Type:</span> <span id="confirmDeliveryType" class="text-gray-800"></span></div>
                            <div><span class="font-medium text-gray-600">Packing:</span> <span id="confirmPackingType" class="text-gray-800"></span></div>
                            <div class="md:col-span-2"><span class="font-medium text-gray-600">Contents:</span> <span id="confirmContents" class="text-gray-800"></span></div>
                        </div>
                    </div>

                    <!-- Scheduling & Cost -->
                    <div class="bg-gradient-to-r from-green-50 to-emerald-50 rounded-xl p-4">
                        <h4 class="font-semibold text-gray-800 mb-3 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            Scheduling & Cost
                        </h4>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                            <div><span class="font-medium text-gray-600">Pickup Time:</span> <span id="confirmPickupTime" class="text-gray-800"></span></div>
                            <div><span class="font-medium text-gray-600">Dropoff Time:</span> <span id="confirmDropoffTime" class="text-gray-800"></span></div>
                            <div class="md:col-span-2">
                                <span class="font-medium text-gray-600">Total Cost:</span> 
                                <span id="confirmCost" class="text-2xl font-bold text-green-600">₹0.00</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flex flex-col sm:flex-row gap-3">
                    <button type="button" id="cancelBooking" class="flex-1 bg-gray-500 hover:bg-gray-600 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200">
                        Cancel
                    </button>
                    <button type="button" id="confirmBooking" class="flex-1 bg-gradient-to-r from-green-600 to-blue-600 hover:from-green-700 hover:to-blue-700 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-200">
                        Confirm Booking
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="relative z-10 min-h-screen py-8 px-4">
        <div class="max-w-7xl mx-auto fade-in">
            <div class="text-center mb-12">
                <h1 class="text-5xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                    Booking Service
                </h1>
                <p class="text-gray-600 text-xl">Create a new parcel delivery booking</p>
            </div>

            <% if ("success".equals(request.getAttribute("status"))) { %>
                <div class="bg-gradient-to-r from-green-50 to-emerald-50 border border-green-200 rounded-xl mb-8 shadow-lg max-w-2xl mx-auto">
                    <div class="px-6 py-4">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center mr-4">
                                <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                                </svg>
                            </div>
                            <div class="flex-1">
                                <p class="font-semibold text-green-800 text-lg">Booking Successful! 🎉</p>
                                <p class="text-green-700 text-sm mb-2">Your Booking ID: <span class="font-mono font-bold"><%=request.getAttribute("bookingId")%></span></p>
                                <a href="<%=request.getContextPath()%>/invoice?bid=<%=request.getAttribute("bookingId")%>"
                                   class="inline-flex items-center bg-blue-600 hover:bg-blue-700 text-white font-medium py-1.5 px-3 rounded-md text-xs transition-all duration-200">
                                    <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                    </svg>
                                    View Invoice
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else if ("error".equals(request.getAttribute("status"))) { %>
                <div class="bg-gradient-to-r from-red-50 to-pink-50 border border-red-200 rounded-xl mb-8 shadow-lg max-w-2xl mx-auto">
                    <div class="px-6 py-4">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-red-500 rounded-full flex items-center justify-center mr-4">
                                <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                </svg>
                            </div>
                            <div class="flex-1">
                                <p class="font-semibold text-red-800 text-lg">Booking Error ❌</p>
                                <p class="text-red-700 text-sm"><%=request.getAttribute("errorMessage")%></p>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>

            <form id="booking-form" action="<%=request.getContextPath()%>/booking-service" method="post">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">

                    <div class="block-gradient-1 rounded-3xl p-1 shadow-2xl transition-all duration-300">
                        <div class="bg-white rounded-3xl p-8 h-full">
                            <div class="flex items-center mb-8">
                                <div class="w-16 h-16 block-gradient-1 rounded-2xl flex items-center justify-center mr-4 shadow-lg">
                                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-2xl font-bold text-gray-800">01</h3>
                                    <h4 class="text-xl font-semibold text-gray-600">Sender Information</h4>
                                </div>
                            </div>

                            <% if ("Customer".equals(role)) { %>
                                <div class="space-y-6">
                                    <div>
                                        <label for="senderNameCustomer" class="block text-sm font-bold text-gray-700 mb-2">Sender Name</label>
                                        <input type="text" name="senderName" id="senderNameCustomer" value="<%=request.getAttribute("senderName")%>" readonly
                                               class="w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl text-gray-600 font-medium cursor-not-allowed" />
                                    </div>
                                    <div>
                                        <label for="senderAddressCustomer" class="block text-sm font-bold text-gray-700 mb-2">Sender Address</label>
                                        <input type="text" name="senderAddress" id="senderAddressCustomer" value="<%=request.getAttribute("senderAddress")%>" readonly
                                               class="w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl text-gray-600 font-medium cursor-not-allowed" />
                                    </div>
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <div>
                                            <label for="senderCountryCodeCustomer" class="block text-sm font-bold text-gray-700 mb-2">Country Code</label>
                                            <select name="senderCountryCode" id="senderCountryCodeCustomer" disabled
                                                    class="w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl text-gray-600 font-medium cursor-not-allowed">
                                                <option selected value="<%=request.getAttribute("senderCountryCode")%>"><%=request.getAttribute("senderCountryCode")%></option>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="senderMobileNumberCustomer" class="block text-sm font-bold text-gray-700 mb-2">Mobile Number</label>
                                            <input type="number" minlength="10" maxlength="10" name="senderMobileNumber" id="senderMobileNumberCustomer" value="<%=request.getAttribute("senderMobileNumber")%>" readonly
                                                   class="w-full px-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl text-gray-600 font-medium cursor-not-allowed" />
                                        </div>
                                    </div>
                                </div>
                            <% } else { %>
                                <div class="space-y-6">
                                    <div>
                                        <label for="senderNameOfficer" class="block text-sm font-bold text-gray-700 mb-2">Sender Name</label>
                                        <input type="text" maxlength="50" name="senderName" id="senderNameOfficer" placeholder="Enter Sender Name" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-purple-500 focus:border-purple-500 transition-all duration-200" />
                                    </div>
                                    <div>
                                        <label for="senderAddressOfficer" class="block text-sm font-bold text-gray-700 mb-2">Sender Address</label>
                                        <input type="text" maxlength="150" name="senderAddress" id="senderAddressOfficer" placeholder="Enter Sender Address" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-purple-500 focus:border-purple-500 transition-all duration-200" />
                                    </div>
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <div>
                                            <label for="senderCountryCodeOfficer" class="block text-sm font-bold text-gray-700 mb-2">Country Code</label>
                                            <select name="senderCountryCode" id="senderCountryCodeOfficer" required
                                                    class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-purple-500 focus:border-purple-500 transition-all duration-200">
                                                <option value="+91">+91 (India)</option>
                                                <option value="+1">+1 (USA)</option>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="senderMobileNumberOfficer" class="block text-sm font-bold text-gray-700 mb-2">Mobile Number</label>
                                            <input type="number" minlength="10" maxlength="10" name="senderMobileNumber" id="senderMobileNumberOfficer" placeholder="Enter Mobile Number" oninput="this.value=this.value.slice(0,10)" required
                                                   class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-purple-500 focus:border-purple-500 transition-all duration-200" />
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>

                    <div class="block-gradient-2 rounded-3xl p-1 shadow-2xl transition-all duration-300">
                        <div class="bg-white rounded-3xl p-8 h-full">
                            <div class="flex items-center mb-8">
                                <div class="w-16 h-16 block-gradient-2 rounded-2xl flex items-center justify-center mr-4 shadow-lg">
                                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-2xl font-bold text-gray-800">02</h3>
                                    <h4 class="text-xl font-semibold text-gray-600">Receiver Information</h4>
                                </div>
                            </div>

                            <div class="space-y-6">
                                <div>
                                    <label for="receiverName" class="block text-sm font-bold text-gray-700 mb-2">Receiver Name</label>
                                    <input type="text" maxlength="50" name="receiverName" id="receiverName" placeholder="Enter Receiver Name" required
                                           class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200" />
                                </div>
                                <div>
                                    <label for="receiverAddress" class="block text-sm font-bold text-gray-700 mb-2">Receiver Address</label>
                                    <input type="text" maxlength="150" name="receiverAddress" id="receiverAddress" placeholder="Enter Receiver Address" required
                                           class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200" />
                                </div>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    <div>
                                        <label for="receiverPin" class="block text-sm font-bold text-gray-700 mb-2">PIN Code</label>
                                        <input type="text" name="receiverPin" id="receiverPin" placeholder="6-digit PIN" pattern="\d{6}" oninput="this.value=this.value.slice(0,6)" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200" />
                                    </div>
                                    <div>
                                        <label for="receiverCountryCode" class="block text-sm font-bold text-gray-700 mb-2">Country Code</label>
                                        <select name="receiverCountryCode" id="receiverCountryCode" required
                                                class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200">
                                            <option value="+91">+91 (India)</option>
                                            <option value="+1">+1 (USA)</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label for="receiverMobileNumber" class="block text-sm font-bold text-gray-700 mb-2">Mobile Number</label>
                                        <input type="tel" pattern="[0-9]{10}" minlength="10" maxlength="10" name="receiverMobileNumber" id="receiverMobileNumber" placeholder="10-digit mobile" oninput="this.value=this.value.slice(0,10)" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="block-gradient-3 rounded-3xl p-1 shadow-2xl transition-all duration-300">
                        <div class="bg-white rounded-3xl p-8 h-full">
                            <div class="flex items-center mb-8">
                                <div class="w-16 h-16 block-gradient-3 rounded-2xl flex items-center justify-center mr-4 shadow-lg">
                                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-2xl font-bold text-gray-800">03</h3>
                                    <h4 class="text-xl font-semibold text-gray-600">Parcel Details</h4>
                                </div>
                            </div>

                            <div class="space-y-6">
                                <div>
                                    <label for="parcelContentsDescription" class="block text-sm font-bold text-gray-700 mb-2">Contents Description</label>
                                    <textarea maxlength="150" name="parcelContentsDescription" id="parcelContentsDescription" placeholder="Describe parcel contents..." required
                                              class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200 resize-none h-24"></textarea>
                                </div>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    <div>
                                        <label for="parcelWeight" class="block text-sm font-bold text-gray-700 mb-2">Weight (grams)</label>
                                        <input type="number" name="parcelWeight" id="parcelWeight" placeholder="Weight in grams" oninput="this.value=this.value.slice(0,4)" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200" />
                                    </div>
                                    <div>
                                        <label for="parcelDeliveryType" class="block text-sm font-bold text-gray-700 mb-2">Delivery Type</label>
                                        <select name="parcelDeliveryType" id="parcelDeliveryType" required
                                                class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200">
                                            <option value="" disabled selected>Select Type</option>
                                            <option value="Standard">📦 Standard</option>
                                            <option value="Express">⚡ Express</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label for="parcelPackingPreference" class="block text-sm font-bold text-gray-700 mb-2">Packing Type</label>
                                        <select name="parcelPackingPreference" id="parcelPackingPreference" required
                                                class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200">
                                            <option value="" disabled selected>Select Packing</option>
                                            <option value="Standard">📋 Standard</option>
                                            <option value="Fragile">🔻 Fragile</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="block-gradient-4 rounded-3xl p-1 shadow-2xl transition-all duration-300">
                        <div class="bg-white rounded-3xl p-8 h-full">
                            <div class="flex items-center mb-8">
                                <div class="w-16 h-16 block-gradient-4 rounded-2xl flex items-center justify-center mr-4 shadow-lg">
                                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-2xl font-bold text-gray-800">04</h3>
                                    <h4 class="text-xl font-semibold text-gray-600">Scheduling & Cost</h4>
                                </div>
                            </div>

                            <div class="space-y-6">
                                <div>
                                    <label for="parcelPickupTime" class="block text-sm font-bold text-gray-700 mb-2">Pickup Time</label>
                                    <input type="datetime-local" name="parcelPickupTime" id="parcelPickupTime" required
                                           class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-green-500 focus:border-green-500 transition-all duration-200" />
                                </div>
                                <div>
                                    <label for="parcelDropoffTime" class="block text-sm font-bold text-gray-700 mb-2">Dropoff Time</label>
                                    <input type="datetime-local" name="parcelDropoffTime" id="parcelDropoffTime" required
                                           class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-green-500 focus:border-green-500 transition-all duration-200" />
                                </div>
                                <div>
                                    <label for="parcelServiceCost" class="block text-sm font-bold text-gray-700 mb-2">Service Cost</label>
                                    <div class="relative">
                                        <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-500 font-bold text-lg">₹</span>
                                        <input type="text" name="parcelServiceCost" id="parcelServiceCost" value="0" readonly
                                               class="w-full pl-10 pr-4 py-3 bg-gray-50 border-2 border-gray-200 rounded-xl text-gray-700 cursor-not-allowed font-bold text-lg" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-8">
                    <button type="submit" class="bg-gradient-to-r from-purple-600 to-blue-600 hover:from-purple-700 hover:to-blue-700 text-white font-semibold py-3 px-8 rounded-xl text-base transition-all duration-200 transform hover:scale-105 shadow-lg">
                        <svg class="w-5 h-5 mr-2 inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                        </svg>
                        Complete Booking
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Global variables
        let bookingForm;
        let confirmationModal;

        // Utility function to format date-time
        function formatDateTime(dateTimeValue) {
            if (!dateTimeValue) return '';
            const date = new Date(dateTimeValue);
            return date.toLocaleString('en-IN', {
                day: '2-digit',
                month: 'short',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                hour12: true
            });
        }

        // Function to get form values
        function getFormValues() {
            const role = "<%= role %>";
            
            return {
                senderName: role === "Customer" 
                    ? document.getElementById("senderNameCustomer").value 
                    : document.getElementById("senderNameOfficer").value,
                senderAddress: role === "Customer" 
                    ? document.getElementById("senderAddressCustomer").value 
                    : document.getElementById("senderAddressOfficer").value,
                senderMobile: (role === "Customer" 
                    ? document.getElementById("senderCountryCodeCustomer").value 
                    : document.getElementById("senderCountryCodeOfficer").value) + " " +
                    (role === "Customer" 
                        ? document.getElementById("senderMobileNumberCustomer").value 
                        : document.getElementById("senderMobileNumberOfficer").value),
                receiverName: document.getElementById("receiverName").value,
                receiverAddress: document.getElementById("receiverAddress").value,
                receiverPin: document.getElementById("receiverPin").value,
                receiverMobile: document.getElementById("receiverCountryCode").value + " " + document.getElementById("receiverMobileNumber").value,
                parcelContents: document.getElementById("parcelContentsDescription").value,
                parcelWeight: document.getElementById("parcelWeight").value,
                deliveryType: document.getElementById("parcelDeliveryType").value,
                packingType: document.getElementById("parcelPackingPreference").value,
                pickupTime: document.getElementById("parcelPickupTime").value,
                dropoffTime: document.getElementById("parcelDropoffTime").value,
                serviceCost: document.getElementById("parcelServiceCost").value
            };
        }

        // Function to populate confirmation modal
        function populateConfirmationModal() {
            const formData = getFormValues();
            
            // Populate sender information
            document.getElementById("confirmSenderName").textContent = formData.senderName;
            document.getElementById("confirmSenderMobile").textContent = formData.senderMobile;
            document.getElementById("confirmSenderAddress").textContent = formData.senderAddress;
            
            // Populate receiver information
            document.getElementById("confirmReceiverName").textContent = formData.receiverName;
            document.getElementById("confirmReceiverMobile").textContent = formData.receiverMobile;
            document.getElementById("confirmReceiverPin").textContent = formData.receiverPin;
            document.getElementById("confirmReceiverAddress").textContent = formData.receiverAddress;
            
            // Populate parcel information
            document.getElementById("confirmWeight").textContent = formData.parcelWeight;
            document.getElementById("confirmDeliveryType").textContent = formData.deliveryType;
            document.getElementById("confirmPackingType").textContent = formData.packingType;
            document.getElementById("confirmContents").textContent = formData.parcelContents;
            
            // Populate scheduling and cost
            document.getElementById("confirmPickupTime").textContent = formatDateTime(formData.pickupTime);
            document.getElementById("confirmDropoffTime").textContent = formatDateTime(formData.dropoffTime);
            document.getElementById("confirmCost").textContent = "₹" + formData.serviceCost;
        }

        // Function to show confirmation modal
        function showConfirmationModal() {
            populateConfirmationModal();
            confirmationModal.classList.add('show');
            document.body.style.overflow = 'hidden';
        }

        // Function to hide confirmation modal
        function hideConfirmationModal() {
            confirmationModal.classList.remove('show');
            document.body.style.overflow = 'auto';
        }

        // DOM Content Loaded
        document.addEventListener("DOMContentLoaded", function() {
            const pickup = document.getElementById("parcelPickupTime");
            const dropoff = document.getElementById("parcelDropoffTime");
            bookingForm = document.getElementById("booking-form");
            confirmationModal = document.getElementById("confirmationModal");

            // Function to set the minimum date and time
            function updateDateConstraints() {
                const now = new Date();
                const isoNow = now.toISOString().slice(0, 16);
                pickup.min = isoNow;
                dropoff.min = isoNow;

                pickup.addEventListener("change", function() {
                    if (pickup.value) {
                        dropoff.min = pickup.value;
                        if (dropoff.value && dropoff.value < pickup.value) {
                            dropoff.value = "";
                        }
                    } else {
                        dropoff.min = isoNow;
                    }
                });
            }

            // Call the function to set constraints on load
            updateDateConstraints();

            // Cost Calculation
            function calculateServiceCost() {
                let cost = 0;
                const weightInput = document.getElementById("parcelWeight");
                const weight = parseFloat(weightInput.value) || 0;
                const type = document.getElementById("parcelDeliveryType").value;
                const pack = document.getElementById("parcelPackingPreference").value;

                if (type === "Standard") cost += 50;
                else if (type === "Express") cost += 100;

                if (pack === "Standard") cost += 20;
                else if (pack === "Fragile") cost += 40;

                cost += weight * 0.1; // 0.1 per gram

                document.getElementById("parcelServiceCost").value = (Math.round(cost * 100) / 100).toFixed(2);
            }

            // Initial cost calculation
            calculateServiceCost();

            // Event listeners for calculating cost
            bookingForm.addEventListener("input", calculateServiceCost);

            // Form submission handler - show confirmation modal
            bookingForm.addEventListener("submit", function(event) {
                event.preventDefault();
                
                // Ensure the cost is calculated
                calculateServiceCost();
                
                // Show confirmation modal instead of submitting directly
                showConfirmationModal();
            });

            // Modal event listeners
            document.getElementById("cancelBooking").addEventListener("click", function() {
                hideConfirmationModal();
            });

            document.getElementById("confirmBooking").addEventListener("click", function() {
                hideConfirmationModal();
                // Submit the form
                bookingForm.submit();
            });

            // Close modal when clicking outside
            confirmationModal.addEventListener("click", function(event) {
                if (event.target === confirmationModal) {
                    hideConfirmationModal();
                }
            });

            // Close modal with Escape key
            document.addEventListener("keydown", function(event) {
                if (event.key === "Escape" && confirmationModal.classList.contains('show')) {
                    hideConfirmationModal();
                }
            });

            // Make calculateServiceCost available globally
            window.calculateServiceCost = calculateServiceCost;
        });
    </script>
</body>
</html>
