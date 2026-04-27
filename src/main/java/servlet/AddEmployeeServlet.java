package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    // When user opens URL directly
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        res.getWriter().println("Use form to add employee.");
    }

    // When form is submitted
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            System.out.println("AddEmployeeServlet Hit");

            Employee e = new Employee();

            // Empno removed because AUTO_INCREMENT is enabled

            e.setEmpName(req.getParameter("name"));
            e.setDoj(Date.valueOf(req.getParameter("doj")));
            e.setGender(req.getParameter("gender"));
            e.setBsalary(Double.parseDouble(req.getParameter("salary")));

            EmployeeDAO dao = new EmployeeDAO();
            dao.addEmployee(e);

            res.sendRedirect("DisplayEmployeeServlet");

        } catch (Exception ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }
    }
}