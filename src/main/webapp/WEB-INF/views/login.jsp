<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Parcel Management System</title>
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
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
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
        
        .fade-in {
            animation: fadeIn 0.8s ease-out;
        }
        
        .background-pattern {
            background-image: 
                radial-gradient(circle at 20% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(99, 102, 241, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 60%, rgba(139, 92, 246, 0.05) 0%, transparent 50%);
        }
        
        .glass-effect {
            backdrop-filter: blur(20px);
            background: rgba(255, 255, 255, 0.85);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Card specific gradients */
        .card-gradient-1 { background: linear-gradient(135deg, #a78bfa 0%, #8b5cf6 100%); } /* Purple */
        .card-gradient-2 { background: linear-gradient(135deg, #38bdf8 0%, #0ea5e9 100%); } /* Sky Blue */
        .card-gradient-3 { background: linear-gradient(135deg, #22c55e 0%, #16a34a 100%); } /* Green */
    </style>
</head>
<body class="min-h-screen relative overflow-hidden background-pattern">
    <div class="fixed inset-0 bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50">
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute top-40 right-20 w-40 h-40 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-20 left-1/3 w-36 h-36 bg-indigo-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-40 right-1/3 w-28 h-28 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        
        <div class="absolute top-1/4 left-10 w-2 h-2 bg-blue-400 rounded-full opacity-40 floating-shape"></div>
        <div class="absolute top-1/3 right-16 w-1 h-1 bg-purple-400 rounded-full opacity-50 floating-shape"></div>
        <div class="absolute bottom-1/4 left-1/4 w-1.5 h-1.5 bg-indigo-400 rounded-full opacity-45 floating-shape"></div>
        <div class="absolute bottom-1/3 right-1/4 w-2 h-2 bg-pink-400 rounded-full opacity-40 floating-shape"></div>
        
        <div class="absolute inset-0 opacity-5" style="background-image: radial-gradient(circle, #3b82f6 1px, transparent 1px); background-size: 50px 50px;"></div>
    </div>

    <div class="relative z-10 min-h-screen flex flex-col lg:flex-row items-center justify-center p-4 lg:space-x-12">
        <div class="w-full max-w-md fade-in flex-shrink-0 mb-8 lg:mb-0">
            <div class="glass-effect rounded-2xl shadow-2xl p-8 border border-white/20">
                <% if ("error".equals(request.getAttribute("status"))) { %>
                    <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-6 text-center font-medium">
                        <div class="flex items-center justify-center">
                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                            </svg>
                            Invalid User ID or Password
                        </div>
                    </div>
                <% } %>

                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-full mb-4 shadow-lg">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                        </svg>
                    </div>
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Parcel Management System</h1>
                    <h2 class="text-lg text-gray-600 font-medium">Welcome Back</h2>
                </div>

                <form action="<%=request.getContextPath()%>/login" method="post" onsubmit="return validateLogin()" class="space-y-6">
                    <div>
                        <label for="userId" class="block text-sm font-medium text-gray-700 mb-2">User ID</label>
                        <input 
                            type="text" 
                            id="userId" 
                            name="userId" 
                            minlength="5" 
                            maxlength="15" 
                            required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                            placeholder="Enter your User ID"
                        />
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">
                            User ID must be between 5 and 15 characters.
                        </div>
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-2">Password</label>
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                            placeholder="Enter your password"
                        />
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">
                            Password must be max 8 characters and include uppercase, lowercase, and special character.
                        </div>
                    </div>

                    <button 
                        type="submit" 
                        class="w-full bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg hover:shadow-xl"
                    >
                        Sign In
                    </button>
                </form>

                <div class="text-center mt-6 pt-6 border-t border-gray-200">
                    <p class="text-gray-600">
                        Don't have an account? 
                        <a href="<%=request.getContextPath()%>/customer-register" class="text-primary hover:text-blue-700 font-medium hover:underline transition-colors duration-200">
                            Register
                        </a>
                    </p>
                </div>
            </div>

            <div class="text-center mt-8 lg:hidden">
                <p class="text-gray-600 text-sm">
                    Secure parcel management solution
                </p>
            </div>
        </div>

        <div class="w-full max-w-2xl lg:max-w-xl text-center lg:text-left fade-in">
            <h2 class="text-4xl font-extrabold text-gray-900 mb-8 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                Streamline Your Deliveries
            </h2>
            <p class="text-lg text-gray-700 mb-12 leading-relaxed">
                Our Parcel Management System provides a comprehensive solution for efficient and reliable package delivery, ensuring your shipments reach their destination on time, every time.
            </p>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="card-gradient-1 p-1 rounded-xl shadow-lg transform hover:scale-105 transition-transform duration-300">
                    <div class="bg-white rounded-xl p-6 h-full flex flex-col items-center justify-center text-center">
                        <div class="inline-flex items-center justify-center w-14 h-14 bg-purple-500 rounded-full mb-4 shadow-md">
                            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-2">Real-time Tracking</h3>
                        <p class="text-sm text-gray-600">Monitor your parcels every step of the way, from pickup to delivery.</p>
                    </div>
                </div>

                <div class="card-gradient-2 p-1 rounded-xl shadow-lg transform hover:scale-105 transition-transform duration-300">
                    <div class="bg-white rounded-xl p-6 h-full flex flex-col items-center justify-center text-center">
                        <div class="inline-flex items-center justify-center w-14 h-14 bg-blue-500 rounded-full mb-4 shadow-md">
                            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-2">Effortless Booking</h3>
                        <p class="text-sm text-gray-600">Book your shipments quickly and conveniently with our intuitive interface.</p>
                    </div>
                </div>

                <div class="card-gradient-3 p-1 rounded-xl shadow-lg transform hover:scale-105 transition-transform duration-300">
                    <div class="bg-white rounded-xl p-6 h-full flex flex-col items-center justify-center text-center">
                        <div class="inline-flex items-center justify-center w-14 h-14 bg-green-500 rounded-full mb-4 shadow-md">
                            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.007 12.007 0 002.944 12c.045 4.381 2.686 8.093 6.606 9.774L12 22.99l2.45-1.225c3.92-1.681 6.561-5.393 6.606-9.774a12.007 12.007 0 00-3.334-8.056z"></path>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 mb-2">Secure Deliveries</h3>
                        <p class="text-sm text-gray-600">Rest assured with our commitment to safe and reliable package handling.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="hidden lg:block absolute bottom-4 w-full text-center fade-in">
            <p class="text-gray-600 text-sm">
                Secure parcel management solution
            </p>
        </div>
    </div>
</body>
</html>
