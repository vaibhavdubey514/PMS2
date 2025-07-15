<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
    <script>
        function validateLogin() {
            const userId = document.getElementById('userId');
            const password = document.getElementById('password');
            let isValid = true;

            // Reset previous validation states
            userId.classList.remove('border-red-500', 'bg-red-50');
            password.classList.remove('border-red-500', 'bg-red-50');
            
            const userIdFeedback = userId.nextElementSibling;
            const passwordFeedback = password.nextElementSibling;
            
            userIdFeedback.classList.add('hidden');
            passwordFeedback.classList.add('hidden');

            // Validate User ID
            if (userId.value.length < 5 || userId.value.length > 15) {
                userId.classList.add('border-red-500', 'bg-red-50');
                userIdFeedback.classList.remove('hidden');
                isValid = false;
            }

            // Validate Password (max 8 characters, uppercase, lowercase, special character)
            const passwordValue = password.value;
            const hasUpper = /[A-Z]/.test(passwordValue);
            const hasLower = /[a-z]/.test(passwordValue);
            const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(passwordValue);
            
            if (passwordValue.length > 8 || !hasUpper || !hasLower || !hasSpecial) {
                password.classList.add('border-red-500', 'bg-red-50');
                passwordFeedback.classList.remove('hidden');
                isValid = false;
            }

            return isValid;
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
    </style>
</head>
<body class="min-h-screen relative overflow-hidden background-pattern">
    <!-- Enhanced Background with Floating Elements -->
    <div class="fixed inset-0 bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50">
        <!-- Animated Background Shapes -->
        <div class="absolute top-20 left-20 w-32 h-32 bg-blue-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute top-40 right-20 w-40 h-40 bg-purple-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-20 left-1/3 w-36 h-36 bg-indigo-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        <div class="absolute bottom-40 right-1/3 w-28 h-28 bg-pink-200 rounded-full mix-blend-multiply filter blur-xl opacity-30 floating-shape"></div>
        
        <!-- Geometric Patterns -->
        <div class="absolute top-1/4 left-10 w-2 h-2 bg-blue-400 rounded-full opacity-40 floating-shape"></div>
        <div class="absolute top-1/3 right-16 w-1 h-1 bg-purple-400 rounded-full opacity-50 floating-shape"></div>
        <div class="absolute bottom-1/4 left-1/4 w-1.5 h-1.5 bg-indigo-400 rounded-full opacity-45 floating-shape"></div>
        <div class="absolute bottom-1/3 right-1/4 w-2 h-2 bg-pink-400 rounded-full opacity-40 floating-shape"></div>
        
        <!-- Subtle Grid Pattern -->
        <div class="absolute inset-0 opacity-5" style="background-image: radial-gradient(circle, #3b82f6 1px, transparent 1px); background-size: 50px 50px;"></div>
    </div>

    <!-- Main Content -->
    <div class="relative z-10 min-h-screen flex items-center justify-center p-4">
        <div class="w-full max-w-md fade-in">
            <!-- Login Container with Glass Effect -->
            <div class="glass-effect rounded-2xl shadow-2xl p-8 border border-white/20">
                <!-- Error Alert -->
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

                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-full mb-4 shadow-lg">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                        </svg>
                    </div>
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Parcel Management System</h1>
                    <h2 class="text-lg text-gray-600 font-medium">Welcome Back</h2>
                </div>

                <!-- Login Form -->
                <form action="<%=request.getContextPath()%>/login" method="post" onsubmit="return validateLogin()" class="space-y-6">
                    <!-- User ID Field -->
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

                    <!-- Password Field -->
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

                    <!-- Login Button -->
                    <button 
                        type="submit" 
                        class="w-full bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg hover:shadow-xl"
                    >
                        Sign In
                    </button>
                </form>

                <!-- Register Link -->
                <div class="text-center mt-6 pt-6 border-t border-gray-200">
                    <p class="text-gray-600">
                        Don't have an account? 
                        <a href="<%=request.getContextPath()%>/customer-register" class="text-primary hover:text-blue-700 font-medium hover:underline transition-colors duration-200">
                            Register
                        </a>
                    </p>
                </div>
            </div>

            <!-- Footer -->
            <div class="text-center mt-8">
                <p class="text-gray-600 text-sm">
                    Secure parcel management solution
                </p>
            </div>
        </div>
    </div>
</body>
</html>