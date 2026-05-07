<!DOCTYPE html>
<html>
<head>
<title>Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body{

    background-image:
    linear-gradient(rgba(0,0,0,0.6),
    rgba(0,0,0,0.6)),

    url('https://images.unsplash.com/photo-1521737604893-d14cc237f11d');

    background-size: cover;

    background-position: center;

    background-repeat: no-repeat;

    background-attachment: fixed;

    min-height: 100vh;

    font-family: Arial;
}

.card-box{

    width: 500px;

    margin: auto;

    margin-top: 50px;

    background: rgba(255,255,255,0.15);

    backdrop-filter: blur(10px);

    border-radius: 20px;

    color: white;
}

.form-control{

    height: 45px;

    border-radius: 10px;
}

h3{

    text-align: center;

    margin-bottom: 20px;
}

.btn{

    border-radius: 10px;
}

</style>
</head>

<body>

<div class="container mt-5 text-center">
    <h2 class="mb-4"
    style="
    color:white;
    text-shadow:2px 2px 8px black;
    font-weight:bold;
">
    Employee Management System
</h2>
    

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