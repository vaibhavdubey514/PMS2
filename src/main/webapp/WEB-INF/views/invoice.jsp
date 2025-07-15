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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Invoice</title>
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
    
    @media print {
        .d-print-none {
            display: none !important;
        }
        body {
            padding-top: 0;
            background: white;
        }
        .glass-effect {
            background: white;
            backdrop-filter: none;
        }
    }
</style>
</head>
<body class="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 background-pattern">
    <!-- Enhanced Background with Floating Elements -->
    <div class="fixed inset-0 pointer-events-none z-0 d-print-none">
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute top-40 right-20 w-40 h-40 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-20 left-1/3 w-36 h-36 bg-indigo-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-40 right-1/3 w-28 h-28 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
    </div>

    <jsp:include page="navbar.jsp" />

    <div class="relative z-10 min-h-screen py-8 px-4">
        <div class="max-w-4xl mx-auto fade-in">
            <!-- Page Title -->
            <div class="text-center mb-8 d-print-none">
                <h1 class="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                    Invoice Generator
                </h1>
                <p class="text-gray-600 text-lg">Generate and view your booking invoice</p>
            </div>

            <!-- Hidden booking ID field -->
            <input type="hidden" id="bId" value="<%=request.getAttribute("bId") != null ? request.getAttribute("bId") : ""%>" />

            <!-- Search Form -->
            <div class="glass-effect rounded-2xl shadow-lg p-6 mb-8 d-print-none">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gradient-to-r from-blue-500 to-purple-500 rounded-xl flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-800">Find Invoice</h3>
                        <p class="text-gray-600 text-sm">Enter your booking ID to generate invoice</p>
                    </div>
                </div>
                
                <form id="invoice-form" action="<%=request.getContextPath()%>/invoice" method="post" onsubmit="return validateForm()" class="flex flex-col sm:flex-row gap-4">
                    <div class="flex-1">
                        <input type="number" name="bookingId" id="bookingId"
                            oninput="this.value=this.value.slice(0,9)"
                            placeholder="Enter Booking ID" required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 text-sm" />
                        <small class="text-red-500 text-xs mt-1" id="error-msg" style="display: none;">Booking ID must be a number (max 9 digits)</small>
                    </div>
                    <button type="submit" class="bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-700 hover:to-purple-700 text-white font-medium py-3 px-6 rounded-lg text-sm transition-all duration-200 transform hover:scale-105 shadow-md">
                        <svg class="w-4 h-4 mr-2 inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                        </svg>
                        Generate
                    </button>
                </form>
            </div>

            <!-- Error Message -->
            <% if ("error".equals(request.getAttribute("status"))) { %>
                <div class="bg-gradient-to-r from-red-50 to-pink-50 border border-red-200 rounded-xl mb-8 shadow-lg max-w-2xl mx-auto d-print-none">
                    <div class="px-6 py-4">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-red-500 rounded-full flex items-center justify-center mr-4">
                                <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                </svg>
                            </div>
                            <div>
                                <p class="font-semibold text-red-800 text-lg">Error</p>
                                <p class="text-red-700 text-sm"><%=request.getAttribute("errorMessage")%></p>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>

            <!-- Invoice Display -->
            <%
            if ("success".equals(request.getAttribute("status"))) {
                String[] titles = new String[]{"Booking ID", "Receiver Name", "Receiver Address", "Receiver Pin Code",
                    "Receiver Mobile Number", "Parcel Weight", "Parcel Contents Description", "Parcel Delivery Type",
                    "Parcel Packing Preference", "Parcel Pickup Time", "Parcel Dropoff Time", "Parcel Service Cost"};
                String[] attributes = new String[]{"bookingId", "receiverName", "receiverAddress", "receiverPin",
                    "receiverMobileNumber", "parcelWeight", "parcelContentsDescription", "parcelDeliveryType",
                    "parcelPackingPreference", "parcelPickupTime", "parcelDropoffTime", "parcelServiceCost"};
            %>
            <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden">
                <!-- Print Button Header -->
                <div class="bg-gradient-to-r from-green-50 to-emerald-50 p-4 border-b border-green-200 d-print-none">
                    <div class="flex justify-between items-center">
                        <div class="flex items-center">
                            <div class="w-8 h-8 bg-green-500 rounded-lg flex items-center justify-center mr-3">
                                <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                            </div>
                            <p class="font-semibold text-green-800">Invoice Generated Successfully</p>
                        </div>
                        <button onclick="printDetails()" class="bg-green-600 hover:bg-green-700 text-white font-medium py-2 px-4 rounded-lg text-sm transition-all duration-200 flex items-center">
                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"></path>
                            </svg>
                            Print
                        </button>
                    </div>
                </div>

                <!-- Invoice Content -->
                <div class="p-8">
                    <!-- Invoice Header -->
                    <div class="text-center mb-8 pb-6 border-b-2 border-gray-200">
                        <h2 class="text-3xl font-bold text-gray-800 mb-2">My Invoice</h2>
                        <p class="text-gray-600">Parcel Management System</p>
                        <p class="text-sm text-gray-500 mt-2">Professional Delivery Services</p>
                    </div>

                    <!-- Invoice Details -->
                    <div class="space-y-3">
                        <%
                        for (int i = 0; i < titles.length; i++) {
                        %>
                        <div class="flex justify-between items-center py-3 px-4 <%=i % 2 == 0 ? "bg-gray-50" : "bg-white"%> rounded-lg border border-gray-100">
                            <p class="font-semibold text-gray-700 text-sm"><%=titles[i]%></p>
                            <p class="text-gray-800 text-sm font-medium"><%="parcelServiceCost".equals(attributes[i]) ? "Rs " + request.getAttribute(attributes[i]) : request.getAttribute(attributes[i])%></p>
                        </div>
                        <% } %>
                    </div>

                    <!-- Footer -->
                    <div class="mt-8 pt-6 border-t border-gray-200 text-center">
                        <p class="text-xs text-gray-500">This is a computer-generated invoice. No signature required.</p>
                        <p class="text-xs text-gray-500 mt-1">For any queries, please contact our support team.</p>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const bId = document.getElementById("bId").value;
            if (bId && bId.length > 0) {
                document.getElementById("bookingId").value = bId;
                if (validateForm()) {
                    document.getElementById("invoice-form").submit();
                }
            }
        });

        function validateForm() {
            const bookingId = document.getElementById("bookingId");
            const errorMsg = document.getElementById("error-msg");
            const pattern = /^\d{1,9}$/;
            errorMsg.style.display = "none";
            if (!pattern.test(bookingId.value)) {
                errorMsg.style.display = "block";
                return false;
            }
            return true;
        }

        function printDetails() {
            window.print();
        }
    </script>
</body>
</html>