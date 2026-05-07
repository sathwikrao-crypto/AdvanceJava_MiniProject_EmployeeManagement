<%@ page import="dao.EmployeeDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow p-4">

        <h3>Add Employee</h3>

<%
    EmployeeDAO dao = new EmployeeDAO();
    int nextEmpId = dao.getNextEmpId();   // fetch next emp id
%>

        <form action="<%=request.getContextPath()%>/AddEmployeeServlet" method="post">

            <!-- Auto Generated Employee ID -->

            <input
                type="number"
                class="form-control mb-2"
                name="empno"
                value="<%= nextEmpId %>"
                readonly
            >

            <input
                type="text"
                class="form-control mb-2"
                name="name"
                placeholder="Employee Name"
                required
            >

            <input
                type="date"
                class="form-control mb-2"
                name="doj"
                required
            >

            <select
                class="form-control mb-2"
                name="gender"
                required
            >
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>

            <input
                type="number"
                step="0.01"
                class="form-control mb-2"
                name="salary"
                placeholder="Salary"
                required
            >

            <button class="btn btn-success">
                Add Employee
            </button>

            <a href="index.jsp" class="btn btn-secondary">
                Back
            </a>

        </form>

    </div>

</div>

</body>
</html>