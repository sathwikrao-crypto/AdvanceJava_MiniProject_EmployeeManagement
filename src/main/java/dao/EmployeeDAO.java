package dao;

import java.sql.*;
import java.util.*;
import model.Employee;

public class EmployeeDAO {

    private String url = "jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC";
    private String user = "root";   // change if needed
    private String pass = "Sathwik@2007"; // change if needed

    // DATABASE CONNECTION
    private Connection getConn() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }

    // =========================
    // ADD EMPLOYEE (AUTO INCREMENT EMPNO)
    // =========================
    public void addEmployee(Employee e) throws Exception {

        String sql = "INSERT INTO Employee (EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?)";

        try (
            Connection con = getConn();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, e.getEmpName());
            ps.setDate(2, e.getDoj());
            ps.setString(3, e.getGender());
            ps.setDouble(4, e.getBsalary());

            ps.executeUpdate();

            System.out.println("Employee Added Successfully");
        }
    }

    // =========================
    // UPDATE EMPLOYEE
    // =========================
    public void updateEmployee(Employee e) throws Exception {

        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";

        try (
            Connection con = getConn();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, e.getEmpName());
            ps.setDate(2, e.getDoj());
            ps.setString(3, e.getGender());
            ps.setDouble(4, e.getBsalary());
            ps.setInt(5, e.getEmpno());

            int rows = ps.executeUpdate();

            System.out.println("Rows Updated: " + rows);
        }
    }

    // =========================
    // DELETE EMPLOYEE
    // =========================
    public void deleteEmployee(int id) throws Exception {

        String sql = "DELETE FROM Employee WHERE Empno=?";

        try (
            Connection con = getConn();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            System.out.println("Rows Deleted: " + rows);
        }
    }

    // =========================
    // GET SINGLE EMPLOYEE
    // =========================
    public Employee getEmployee(int id) throws Exception {

        String sql = "SELECT * FROM Employee WHERE Empno=?";
        Employee e = null;

        try (
            Connection con = getConn();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                e = new Employee();

                e.setEmpno(rs.getInt("Empno"));
                e.setEmpName(rs.getString("EmpName"));
                e.setDoj(rs.getDate("DoJ"));
                e.setGender(rs.getString("Gender"));
                e.setBsalary(rs.getDouble("Bsalary"));
            }
        }

        return e;
    }

    // =========================
    // GET ALL EMPLOYEES
    // =========================
    public List<Employee> getAll() throws Exception {

        List<Employee> list = new ArrayList<>();

        String sql = "SELECT * FROM Employee";

        try (
            Connection con = getConn();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {
                Employee e = new Employee();

                e.setEmpno(rs.getInt("Empno"));
                e.setEmpName(rs.getString("EmpName"));
                e.setDoj(rs.getDate("DoJ"));
                e.setGender(rs.getString("Gender"));
                e.setBsalary(rs.getDouble("Bsalary"));

                list.add(e);
            }
        }

        return list;
    }

    // =========================
    // REPORT 1: NAME STARTS WITH
    // =========================
    public List<Employee> nameStarts(String letter) throws Exception {
        return getByQuery(
            "SELECT * FROM Employee WHERE EmpName LIKE ?",
            letter + "%"
        );
    }

    // =========================
    // REPORT 2: EXPERIENCE
    // =========================
    public List<Employee> experience(int years) throws Exception {
        return getByQuery(
            "SELECT * FROM Employee WHERE TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ?",
            years
        );
    }

    // =========================
    // REPORT 3: SALARY GREATER THAN
    // =========================
    public List<Employee> salary(double sal) throws Exception {
        return getByQuery(
            "SELECT * FROM Employee WHERE Bsalary > ?",
            sal
        );
    }

    // =========================
    // COMMON REPORT METHOD
    // =========================
    private List<Employee> getByQuery(String sql, Object param) throws Exception {

        List<Employee> list = new ArrayList<>();

        try (
            Connection con = getConn();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            if (param instanceof String) {
                ps.setString(1, (String) param);
            }
            else if (param instanceof Integer) {
                ps.setInt(1, (Integer) param);
            }
            else if (param instanceof Double) {
                ps.setDouble(1, (Double) param);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee e = new Employee();

                e.setEmpno(rs.getInt("Empno"));
                e.setEmpName(rs.getString("EmpName"));
                e.setDoj(rs.getDate("DoJ"));
                e.setGender(rs.getString("Gender"));
                e.setBsalary(rs.getDouble("Bsalary"));

                list.add(e);
            }
        }

        return list;
    }
}