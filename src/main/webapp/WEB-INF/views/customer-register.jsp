<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
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
        function validateRegistration() {
            const name = document.getElementById("name");
            const phonenumber = document.getElementById("mobileNumber");
            const address = document.getElementById("address");
            const userid = document.getElementById("userId");
            const password = document.getElementById("password");
            const confirmPassword = document.getElementById("confirmPassword");
            const nameRegex = /^[A-Za-z\s]+$/;
            
            // Reset validation states
            name.classList.remove("border-red-500", "bg-red-50");
            phonenumber.classList.remove("border-red-500", "bg-red-50");
            address.classList.remove("border-red-500", "bg-red-50");
            userid.classList.remove("border-red-500", "bg-red-50");
            password.classList.remove("border-red-500", "bg-red-50");
            confirmPassword.classList.remove("border-red-500", "bg-red-50");
            
            // Hide all error messages
            document.querySelectorAll('.invalid-feedback').forEach(el => el.classList.add('hidden'));
            
            let flag = true;
            
            if(name.value.length > 50 || !nameRegex.test(name.value)) {
                name.classList.add("border-red-500", "bg-red-50");
                name.nextElementSibling.classList.remove('hidden');
                flag = false;
            }
            
            const phoneRegex = /^\d{10}$/;
            if(!phoneRegex.test(phonenumber.value)) {
                phonenumber.classList.add("border-red-500", "bg-red-50");
                phonenumber.parentElement.nextElementSibling.classList.remove('hidden');
                flag = false;
            }
            
            const noSpecialCharRegex = /^[A-Za-z0-9 ]+$/;
            if(!noSpecialCharRegex.test(address.value)) {
                address.classList.add("border-red-500", "bg-red-50");
                address.nextElementSibling.classList.remove('hidden');
                flag = false;
            }
            
            if(userid.value.length < 5 || userid.value.length > 20) {
                userid.classList.add("border-red-500", "bg-red-50");
                userid.nextElementSibling.classList.remove('hidden');
                flag = false;
            }
            
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{1,8}$/;
            if(!passwordRegex.test(password.value)) {
                password.classList.add("border-red-500", "bg-red-50");
                password.nextElementSibling.classList.remove('hidden');
                flag = false;
            }
            
            if(password.value != confirmPassword.value) {
                confirmPassword.classList.add("border-red-500", "bg-red-50");
                confirmPassword.nextElementSibling.classList.remove('hidden');
                flag = false;
            }
            
            return flag;
        }
        
        function resetForm() {
            const inputs = document.querySelectorAll('input, textarea');
            inputs.forEach(input => {
                input.classList.remove("border-red-500", "bg-red-50");
            });
            document.querySelectorAll('.invalid-feedback').forEach(el => el.classList.add('hidden'));
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
<body class="min-h-screen relative background-pattern">
    <!-- Enhanced Background with Floating Elements -->
    <div class="fixed inset-0 bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 -z-10">
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
    <div class="relative z-10 min-h-screen flex items-center justify-center py-8 px-4">
        <div class="w-full max-w-lg fade-in">
            <!-- Registration Container with Glass Effect -->
            <div class="glass-effect rounded-2xl shadow-2xl p-8 border border-white/20">
                
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-full mb-4 shadow-lg">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                    </div>
                    <h1 class="text-2xl font-bold text-gray-900">Create Account</h1>
                    <p class="text-gray-600 mt-2">Join our parcel management system</p>
                </div>

                <!-- Status Messages -->
                <% if ("success".equals(request.getAttribute("status"))) { %>
                    <div class="bg-green-50 border border-green-200 text-green-700 px-4 py-3 rounded-lg mb-6 text-center font-medium">
                        <div class="flex items-center justify-center">
                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                            </svg>
                            Registration successful. Proceed to &nbsp;<a href="<%=request.getContextPath()%>/login" class="text-primary hover:text-blue-700 font-semibold hover:underline">Log In</a>
                        </div>
                    </div>
                <% } else if ("error".equals(request.getAttribute("status"))) { %>
                    <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-6 text-center font-medium">
                        <div class="flex items-center justify-center">
                            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                            </svg>
                            <%=request.getAttribute("errorMessage")%>
                        </div>
                    </div>
                <% } %>

                <!-- Registration Form -->
                <form action="<%=request.getContextPath()%>/customer-register" method="post" onsubmit="return validateRegistration()" class="space-y-4">
                    
                    <!-- Name Field -->
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-2">Name</label>
                        <input 
                            type="text" 
                            id="name" 
                            name="name" 
                            required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                            placeholder="Enter Name"
                        />
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">Name can only have alphabets and spaces</div>
                    </div>

                    <!-- Email Field -->
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                            placeholder="Enter Email"
                        />
                    </div>

                    <!-- Mobile Number Field -->
                    <div>
                        <label for="mobileNumber" class="block text-sm font-medium text-gray-700 mb-2">Mobile Number</label>
                        <div class="flex gap-2">
                            <select 
                                name="countryCode" 
                                id="countryCode" 
                                required 
                                class="w-2/5 px-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 bg-white/80 backdrop-blur-sm"
                            >
                                <option value="+91">+91 (India)</option>
                                <option value="+1">+1 (USA)</option>
                            </select>
                            <input 
                                type="text" 
                                id="mobileNumber" 
                                name="mobileNumber" 
                                required 
                                pattern="\d{10}" 
                                oninput="this.value=this.value.replace(/[^0-9]/g, '').slice(0,10)"
                                class="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                                placeholder="Enter mobile number"
                            />
                        </div>
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">Mobile Number should be 10 digits</div>
                    </div>

                    <!-- Address Field -->
                    <div>
                        <label for="address" class="block text-sm font-medium text-gray-700 mb-2">Address</label>
                        <textarea 
                            id="address" 
                            name="address" 
                            required 
                            maxlength="150" 
                            rows="3"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 resize-none bg-white/80 backdrop-blur-sm"
                            placeholder="Enter address"
                        ></textarea>
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">Address must have only alphabets, numbers and spaces</div>
                    </div>

                    <!-- User ID Field -->
                    <div>
                        <label for="userId" class="block text-sm font-medium text-gray-700 mb-2">User ID</label>
                        <input 
                            type="text" 
                            id="userId" 
                            name="userId" 
                            required 
                            minlength="5" 
                            maxlength="15"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                            placeholder="Enter User Id"
                        />
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">User Id must be between 5 and 15 characters</div>
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
                            placeholder="Enter Password"
                        />
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">Password must be maximum 8 characters long having minimum one uppercase, lowercase and special character</div>
                    </div>

                    <!-- Confirm Password Field -->
                    <div>
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-2">Confirm Password</label>
                        <input 
                            type="password" 
                            id="confirmPassword" 
                            name="confirmPassword" 
                            required 
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all duration-200 placeholder-gray-400 bg-white/80 backdrop-blur-sm"
                            placeholder="Confirm Password"
                        />
                        <div class="hidden text-red-600 text-sm mt-1 font-medium">Password and Confirm Password fields must match</div>
                    </div>

                    <!-- Email Notifications Checkbox -->
                    <div class="flex items-center pt-2">
                        <input 
                            type="checkbox" 
                            id="emailNotifications" 
                            name="emailNotifications" 
                            class="w-4 h-4 text-primary bg-gray-100 border-gray-300 rounded focus:ring-primary focus:ring-2"
                        />
                        <label for="emailNotifications" class="ml-3 text-sm text-gray-700">
                            Receive email notifications related to delivery
                        </label>
                    </div>

                    <!-- Submit Buttons -->
                    <div class="flex justify-center gap-4 pt-4">
                        <button 
                            type="submit" 
                            class="px-8 py-3 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-semibold rounded-lg transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg hover:shadow-xl"
                        >
                            Register
                        </button>
                        <button 
                            type="reset" 
                            onclick="resetForm()" 
                            class="px-8 py-3 bg-white/80 border border-primary text-primary hover:bg-blue-50 font-semibold rounded-lg transition-all duration-200 transform hover:scale-[1.02] active:scale-[0.98] backdrop-blur-sm"
                        >
                            Reset
                        </button>
                    </div>
                </form>

                <!-- Login Link -->
                <div class="text-center mt-6 pt-6 border-t border-gray-200">
                    <p class="text-gray-600">
                        Already have an account? 
                        <a href="<%=request.getContextPath()%>/login" class="text-primary hover:text-blue-700 font-medium hover:underline transition-colors duration-200">
                            Log In
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>