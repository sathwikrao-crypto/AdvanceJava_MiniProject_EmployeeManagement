<%@ page import="model.Employee" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow p-4">

        <h3>Update Employee</h3>

        <!-- STEP 1 : Search Employee by ID -->

        <form action="UpdateEmployeeServlet" method="get">

            <input
                type="number"
                class="form-control mb-3"
                name="empno"
                placeholder="Enter Employee ID"
                required
            >

            <button class="btn btn-primary">
                Search Employee
            </button>

        </form>

        <hr>

<%
Employee e = (Employee) request.getAttribute("emp");

if (e != null) {
%>

        <!-- STEP 2 : Edit All Fields -->

        <form action="UpdateEmployeeServlet" method="post">

            <input
                type="number"
                class="form-control mb-2"
                name="empno"
                value="<%= e.getEmpno() %>"
                readonly
            >

            <input
                type="text"
                class="form-control mb-2"
                name="name"
                value="<%= e.getEmpName() %>"
                required
            >

            <input
                type="date"
                class="form-control mb-2"
                name="doj"
                value="<%= e.getDoj() %>"
                required
            >

            <select
                class="form-control mb-2"
                name="gender"
                required
            >
                <option value="Male"
                    <%= "Male".equals(e.getGender()) ? "selected" : "" %>>
                    Male
                </option>

                <option value="Female"
                    <%= "Female".equals(e.getGender()) ? "selected" : "" %>>
                    Female
                </option>
            </select>

            <input
                type="number"
                step="0.01"
                class="form-control mb-3"
                name="salary"
                value="<%= e.getBsalary() %>"
                required
            >

            <button class="btn btn-success">
                Update Employee
            </button>

            <a href="index.jsp" class="btn btn-secondary">
                Back
            </a>

        </form>

<%
}
%>

    </div>

</div>

</body>
</html>