<%@ page import="java.util.*,model.Employee,dao.EmployeeDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Report</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow p-4">

        <h3>Generate Report</h3>

<%
EmployeeDAO dao = new EmployeeDAO();
List<Employee> empList = dao.getAll();
%>

        <form action="ReportServlet" method="post">

            <!-- Report Type -->

            <label class="form-label mb-2">
                Select Report Type
            </label>

            <select
                name="type"
                class="form-control mb-3"
                required
            >
                <option value="">Select Report Type</option>
                <option value="empid">Employee By ID</option>
                <option value="name">Name Starts With</option>
                <option value="exp">Years of Experience</option>
                <option value="salary">Salary Greater Than</option>
            </select>

            <!-- Employee Dropdown -->

            <label class="form-label mb-2">
                Select Employee by Emp ID
            </label>

            <select
                name="empno"
                class="form-control mb-3"
            >
                <option value="">Select Employee ID</option>

<%
for(Employee e : empList){
%>

                <option value="<%= e.getEmpno() %>">
                    <%= e.getEmpno() %> - <%= e.getEmpName() %>
                </option>

<%
}
%>

            </select>

            <!-- Name Starts With -->

            <input
                type="text"
                name="letter"
                class="form-control mb-3"
                placeholder="Enter Starting Letter"
            >

            <!-- Experience -->

            <input
                type="number"
                name="years"
                class="form-control mb-3"
                placeholder="Enter Years of Experience"
            >

            <!-- Salary -->

            <input
                type="number"
                step="0.01"
                name="salary"
                class="form-control mb-3"
                placeholder="Enter Salary Amount"
            >

            <button class="btn btn-success">
                Generate Report
            </button>

            <a href="index.jsp" class="btn btn-secondary">
                Back
            </a>

        </form>

    </div>

</div>

</body>
</html>