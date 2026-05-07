package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        res.getWriter().println("Use form to generate reports.");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            String type = req.getParameter("type");

            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> list = new ArrayList<>();

            // Report by Employee ID
            if (type.equals("empid")) {

                int empno = Integer.parseInt(req.getParameter("empno"));

                Employee emp = dao.getEmployee(empno);

                if (emp != null) {
                    list.add(emp);
                }
            }

            // Report by Name Starts With
            else if (type.equals("name")) {

                String letter = req.getParameter("letter");

                list = dao.nameStarts(letter);
            }

            // Report by Experience
            else if (type.equals("exp")) {

                int years = Integer.parseInt(req.getParameter("years"));

                list = dao.experience(years);
            }

            // Report by Salary
            else if (type.equals("salary")) {

                double sal =
                        Double.parseDouble(req.getParameter("salary"));

                list = dao.salary(sal);
            }

            req.setAttribute("list", list);

            RequestDispatcher rd =
                    req.getRequestDispatcher("report_result.jsp");

            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}