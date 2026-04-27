<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,model.Employee" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<h2 class="mb-3">Employee List</h2>

<table class="table table-bordered table-striped shadow">

    <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>DOJ</th>
            <th>Gender</th>
            <th>Salary</th>
        </tr>
    </thead>

    <tbody>

<%
List<Employee> list = (List<Employee>) request.getAttribute("list");

if(list != null && !list.isEmpty()){
    for(Employee e : list){
%>

        <tr>
            <td><%= e.getEmpno() %></td>
            <td><%= e.getEmpName() %></td>
            <td><%= e.getDoj() %></td>
            <td><%= e.getGender() %></td>
            <td>₹ <%= String.format("%,.2f", e.getBsalary()) %></td>
        </tr>

<%
    }
} else {
%>

        <tr>
            <td colspan="5" class="text-center">
                No Employees Found
            </td>
        </tr>

<%
}
%>

    </tbody>
</table>

<a href="index.jsp" class="btn btn-secondary">Back</a>

</div>

</body>
</html>