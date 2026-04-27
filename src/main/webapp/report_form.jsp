<!DOCTYPE html>
<html>
<head>
<title>Reports</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
<div class="card shadow p-4">

<h3>Generate Report</h3>

<form action="<%=request.getContextPath()%>/ReportServlet" method="post">

<select class="form-control mb-3" name="type">
<option value="name">Name Starts With</option>
<option value="exp">Experience</option>
<option value="salary">Salary</option>
</select>

<input class="form-control mb-2" name="letter" placeholder="Enter Letter">
<input class="form-control mb-2" name="years" placeholder="Years of Experience">
<input class="form-control mb-2" name="salary" placeholder="Salary Amount">

<button class="btn btn-dark">Generate</button>

</form>

</div>
</div>

</body>
</html>