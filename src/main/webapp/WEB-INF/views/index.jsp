<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
response.sendRedirect(request.getContextPath() + "/login");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
    </style>
</head>
<body class="min-h-screen relative bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 background-pattern">
    <!-- Enhanced Background with Floating Elements -->
    <div class="fixed inset-0 pointer-events-none z-0">
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute top-40 right-20 w-40 h-40 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-20 left-1/3 w-36 h-36 bg-indigo-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-40 right-1/3 w-28 h-28 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        
        <!-- Geometric Patterns -->
        <div class="absolute top-1/4 left-10 w-2 h-2 bg-blue-400 rounded-full opacity-40 floating-shape"></div>
        <div class="absolute top-1/3 right-16 w-1 h-1 bg-purple-400 rounded-full opacity-50 floating-shape"></div>
        <div class="absolute bottom-1/4 left-1/4 w-1.5 h-1.5 bg-indigo-400 rounded-full opacity-45 floating-shape"></div>
        <div class="absolute bottom-1/3 right-1/4 w-2 h-2 bg-pink-400 rounded-full opacity-40 floating-shape"></div>
    </div>

    <!-- Navigation -->
    <jsp:include page="navbar.jsp" />

    <!-- Main Content -->
    <div class="relative z-10 min-h-screen flex items-center justify-center py-8 px-4">
        <div class="w-full max-w-5xl fade-in">
            <!-- Welcome Container -->
            <div class="glass-effect rounded-2xl shadow-2xl p-8 md:p-12 text-center border border-white/20 relative overflow-hidden">
                <!-- Top accent line -->
                <div class="absolute top-0 left-0 right-0 h-1 bg-gradient-to-r from-blue-500 to-purple-600"></div>
                
                <!-- Welcome Text -->
                <div class="mb-12">
                    <h2 class="text-4xl md:text-5xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                        Hello <%=request.getAttribute("name")%>!
                    </h2>
                    <h3 class="text-xl md:text-2xl text-gray-600 font-medium">
                        Welcome to <%=request.getAttribute("role") %> Dashboard
                    </h3>
                </div>

                <!-- Dashboard Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-8">
                    <%
                    if ("Customer".equals(session.getAttribute("role"))) {
                    %>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-blue-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-box"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Quick Booking</h4>
                        <p class="text-gray-600 text-sm">Book a new parcel delivery service quickly and easily</p>
                    </div>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-green-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-location-dot"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Track Package</h4>
                        <p class="text-gray-600 text-sm">Monitor your parcel's journey in real-time</p>
                    </div>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-purple-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-history"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Order History</h4>
                        <p class="text-gray-600 text-sm">View all your previous bookings and deliveries</p>
                    </div>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-orange-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-headset"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Support</h4>
                        <p class="text-gray-600 text-sm">Get help with any questions or issues</p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-blue-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-list"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">All Bookings</h4>
                        <p class="text-gray-600 text-sm">Manage and view all customer bookings</p>
                    </div>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-green-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-truck"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Delivery Status</h4>
                        <p class="text-gray-600 text-sm">Update and track delivery statuses</p>
                    </div>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-purple-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Pickup Scheduling</h4>
                        <p class="text-gray-600 text-sm">Schedule and manage pickup appointments</p>
                    </div>
                    <div class="bg-white/80 backdrop-blur-sm rounded-xl p-6 shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-2 cursor-pointer group">
                        <div class="text-red-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300">
                            <i class="fas fa-location-dot"></i>
                        </div>
                        <h4 class="text-lg font-semibold text-gray-800 mb-2">Tracking</h4>
                        <p class="text-gray-600 text-sm">Monitor all parcels in the system</p>
                    </div>
                    <%
                    }
                    %>
                </div>

                <!-- Feature Highlight -->
                <div class="bg-gradient-to-r from-blue-500 to-purple-600 text-white rounded-xl p-8 shadow-lg">
                    <h4 class="text-2xl font-bold mb-4">Parcel Management Made Simple</h4>
                    <p class="text-lg opacity-90">
                        Our comprehensive system helps you manage all your parcel delivery needs efficiently and securely.
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>