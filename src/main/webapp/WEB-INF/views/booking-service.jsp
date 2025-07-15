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

                    <div class="block-gradient-1 rounded-3xl p-1 shadow-2xl transform hover:scale-105 transition-all duration-300">
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
                                        <small class="text-red-500 text-sm mt-1 hidden" id="senderNameOfficerError">Only alphabets and spaces</small>
                                    </div>
                                    <div>
                                        <label for="senderAddressOfficer" class="block text-sm font-bold text-gray-700 mb-2">Sender Address</label>
                                        <input type="text" maxlength="150" name="senderAddress" id="senderAddressOfficer" placeholder="Enter Sender Address" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-purple-500 focus:border-purple-500 transition-all duration-200" />
                                        <small class="text-red-500 text-sm mt-1 hidden" id="senderAddressOfficerError">Only alphanumeric and spaces</small>
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
                                            <small class="text-red-500 text-sm mt-1 hidden" id="senderMobileNumberOfficerError">Exactly 10 digits</small>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>

                    <div class="block-gradient-2 rounded-3xl p-1 shadow-2xl transform hover:scale-105 transition-all duration-300">
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
                                    <small class="text-red-500 text-sm mt-1 hidden" id="receiverNameError">Only alphabets and spaces</small>
                                </div>
                                <div>
                                    <label for="receiverAddress" class="block text-sm font-bold text-gray-700 mb-2">Receiver Address</label>
                                    <input type="text" maxlength="150" name="receiverAddress" id="receiverAddress" placeholder="Enter Receiver Address" required
                                           class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200" />
                                    <small class="text-red-500 text-sm mt-1 hidden" id="receiverAddressError">Only alphanumeric and spaces</small>
                                </div>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    <div>
                                        <label for="receiverPin" class="block text-sm font-bold text-gray-700 mb-2">PIN Code</label>
                                        <input type="text" name="receiverPin" id="receiverPin" placeholder="6-digit PIN" pattern="\d{6}" oninput="this.value=this.value.slice(0,6)" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-pink-500 focus:border-pink-500 transition-all duration-200" />
                                        <small class="text-red-500 text-sm mt-1 hidden" id="receiverPinError">Exactly 6 digits</small>
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
                                        <small class="text-red-500 text-sm mt-1 hidden" id="receiverMobileNumberError">Exactly 10 digits</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="block-gradient-3 rounded-3xl p-1 shadow-2xl transform hover:scale-105 transition-all duration-300">
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
                                    <small class="text-red-500 text-sm mt-1 hidden" id="parcelContentsDescriptionError">Only alphanumeric and spaces</small>
                                </div>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    <div>
                                        <label for="parcelWeight" class="block text-sm font-bold text-gray-700 mb-2">Weight (grams)</label>
                                        <input type="number" name="parcelWeight" id="parcelWeight" placeholder="Weight in grams" oninput="this.value=this.value.slice(0,4)" required
                                               class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200" />
                                        <small class="text-red-500 text-sm mt-1 hidden" id="parcelWeightError">Must be positive</small>
                                    </div>
                                    <div>
                                        <label for="parcelDeliveryType" class="block text-sm font-bold text-gray-700 mb-2">Delivery Type</label>
                                        <select name="parcelDeliveryType" id="parcelDeliveryType" required
                                                class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200">
                                            <option value="" disabled selected>Select Type</option>
                                            <option value="Standard">📦 Standard</option>
                                            <option value="Express">⚡ Express</option>
                                        </select>
                                        <small class="text-red-500 text-sm mt-1 hidden" id="parcelDeliveryTypeError">Please select a delivery type</small>
                                    </div>
                                    <div>
                                        <label for="parcelPackingPreference" class="block text-sm font-bold text-gray-700 mb-2">Packing Type</label>
                                        <select name="parcelPackingPreference" id="parcelPackingPreference" required
                                                class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-cyan-500 focus:border-cyan-500 transition-all duration-200">
                                            <option value="" disabled selected>Select Packing</option>
                                            <option value="Standard">📋 Standard</option>
                                            <option value="Fragile">🔻 Fragile</option>
                                        </select>
                                        <small class="text-red-500 text-sm mt-1 hidden" id="parcelPackingPreferenceError">Please select a packing type</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="block-gradient-4 rounded-3xl p-1 shadow-2xl transform hover:scale-105 transition-all duration-300">
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
                                    <small class="text-red-500 text-sm mt-1 hidden" id="pickupTimeError">Pickup time is required and cannot be in the past.</small>
                                </div>
                                <div>
                                    <label for="parcelDropoffTime" class="block text-sm font-bold text-gray-700 mb-2">Dropoff Time</label>
                                    <input type="datetime-local" name="parcelDropoffTime" id="parcelDropoffTime" required
                                           class="w-full px-4 py-3 border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-green-500 focus:border-green-500 transition-all duration-200" />
                                    <small class="text-red-500 text-sm mt-1 hidden" id="dropoffTimeError">Dropoff time must be after Pickup time.</small>
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
        // --- Form Validation Functions (Improved) ---
        // LINE 402: START OF validateText FUNCTION
        function validateText(input, errorElement, regex, errorMessage) {
            if (input.value.trim() === '') {
                errorElement.textContent = 'This field is required.';
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            } else if (!regex.test(input.value.trim())) {
                errorElement.textContent = errorMessage;
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            }
            errorElement.classList.add('hidden');
            input.classList.remove('border-red-500');
            return true;
        }

        // LINE 420: START OF validateNumber FUNCTION
        function validateNumber(input, errorElement, minLength, maxLength, errorMessage) {
            if (input.value.trim() === '') {
                errorElement.textContent = 'This field is required.';
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            } else if (!/^\d+$/.test(input.value.trim())) {
                errorElement.textContent = 'Only digits are allowed.';
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            } else if (input.value.trim().length < minLength || input.value.trim().length > maxLength) {
                errorElement.textContent = errorMessage;
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            }
            errorElement.classList.add('hidden');
            input.classList.remove('border-red-500');
            return true;
        }

        // LINE 438: START OF validateWeight FUNCTION
        function validateWeight(input, errorElement, weightMax, errorMessage) {
            const weight = parseFloat(input.value);
            if (input.value.trim() === '') {
                errorElement.textContent = 'Weight is required.';
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            } else if (isNaN(weight) || weight <= 0 || weight > weightMax) {
                errorElement.textContent = errorMessage;
                errorElement.classList.remove('hidden');
                input.classList.add('border-red-500');
                return false;
            }
            errorElement.classList.add('hidden');
            input.classList.remove('border-red-500');
            return true;
        }

        // LINE 452: START OF validateSelect FUNCTION
        function validateSelect(select, errorElement, errorMessage) {
            if (select.value === "" || select.value === "Select Type" || select.value === "Select Packing") { // Handle default disabled options
                errorElement.textContent = errorMessage;
                errorElement.classList.remove('hidden');
                select.classList.add('border-red-500');
                return false;
            }
            errorElement.classList.add('hidden');
            select.classList.remove('border-red-500');
            return true;
        }

        // LINE 464: START OF validateTimes FUNCTION (MODIFIED)
        function validateTimes() {
            const pickup = document.getElementById("parcelPickupTime");
            const dropoff = document.getElementById("parcelDropoffTime");
            const pickupError = document.getElementById("pickupTimeError");
            const dropoffError = document.getElementById("dropoffTimeError");

            let isValid = true;

            // Reset errors
            pickup.classList.remove('border-red-500');
            dropoff.classList.remove('border-red-500');
            pickupError.classList.add('hidden');
            dropoffError.classList.add('hidden');

            if (!pickup.value) {
                pickup.classList.add('border-red-500');
                pickupError.textContent = 'Pickup time is required.';
                pickupError.classList.remove('hidden');
                isValid = false;
            }

            if (!dropoff.value) {
                dropoff.classList.add('border-red-500');
                dropoffError.textContent = 'Dropoff time is required.';
                dropoffError.classList.remove('hidden');
                isValid = false;
            }

            if (isValid) { // Only check date logic if both are filled
                const pickupTime = new Date(pickup.value);
                const dropoffTime = new Date(dropoff.value);
                const now = new Date(); // Current time

                if (pickupTime < now) {
                    pickup.classList.add('border-red-500');
                    pickupError.textContent = 'Pickup time cannot be in the past.';
                    pickupError.classList.remove('hidden');
                    isValid = false;
                }

                // Check dropoff time against current time only if pickup is valid
                if (dropoffTime < now) {
                    dropoff.classList.add('border-red-500');
                    dropoffError.textContent = 'Dropoff time cannot be in the past.';
                    dropoffError.classList.remove('hidden');
                    isValid = false;
                }

                // Check dropoff time against pickup time
                if (dropoffTime <= pickupTime) {
                    dropoff.classList.add('border-red-500');
                    dropoffError.textContent = 'Dropoff time must be after Pickup time.';
                    dropoffError.classList.remove('hidden');
                    isValid = false;
                }
            }
            return isValid;
        }

        // LINE 509: START OF validateAllFormFields FUNCTION
        function validateAllFormFields() {
            let isValid = true;

            const nameRegex = /^[A-Za-z\s]+$/;
            const addressRegex = /^[A-Za-z0-9\s.,#-]+$/; // Allows alphanumeric, spaces, periods, commas, hyphens, hash
            const mobileLength = 10;
            const pinLength = 6;
            const weightMax = 9999; // Assuming max weight is 9999 grams

            // Sender Validation (Only for Officer Role)
            const role = "<%= role %>";
            if (role !== "Customer") {
                const senderName = document.getElementById("senderNameOfficer");
                const senderAddress = document.getElementById("senderAddressOfficer");
                const senderMobile = document.getElementById("senderMobileNumberOfficer");

                // Note: The order of isValid = ... && isValid is important for correct short-circuiting
                isValid = validateText(senderName, document.getElementById("senderNameOfficerError"), nameRegex, 'Only alphabets and spaces allowed.') && isValid;
                isValid = validateText(senderAddress, document.getElementById("senderAddressOfficerError"), addressRegex, 'Only alphanumeric, spaces, and basic punctuation (.,#-) allowed.') && isValid;
                isValid = validateNumber(senderMobile, document.getElementById("senderMobileNumberOfficerError"), mobileLength, mobileLength, 'Exactly 10 digits required.') && isValid;
            }

            // Receiver Validation
            const receiverName = document.getElementById("receiverName");
            const receiverAddress = document.getElementById("receiverAddress");
            const receiverPin = document.getElementById("receiverPin");
            const receiverMobile = document.getElementById("receiverMobileNumber");
            const receiverCountryCode = document.getElementById("receiverCountryCode");

            isValid = validateText(receiverName, document.getElementById("receiverNameError"), nameRegex, 'Only alphabets and spaces allowed.') && isValid;
            isValid = validateText(receiverAddress, document.getElementById("receiverAddressError"), addressRegex, 'Only alphanumeric, spaces, and basic punctuation (.,#-) allowed.') && isValid;
            isValid = validateNumber(receiverPin, document.getElementById("receiverPinError"), pinLength, pinLength, 'Exactly 6 digits required.') && isValid;
            isValid = validateNumber(receiverMobile, document.getElementById("receiverMobileNumberError"), mobileLength, mobileLength, 'Exactly 10 digits required.') && isValid;
            // No specific error element for receiverCountryCode as it's a select with default option, but added for completeness if needed.
            isValid = validateSelect(receiverCountryCode, document.createElement('span'), 'Please select a country code.') && isValid; // Using dummy span for select validation without dedicated error element

            // Parcel Details Validation
            const parcelContents = document.getElementById("parcelContentsDescription");
            const parcelWeight = document.getElementById("parcelWeight");
            const parcelDeliveryType = document.getElementById("parcelDeliveryType");
            const parcelPackingPreference = document.getElementById("parcelPackingPreference");

            isValid = validateText(parcelContents, document.getElementById("parcelContentsDescriptionError"), addressRegex, 'Only alphanumeric, spaces, and basic punctuation (.,#-) allowed.') && isValid;
            isValid = validateWeight(parcelWeight, document.getElementById("parcelWeightError"), weightMax, 'Must be a positive number up to ' + weightMax + ' grams.') && isValid;
            isValid = validateSelect(parcelDeliveryType, document.getElementById("parcelDeliveryTypeError"), 'Please select a delivery type.') && isValid;
            isValid = validateSelect(parcelPackingPreference, document.getElementById("parcelPackingPreferenceError"), 'Please select a packing type.') && isValid;

            // Scheduling Validation
            isValid = validateTimes() && isValid;

            return isValid;
        }

        // --- Original functionality + Alert Payment ---
        // LINE 586: START OF DOMContentLoaded LISTENER
        document.addEventListener("DOMContentLoaded", function() {
            const pickup = document.getElementById("parcelPickupTime");
            const dropoff = document.getElementById("parcelDropoffTime");
            const bookingForm = document.getElementById("booking-form");

            // Function to set the minimum date and time
            function updateDateConstraints() {
                const now = new Date();
                const isoNow = now.toISOString().slice(0, 16); // Get current date and time in ISO format (YYYY-MM-DDTHH:MM)
                pickup.min = isoNow; // Set minimum pickup time to now
                dropoff.min = isoNow; // Set minimum dropoff time to now initially

                // Add event listener for pickup time change to update dropoff min
                pickup.addEventListener("change", function() {
                    if (pickup.value) {
                        dropoff.min = pickup.value; // Set dropoff min to pickup time
                        if (dropoff.value && dropoff.value < pickup.value) {
                            dropoff.value = ""; // Clear dropoff if it's before new pickup time
                        }
                    } else {
                        dropoff.min = isoNow; // Reset dropoff min if pickup is cleared
                    }
                });
            }

            // Call the function to set constraints on load
            updateDateConstraints();

            // LINE 617: ADDED calculateServiceCost() call on page load
            // IMPORTANT ADDITION: Call calculateServiceCost on page load
            calculateServiceCost();

            // Cost Calculation
            function calculateServiceCost() {
                let cost = 0;
                const weightInput = document.getElementById("parcelWeight");
                const weight = parseFloat(weightInput.value) || 0; // Ensure it's a number, default to 0
                const type = document.getElementById("parcelDeliveryType").value;
                const pack = document.getElementById("parcelPackingPreference").value;

                if (type === "Standard") cost += 50;
                else if (type === "Express") cost += 100;

                if (pack === "Standard") cost += 20;
                else if (pack === "Fragile") cost += 40;

                cost += weight * 0.1; // 0.1 per gram, adjust as needed

                document.getElementById("parcelServiceCost").value = (Math.round(cost * 100) / 100).toFixed(2); // Round to 2 decimal places
            }

            // Event listeners for calculating cost (on any input change within the form)
            bookingForm.addEventListener("input", calculateServiceCost);


            // --- Modified Form Submission Handler ---
            // LINE 645: START OF SUBMIT EVENT LISTENER (MODIFIED)
            bookingForm.addEventListener("submit", function(event) {
                event.preventDefault(); // Prevent default submission initially

                // LINE 649: ADDED calculateServiceCost() call before validation/submission
                // Ensure the cost is calculated right before validation/submission
                calculateServiceCost();

                // First, run all detailed form validations
                const formIsValid = validateAllFormFields();

                if (formIsValid) {
                    const serviceCost = document.getElementById("parcelServiceCost").value;
                    const confirmPayment = confirm(`Your total service cost is: ₹${serviceCost}\n\nClick OK to confirm and proceed with booking.`);

                    if (confirmPayment) {
                        // If user clicks OK, proceed with form submission
                        bookingForm.submit();
                    }
                } else {
                    // If form is not valid, the individual error messages will be displayed.
                    alert("Please correct the errors in the form before proceeding.");
                }
            });

            // Make calculateServiceCost available globally if needed by other scripts (unlikely for this simple case)
            window.calculateServiceCost = calculateServiceCost;
        });
    </script>
</body>
</html>