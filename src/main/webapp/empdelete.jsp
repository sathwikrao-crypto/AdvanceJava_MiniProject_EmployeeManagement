<!DOCTYPE html>
<html>
<head>
<title>Delete Employee</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
<div class="card shadow p-4">
<h3>Delete Employee</h3>

<form action="<%=request.getContextPath()%>/DeleteEmployeeServlet" method="post">

<input class="form-control mb-3" name="empno" placeholder="Enter Employee ID" required>

<button class="btn btn-danger">Delete</button>

</form>
</div>
</div>

</body>
</html>