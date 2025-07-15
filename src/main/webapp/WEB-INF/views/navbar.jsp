<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
nav {
    background-color: #34495e;
    padding: 15px 0;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

nav ul div {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

nav li {
    margin: 0 15px;
}

nav a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    padding: 6px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

nav a:hover {
    background-color: #2c3e50;
}

/* Add padding to body to prevent content from being hidden behind fixed navbar */
body {
    padding-top: 60px; /* Adjust based on navbar height */
}

/* Responsive adjustments */
@media (max-width: 768px) {
    nav ul {
        flex-direction: column;
        align-items: center;
        gap: 10px;
    }
    
    nav ul div {
        justify-content: center;
        flex-wrap: wrap;
    }
    
    nav li {
        margin: 5px 10px;
    }
    
    body {
        padding-top: 120px; /* More padding for mobile due to wrapped content */
    }
}

@media (max-width: 480px) {
    nav ul div {
        flex-direction: column;
        gap: 5px;
    }
    
    body {
        padding-top: 200px; /* Even more padding for small screens */
    }
}
</style>

<nav class="d-print-none">
    <ul>
        <div>
            <li><a href=""><i class="fa-solid fa-user"></i>&nbsp;<%=session.getAttribute("userId") %></a></li>
        </div>

        <div>
            <%
            if ("Customer".equals(session.getAttribute("role"))) {
            %>
            <li><a href="<%=request.getContextPath()%>/">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/booking-service">Booking Service</a></li>
            <li><a href="<%=request.getContextPath()%>/invoice">Invoice</a></li>
            <li><a href="<%=request.getContextPath()%>/tracking">Tracking</a></li>
            <li><a href="<%=request.getContextPath()%>/previous-booking">Previous Booking</a></li>
            <li><a href="<%=request.getContextPath()%>/contact-support">Contact Support</a></li>
            <%--<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>--%>
            <%
            } else {
            %>
            <li><a href="<%=request.getContextPath()%>/">Home</a></li>
            <%-- <li><a href="<%=request.getContextPath()%>/booking-service">Booking Service</a></li> --%>
            <%-- <li><a href="<%=request.getContextPath()%>/invoice">Invoice</a></li> --%>
            <li><a href="<%=request.getContextPath()%>/tracking">Tracking</a></li>
            <li><a href="<%=request.getContextPath()%>/previous-booking">All Bookings</a></li>
            <li><a href="<%=request.getContextPath()%>/delivery-status">Delivery Status/Update</a></li>
            <li><a href="<%=request.getContextPath()%>/pickup-scheduling">Pickup Scheduling</a></li>
            <%-- <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li> --%>
            <%
            }
            %>
        </div>

        <div>
            <li><a href="<%=request.getContextPath()%>/logout">Logout<i class="fa-solid fa-right-from-bracket"></i>&nbsp;</a></li>
        </div>
    </ul>
</nav>