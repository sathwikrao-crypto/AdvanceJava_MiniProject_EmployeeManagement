package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            System.out.println("DisplayEmployeeServlet hit");

            List<Employee> list = new EmployeeDAO().getAll();

            req.setAttribute("list", list);
            req.getRequestDispatcher("empdisplay.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}