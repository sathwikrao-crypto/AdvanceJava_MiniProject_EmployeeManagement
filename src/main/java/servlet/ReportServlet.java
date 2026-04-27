package servlet;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

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
            System.out.println("ReportServlet hit");

            String type = req.getParameter("type");
            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> list = new ArrayList<>();

            if (type.equals("name")) {
                list = dao.nameStarts(req.getParameter("letter"));
            } else if (type.equals("exp")) {
                list = dao.experience(Integer.parseInt(req.getParameter("years")));
            } else {
                list = dao.salary(Double.parseDouble(req.getParameter("salary")));
            }

            req.setAttribute("list", list);
            req.getRequestDispatcher("report_result.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}