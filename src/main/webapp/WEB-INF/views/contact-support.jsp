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
<title>Contact Support</title>
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
        <div class="max-w-4xl mx-auto fade-in">
            <!-- Page Title -->
            <div class="text-center mb-12">
                <h1 class="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                    Contact Support
                </h1>
                <p class="text-gray-600 text-lg">Get help with any questions or issues</p>
            </div>

            <!-- Main Support Card -->
            <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden mb-8">
                <!-- Header -->
                <div class="bg-gradient-to-r from-blue-50 to-purple-50 p-6 border-b border-blue-200">
                    <div class="flex items-center">
                        <div class="w-12 h-12 bg-gradient-to-r from-blue-500 to-purple-500 rounded-xl flex items-center justify-center mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18.364 5.636l-3.536 3.536m0 5.656l3.536 3.536M9.172 9.172L5.636 5.636m3.536 9.192L5.636 18.364M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5 0a4 4 0 11-8 0 4 4 0 018 0z"></path>
                            </svg>
                        </div>
                        <div>
                            <h2 class="text-2xl font-bold text-gray-800">Need Help?</h2>
                            <p class="text-gray-600">Our support team is here to assist you</p>
                        </div>
                    </div>
                </div>

                <!-- Contact Information -->
                <div class="p-8">
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                        <!-- Email -->
                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 rounded-xl p-6 text-center hover:transform hover:scale-105 transition-all duration-300 shadow-md">
                            <div class="w-16 h-16 bg-blue-500 rounded-full flex items-center justify-center mx-auto mb-4">
                                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                            <h3 class="text-lg font-bold text-blue-800 mb-2">Email</h3>
                            <p class="text-blue-600 font-medium">support@pms.com</p>
                            <p class="text-blue-500 text-sm mt-2">24/7 Email Support</p>
                        </div>

                        <!-- Phone -->
                        <div class="bg-gradient-to-br from-green-50 to-green-100 rounded-xl p-6 text-center hover:transform hover:scale-105 transition-all duration-300 shadow-md">
                            <div class="w-16 h-16 bg-green-500 rounded-full flex items-center justify-center mx-auto mb-4">
                                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                </svg>
                            </div>
                            <h3 class="text-lg font-bold text-green-800 mb-2">Contact</h3>
                            <p class="text-green-600 font-medium">+91 8527419632</p>
                            <p class="text-green-500 text-sm mt-2">Mon-Fri, 9AM-6PM</p>
                        </div>

                        <!-- Address -->
                        <div class="bg-gradient-to-br from-purple-50 to-purple-100 rounded-xl p-6 text-center hover:transform hover:scale-105 transition-all duration-300 shadow-md">
                            <div class="w-16 h-16 bg-purple-500 rounded-full flex items-center justify-center mx-auto mb-4">
                                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                            </div>
                            <h3 class="text-lg font-bold text-purple-800 mb-2">Address</h3>
                            <p class="text-purple-600 font-medium">TCS Synergy Park, Gachibowli</p>
                            <p class="text-purple-500 text-sm mt-2">Visit Our Office</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Support Information -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- FAQ Section -->
                <div class="glass-effect rounded-2xl shadow-lg p-6">
                    <div class="flex items-center mb-4">
                        <div class="w-10 h-10 bg-gradient-to-r from-orange-500 to-red-500 rounded-xl flex items-center justify-center mr-3">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-800">Quick Help</h3>
                            <p class="text-gray-600 text-sm">Common questions answered</p>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="bg-white rounded-lg p-3 border border-gray-200">
                            <p class="text-sm font-medium text-gray-800">How to track my parcel?</p>
                            <p class="text-xs text-gray-600 mt-1">Use the tracking page with your booking ID</p>
                        </div>
                        <div class="bg-white rounded-lg p-3 border border-gray-200">
                            <p class="text-sm font-medium text-gray-800">How to cancel booking?</p>
                            <p class="text-xs text-gray-600 mt-1">Visit previous bookings to cancel active orders</p>
                        </div>
                        <div class="bg-white rounded-lg p-3 border border-gray-200">
                            <p class="text-sm font-medium text-gray-800">Payment issues?</p>
                            <p class="text-xs text-gray-600 mt-1">Contact our support team immediately</p>
                        </div>
                    </div>
                </div>

                <!-- Support Hours -->
                <div class="glass-effect rounded-2xl shadow-lg p-6">
                    <div class="flex items-center mb-4">
                        <div class="w-10 h-10 bg-gradient-to-r from-indigo-500 to-blue-500 rounded-xl flex items-center justify-center mr-3">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-800">Support Hours</h3>
                            <p class="text-gray-600 text-sm">When we're available to help</p>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="flex justify-between items-center py-2 border-b border-gray-200">
                            <span class="text-sm font-medium text-gray-700">Monday - Friday</span>
                            <span class="text-sm text-gray-600">9:00 AM - 6:00 PM</span>
                        </div>
                        <div class="flex justify-between items-center py-2 border-b border-gray-200">
                            <span class="text-sm font-medium text-gray-700">Saturday</span>
                            <span class="text-sm text-gray-600">10:00 AM - 4:00 PM</span>
                        </div>
                        <div class="flex justify-between items-center py-2 border-b border-gray-200">
                            <span class="text-sm font-medium text-gray-700">Sunday</span>
                            <span class="text-sm text-gray-600">Closed</span>
                        </div>
                        <div class="bg-blue-50 rounded-lg p-3 mt-4">
                            <p class="text-xs text-blue-700 font-medium">📧 Email support is available 24/7</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Emergency Contact -->
            <div class="glass-effect rounded-2xl shadow-lg p-6 mt-8 bg-gradient-to-r from-red-50 to-pink-50 border border-red-200">
                <div class="text-center">
                    <div class="w-16 h-16 bg-red-500 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.732-.833-2.464 0L4.34 16.5c-.77.833.192 2.5 1.732 2.5z"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-red-800 mb-2">Emergency Support</h3>
                    <p class="text-red-700 mb-4">For urgent delivery issues or lost packages</p>
                    <p class="text-2xl font-bold text-red-600">+91 8527419632</p>
                    <p class="text-red-500 text-sm mt-2">Available 24/7 for emergencies</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>