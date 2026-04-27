<!DOCTYPE html>
<html>
<head>
<title>Update Employee</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
<div class="card shadow p-4">
<h3>Update Employee</h3>

<form action="<%=request.getContextPath()%>/UpdateEmployeeServlet" method="post">

<input class="form-control mb-2" name="empno" placeholder="Employee ID" required>
<input class="form-control mb-2" name="name" placeholder="Name">
<input type="date" class="form-control mb-2" name="doj">
<input class="form-control mb-2" name="gender" placeholder="Gender">
<input class="form-control mb-2" name="salary" placeholder="Salary">

<button class="btn btn-warning">Update</button>

</form>
</div>
</div>

</body>
</html>