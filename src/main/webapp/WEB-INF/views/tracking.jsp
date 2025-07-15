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
<title>Track</title>
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
</style>
</head>
<body class="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 background-pattern">
    <!-- Enhanced Background with Floating Elements -->
    <div class="fixed inset-0 pointer-events-none z-0">
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute top-40 right-20 w-40 h-40 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-20 left-1/3 w-36 h-36 bg-indigo-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-40 right-1/3 w-28 h-28 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
    </div>

    <jsp:include page="navbar.jsp" />

    <div class="relative z-10 min-h-screen py-8 px-4">
        <div class="max-w-6xl mx-auto fade-in">
            <!-- Page Title -->
            <div class="text-center mb-8">
                <h1 class="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                    Track Parcel
                </h1>
                <p class="text-gray-600 text-lg">Monitor your parcel's journey in real-time</p>
            </div>

            <!-- Search Form -->
            <div class="glass-effect rounded-2xl shadow-lg p-6 mb-8 max-w-2xl mx-auto">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-gradient-to-r from-orange-500 to-red-500 rounded-xl flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-800">Track Your Package</h3>
                        <p class="text-gray-600 text-sm">Enter your booking ID to get real-time tracking information</p>
                    </div>
                </div>
                
                <form action="<%=request.getContextPath()%>/tracking" method="post" onsubmit="return validateForm()" class="flex flex-col sm:flex-row gap-4">
                    <div class="flex-1">
                        <input type="number" name="bookingId" id="bookingId" placeholder="Enter Booking ID"
                            oninput="this.value=this.value.slice(0,9)" required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all duration-200 text-sm" />
                    </div>
                    <button type="submit" class="bg-gradient-to-r from-orange-600 to-red-600 hover:from-orange-700 hover:to-red-700 text-white font-medium py-3 px-6 rounded-lg text-sm transition-all duration-200 transform hover:scale-105 shadow-md">
                        <svg class="w-4 h-4 mr-2 inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                        Search
                    </button>
                </form>
            </div>

            <!-- Error Message -->
            <%
            if ("error".equals(request.getAttribute("status"))) {
            %>
            <div class="bg-gradient-to-r from-red-50 to-pink-50 border border-red-200 rounded-xl mb-8 shadow-lg max-w-2xl mx-auto">
                <div class="px-6 py-4">
                    <div class="flex items-center">
                        <div class="w-10 h-10 bg-red-500 rounded-full flex items-center justify-center mr-4">
                            <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <div>
                            <p class="font-semibold text-red-800 text-lg">Tracking Error</p>
                            <p class="text-red-700 text-sm"><%=request.getAttribute("errorMessage")%></p>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>

            <!-- Tracking Results -->
            <%
            if ("success".equals(request.getAttribute("status"))) {
            %>
            <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden">
                <!-- Success Header -->
                <div class="bg-gradient-to-r from-green-50 to-emerald-50 p-4 border-b border-green-200">
                    <div class="flex items-center">
                        <div class="w-8 h-8 bg-green-500 rounded-lg flex items-center justify-center mr-3">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <div>
                            <p class="font-semibold text-green-800">Package Found!</p>
                            <p class="text-green-700 text-sm">Here are the tracking details for your parcel</p>
                        </div>
                    </div>
                </div>

                <!-- Tracking Information -->
                <div class="p-6">
                    <!-- Mobile-friendly cards for smaller screens -->
                    <div class="block md:hidden space-y-4">
                        <div class="bg-white rounded-xl p-4 border border-gray-200 shadow-sm">
                            <h4 class="font-semibold text-gray-800 mb-3">Tracking Information</h4>
                            <div class="space-y-3">
                                <div class="flex justify-between">
                                    <span class="text-gray-600 text-sm font-medium">Booking ID:</span>
                                    <span class="text-gray-800 text-sm font-semibold"><%=request.getAttribute("bookingId")%></span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-gray-600 text-sm font-medium">Sender:</span>
                                    <span class="text-gray-800 text-sm"><%=request.getAttribute("name")%></span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-gray-600 text-sm font-medium">From:</span>
                                    <span class="text-gray-800 text-sm"><%=request.getAttribute("address")%></span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-gray-600 text-sm font-medium">Receiver:</span>
                                    <span class="text-gray-800 text-sm"><%=request.getAttribute("receiverName")%></span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-gray-600 text-sm font-medium">To:</span>
                                    <span class="text-gray-800 text-sm"><%=request.getAttribute("receiverAddress")%></span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-gray-600 text-sm font-medium">Booking Date:</span>
                                    <span class="text-gray-800 text-sm"><%=request.getAttribute("dateOfBooking")%></span>
                                </div>
                                <div class="flex justify-between items-center pt-2 border-t border-gray-200">
                                    <span class="text-gray-600 text-sm font-medium">Status:</span>
                                    <span class="bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-xs font-semibold"><%=request.getAttribute("parcelStatus")%></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Desktop table for larger screens -->
                    <div class="hidden md:block overflow-x-auto">
                        <table class="w-full">
                            <thead>
                                <tr class="bg-gray-50 border-b border-gray-200">
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Booking ID</th>
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Sender Name</th>
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Sender Address</th>
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Receiver Name</th>
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Receiver Address</th>
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Date of Booking</th>
                                    <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Parcel Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-white hover:bg-gray-50 transition-colors duration-200">
                                    <td class="px-4 py-4 text-sm font-semibold text-gray-900"><%=request.getAttribute("bookingId")%></td>
                                    <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("name")%></td>
                                    <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("address")%></td>
                                    <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("receiverName")%></td>
                                    <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("receiverAddress")%></td>
                                    <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("dateOfBooking")%></td>
                                    <td class="px-4 py-4 text-sm">
                                        <span class="bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-xs font-semibold">
                                            <%=request.getAttribute("parcelStatus")%>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>

    <script>
        function validateForm() {
            const bookingId = document.getElementById("bookingId");
            const pattern = /^\d+$/;
            if (!pattern.test(bookingId.value)) {
                alert("Booking ID must be a valid number.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>