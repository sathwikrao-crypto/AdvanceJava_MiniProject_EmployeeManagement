<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script>
function confirmDelete() {
    return confirm("Are you sure you want to delete this employee?");
}
</script>

</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow p-4">

        <h3>Delete Employee</h3>

        <form action="DeleteEmployeeServlet" method="post" onsubmit="return confirmDelete()">

            <input
                type="number"
                class="form-control mb-3"
                name="empno"
                placeholder="Enter Employee ID to Delete"
                required
            >

            <button class="btn btn-danger">
                Delete Employee
            </button>

            <a href="index.jsp" class="btn btn-secondary">
                Back
            </a>

        </form>

    </div>

</div>

</body>
</html>