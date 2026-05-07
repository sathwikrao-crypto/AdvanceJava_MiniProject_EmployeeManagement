package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    // STEP 1 : Search employee by ID
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            String empnoStr = req.getParameter("empno");

            if (empnoStr != null && !empnoStr.isEmpty()) {

                int empno = Integer.parseInt(empnoStr);

                EmployeeDAO dao = new EmployeeDAO();
                Employee emp = dao.getEmployee(empno);

                req.setAttribute("emp", emp);
            }

            RequestDispatcher rd =
                    req.getRequestDispatcher("empupdate.jsp");

            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }

    // STEP 2 : Update all fields
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            Employee e = new Employee();

            e.setEmpno(Integer.parseInt(req.getParameter("empno")));
            e.setEmpName(req.getParameter("name"));
            e.setDoj(Date.valueOf(req.getParameter("doj")));
            e.setGender(req.getParameter("gender"));
            e.setBsalary(Double.parseDouble(req.getParameter("salary")));

            EmployeeDAO dao = new EmployeeDAO();
            dao.updateEmployee(e);

            res.sendRedirect("DisplayEmployeeServlet");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}