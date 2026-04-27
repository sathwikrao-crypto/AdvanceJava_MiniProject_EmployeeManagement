package servlet;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        res.getWriter().println("Use form to update employee.");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            System.out.println("UpdateEmployeeServlet hit");

            Employee e = new Employee();
            e.setEmpno(Integer.parseInt(req.getParameter("empno")));
            e.setEmpName(req.getParameter("name"));
            e.setDoj(Date.valueOf(req.getParameter("doj")));
            e.setGender(req.getParameter("gender"));
            e.setBsalary(Double.parseDouble(req.getParameter("salary")));

            new EmployeeDAO().updateEmployee(e);

            res.sendRedirect("DisplayEmployeeServlet");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}