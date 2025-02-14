<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>CRUD Operation Records</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        body {
            background-color: #f0f0f0; /* Ash color for background */
        }
        table {
            background-color: white; /* White background */
        }
        .thead-dark {
            background-color: #6c757d; /* Darker ash color for the table header */
            color: white; /* White text color for header */
        }
    </style>
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: black">
            <div>
                <a href="${pageContext.request.contextPath}/" class="navbar-brand">System Health Dashboard</a>
            </div>
            <ul class="navbar-nav">
                <li><a href="${pageContext.request.contextPath}/listOperations" class="nav-link">Available Reports</a></li>
                <li><a href="${pageContext.request.contextPath}/new" class="nav-link">Create New Report</a></li>
            </ul>
        </nav>
    </header>
    <br>

    <div class="container">
        <h3 class="text-center">List of Available Reports</h3>
        <hr>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Record ID</th>
                    <th>Report Type</th>
                    <th>Operation Status</th>
                    <th>Generated By</th>
                    <th>Operation Timestamp</th>
                    <th>IP Address</th>
                    <th>Operation Details</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over CRUD records -->
                <c:forEach var="report" items="${listCRUDRecords}">
                    <tr>
                        <td><c:out value="${report.record_id}" /></td>
                        <td><c:out value="${report.entity_type}" /></td>
                        <td><c:out value="${report.operation_type}" /></td>
                        <td><c:out value="${report.initiated_by}" /></td>
                        <td><c:out value="${report.operation_timestamp}" /></td>
                        <td><c:out value="${report.ip_address}" /></td>
                        <td><c:out value="${report.operation_details}" /></td>
                        <td>
                            <!-- Horizontal alignment for Edit and Delete buttons with spacing -->
                            <div class="d-flex justify-content-start">
                                <a href="${pageContext.request.contextPath}/edit?id=${report.record_id}" class="btn btn-primary btn-sm mr-2">Edit Report</a>
                                
                                <a href="${pageContext.request.contextPath}/deleteOperation?id=${report.record_id}" class="btn btn-danger btn-sm" 
                                   onclick="return confirm('Are you sure you want to delete this Report?');">Delete Report</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <!-- End of iteration -->
            </tbody>
        </table>
    </div>

    <!-- Optional JavaScript for Bootstrap (if needed) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa6SAqlIiwK6Xj1KJebhZLhN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyq43gK4eQmheHaJw3p1j3puJ7nhn1OZk+I7C1"
        crossorigin="anonymous"></script>
        
</body>
</html>
