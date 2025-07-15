<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
if (session.getAttribute("name") == null) {
	response.sendRedirect(request.getContextPath() + "/login");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="https://static.vecteezy.com/system/resources/thumbnails/002/206/240/small/fast-delivery-icon-free-vector.jpg">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Previous Booking</title>
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
        <div class="max-w-7xl mx-auto fade-in">
            <%
            if ("Customer".equals(request.getAttribute("role"))) {
            %>
            <!-- Customer View -->
            <div class="text-center mb-8">
                <h1 class="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                    Previous Bookings
                </h1>
                <p class="text-gray-600 text-lg">View and manage your booking history</p>
            </div>

            <!-- Filter Section -->
            <div class="glass-effect rounded-2xl shadow-lg p-6 mb-8 max-w-md mx-auto">
                <div class="flex items-center mb-4">
                    <div class="w-10 h-10 bg-gradient-to-r from-purple-500 to-pink-500 rounded-xl flex items-center justify-center mr-3">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.414A1 1 0 013 6.707V4z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Filter Bookings</h3>
                        <p class="text-gray-600 text-sm">Search by booking ID</p>
                    </div>
                </div>
                
                <div>
                    <label for="bookingIdFilterCustomer" class="block text-sm font-semibold text-gray-700 mb-2">Booking ID:</label>
                    <input type="number" id="bookingIdFilterCustomer" placeholder="Enter Booking ID"
                           oninput="this.value=this.value.slice(0,9)" 
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent transition-all duration-200 text-sm" />
                </div>
            </div>

            <!-- Bookings Table -->
            <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden">
                <div class="bg-gradient-to-r from-purple-50 to-pink-50 p-4 border-b border-purple-200">
                    <h3 class="text-xl font-bold text-purple-800">Your Booking History</h3>
                </div>
                
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">User ID</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Booking ID</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Booking Date</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Receiver Name</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Delivered Address</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Amount</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>
                        <tbody id="customer-tbody" class="bg-white divide-y divide-gray-200">
                            <%
                            ArrayList<ArrayList<String>> customerDetails = (ArrayList<ArrayList<String>>) request.getAttribute("history");
                            if (customerDetails == null) {
                                customerDetails = new ArrayList<>();
                            }
                            for (ArrayList<String> row : customerDetails) {
                            %>
                            <tr class="hover:bg-gray-50 transition-colors duration-200">
                                <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("userId")%></td>
                                <td class="px-4 py-4 text-sm font-semibold text-gray-900"><%=row.get(0)%></td>
                                <td class="px-4 py-4 text-sm text-gray-700"><%=row.get(1)%></td>
                                <td class="px-4 py-4 text-sm text-gray-700"><%=row.get(2)%></td>
                                <td class="px-4 py-4 text-sm text-gray-700"><%=row.get(3)%></td>
                                <td class="px-4 py-4 text-sm font-semibold text-green-600">₹<%=row.get(4)%></td>
                                <td class="px-4 py-4 text-sm">
                                    <span class="px-3 py-1 rounded-full text-xs font-semibold
                                        <% String status = row.get(5).trim().toLowerCase();
                                           if ("delivered".equals(status)) { %>
                                            bg-green-100 text-green-800
                                        <% } else if ("booked".equals(status)) { %>
                                            bg-blue-100 text-blue-800
                                        <% } else if ("in transit".equals(status)) { %>
                                            bg-yellow-100 text-yellow-800
                                        <% } else if ("cancelled".equals(status)) { %>
                                            bg-red-100 text-red-800
                                        <% } else { %>
                                            bg-gray-100 text-gray-800
                                        <% } %>">
                                        <%=row.get(5)%>
                                    </span>
                                </td>
                                <td class="px-4 py-4 text-sm">
                                    <%
                                    String bookingStatus = row.get(5).trim().toLowerCase();
                                    String bookingId = row.get(0);
                                    if ("booked".equals(bookingStatus) || "in transit".equals(bookingStatus)) {
                                    %>
                                        <a href="<%=request.getContextPath()%>/cancel-booking?bookingId=<%=bookingId%>"
                                           onclick="return confirm('Are you sure you want to cancel this booking?');"
                                           class="bg-red-600 hover:bg-red-700 text-white text-xs font-semibold py-2 px-3 rounded-lg transition-all duration-200 transform hover:scale-105">
                                           Cancel
                                        </a>
                                    <%
                                    } else {
                                    %>
                                        <span class="bg-gray-400 text-white text-xs font-semibold py-2 px-3 rounded-lg cursor-not-allowed" title="Cannot cancel this booking">
                                           Cancel
                                        </span>
                                    <%
                                    }
                                    %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Pagination -->
            <div class="mt-8 flex justify-center">
                <ul id="customer-pagination" class="flex space-x-2"></ul>
            </div>
            <% } %>

            <% if ("Officer".equals(request.getAttribute("role"))) { %>
            <!-- Officer View -->
            <div class="text-center mb-8">
                <h1 class="text-4xl font-bold mb-4 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
                    All Bookings
                </h1>
                <p class="text-gray-600 text-lg">Search and manage customer bookings</p>
            </div>

            <!-- Search Form -->
            <div class="glass-effect rounded-2xl shadow-lg p-8 mb-8 max-w-2xl mx-auto">
                <div class="flex items-center mb-6">
                    <div class="w-12 h-12 bg-gradient-to-r from-blue-500 to-cyan-500 rounded-xl flex items-center justify-center mr-4">
                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-xl font-bold text-gray-800">Search Bookings</h3>
                        <p class="text-gray-600 text-sm">Find bookings by user ID and date range</p>
                    </div>
                </div>
                
                <form action="<%=request.getContextPath()%>/previous-booking" method="post" onsubmit="return validateForm()" class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div>
                        <label for="userId" class="block text-sm font-semibold text-gray-700 mb-2">User ID</label>
                        <input type="text" id="userId" name="userId" placeholder="Enter User ID" required 
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 text-sm" />
                    </div>
                    <div>
                        <label for="startDate" class="block text-sm font-semibold text-gray-700 mb-2">Start Date</label>
                        <input type="date" id="startDate" name="startDate" required 
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 text-sm" />
                    </div>
                    <div>
                        <label for="endDate" class="block text-sm font-semibold text-gray-700 mb-2">End Date</label>
                        <input type="date" id="endDate" name="endDate" required 
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 text-sm" />
                    </div>
                    <div class="md:col-span-3 text-center">
                        <button type="submit" class="bg-gradient-to-r from-blue-600 to-cyan-600 hover:from-blue-700 hover:to-cyan-700 text-white font-semibold py-3 px-8 rounded-lg transition-all duration-200 transform hover:scale-105 shadow-md">
                            <svg class="w-4 h-4 mr-2 inline-block" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                            Search
                        </button>
                    </div>
                </form>
            </div>

            <!-- Filter Section -->
            <div class="glass-effect rounded-2xl shadow-lg p-6 mb-8 max-w-md mx-auto">
                <div class="flex items-center mb-4">
                    <div class="w-10 h-10 bg-gradient-to-r from-green-500 to-teal-500 rounded-xl flex items-center justify-center mr-3">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.414A1 1 0 013 6.707V4z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Filter Results</h3>
                        <p class="text-gray-600 text-sm">Filter by booking ID</p>
                    </div>
                </div>
                
                <div>
                    <label for="bookingIdFilterOfficer" class="block text-sm font-semibold text-gray-700 mb-2">Booking ID:</label>
                    <input type="number" id="bookingIdFilterOfficer" placeholder="Enter Booking ID"
                           oninput="this.value=this.value.slice(0,9)" 
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent transition-all duration-200 text-sm" />
                </div>
            </div>

            <!-- Results Table -->
            <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden">
                <div class="bg-gradient-to-r from-blue-50 to-cyan-50 p-4 border-b border-blue-200">
                    <h3 class="text-xl font-bold text-blue-800">Booking Results</h3>
                </div>
                
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">User ID</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Booking ID</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Booking Date</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Receiver Name</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Delivered Address</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Amount</th>
                                <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Status</th>
                            </tr>
                        </thead>
                        <tbody id="officer-tbody" class="bg-white divide-y divide-gray-200">
                            <%
                            ArrayList<ArrayList<String>> officerDetails = (ArrayList<ArrayList<String>>) request.getAttribute("history");
                            if (officerDetails == null) {
                                officerDetails = new ArrayList<>();
                            }
                            for (ArrayList<String> row : officerDetails) {
                            %>
                            <tr class="hover:bg-gray-50 transition-colors duration-200">
                                <td class="px-4 py-4 text-sm text-gray-700"><%=request.getAttribute("userId")%></td>
                                <td class="px-4 py-4 text-sm font-semibold text-gray-900"><%=row.get(0)%></td>
                                <td class="px-4 py-4 text-sm text-gray-700"><%=row.get(1)%></td>
                                <td class="px-4 py-4 text-sm text-gray-700"><%=row.get(2)%></td>
                                <td class="px-4 py-4 text-sm text-gray-700"><%=row.get(3)%></td>
                                <td class="px-4 py-4 text-sm font-semibold text-green-600">₹<%=row.get(4)%></td>
                                <td class="px-4 py-4 text-sm">
                                    <span class="px-3 py-1 rounded-full text-xs font-semibold
                                        <% String officerStatus = row.get(5).trim().toLowerCase();
                                           if ("delivered".equals(officerStatus)) { %>
                                            bg-green-100 text-green-800
                                        <% } else if ("booked".equals(officerStatus)) { %>
                                            bg-blue-100 text-blue-800
                                        <% } else if ("in transit".equals(officerStatus)) { %>
                                            bg-yellow-100 text-yellow-800
                                        <% } else if ("cancelled".equals(officerStatus)) { %>
                                            bg-red-100 text-red-800
                                        <% } else { %>
                                            bg-gray-100 text-gray-800
                                        <% } %>">
                                        <%=row.get(5)%>
                                    </span>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Pagination -->
            <div class="mt-8 flex justify-center">
                <ul class="pagination flex space-x-2" id="officer-pagination"></ul>
            </div>
            <% } %>

            <!-- Error Message -->
            <% if ("error".equals(request.getAttribute("status"))) { %>
            <div class="bg-gradient-to-r from-red-50 to-pink-50 border border-red-200 rounded-xl mb-8 shadow-lg max-w-2xl mx-auto">
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
        </div>
    </div>

    <script>
        function validateForm() {
            const userId = document.getElementById("userId");
            const startDate = new Date(document.getElementById("startDate").value);
            const endDate = new Date(document.getElementById("endDate").value);

            if (userId.value.length < 3 || userId.value.length > 15) {
                alert("User ID must be between 3 and 15 characters.");
                return false;
            }
            if (startDate > endDate) {
                alert("Start Date must be before End Date.");
                return false;
            }
            return true;
        }

        document.addEventListener("DOMContentLoaded", function () {
            const role = "<%=request.getAttribute("role")%>";
            let tbodyId = role === "Customer" ? "customer-tbody" : "officer-tbody";
            let paginationId = role === "Customer" ? "customer-pagination" : "officer-pagination";
            let filterId = role === "Customer" ? "bookingIdFilterCustomer" : "bookingIdFilterOfficer";

            const rowsPerPage = 5;
            let currentPage = 1;
            const tableBody = document.getElementById(tbodyId);
            const rows = Array.from(tableBody.getElementsByTagName("tr"));
            const pagination = document.getElementById(paginationId);
            let filteredRows = rows;

            displayRows();
            updatePagination();

            function displayRows() {
                const start = (currentPage - 1) * rowsPerPage;
                const end = start + rowsPerPage;
                tableBody.innerHTML = "";
                filteredRows.slice(start, end).forEach(row => tableBody.appendChild(row));
            }

            function updatePagination() {
                pagination.innerHTML = "";
                const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
                for (let i = 1; i <= totalPages; i++) {
                    const pageItem = document.createElement("li");
                    pageItem.className = "page-item";
                    const btn = document.createElement("button");
                    btn.innerText = i;
                    if (i === currentPage) {
                        btn.className = 'px-3 py-2 text-sm font-semibold rounded-lg transition-all duration-200 bg-blue-600 text-white shadow-md';
                    } else {
                        btn.className = 'px-3 py-2 text-sm font-semibold rounded-lg transition-all duration-200 bg-white text-gray-700 border border-gray-300 hover:bg-gray-50';
                    }
                    btn.onclick = () => {
                        currentPage = i;
                        displayRows();
                        updatePagination();
                    };
                    pageItem.appendChild(btn);
                    pagination.appendChild(pageItem);
                }
            }

            document.getElementById(filterId).addEventListener("input", e => {
                const filterText = e.target.value.trim();
                filteredRows = rows.filter(row => row.cells[1].textContent.includes(filterText));
                currentPage = 1;
                displayRows();
                updatePagination();
            });
        });
    </script>
</body>
</html>