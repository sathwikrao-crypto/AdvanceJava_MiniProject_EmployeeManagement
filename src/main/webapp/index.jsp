<!DOCTYPE html>
<html>
<head>
<title>Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background: #f4f6f9; }
.card { transition: 0.3s; }
.card:hover { transform: scale(1.05); }
</style>
</head>

<body>

<div class="container mt-5 text-center">
    <h2 class="mb-4">Employee Management System</h2>

    <div class="row g-4">

        <div class="col-md-4">
            <div class="card p-3 shadow">
                <h5>Add Employee</h5>
                <a href="empadd.jsp" class="btn btn-success mt-2">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3 shadow">
                <h5>Update Employee</h5>
                <a href="empupdate.jsp" class="btn btn-warning mt-2">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3 shadow">
                <h5>Delete Employee</h5>
                <a href="empdelete.jsp" class="btn btn-danger mt-2">Open</a>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card p-3 shadow">
                <h5>View Employees</h5>
                <a href="DisplayEmployeeServlet" class="btn btn-primary mt-2">View</a>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card p-3 shadow">
                <h5>Reports</h5>
                <a href="report_form.jsp" class="btn btn-dark mt-2">Generate</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>