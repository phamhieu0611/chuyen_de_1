package servlet;

import dao.DepartmentDao;
import dao.EmployeeDao;
import entities.Department;
import entities.Employee;
import utils.Log4J;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * class handle list Employee
 * 
 * @author FA
 *
 */
@WebServlet("/list-employees")
public class ListEmployeesServlet extends HttpServlet {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private EmployeeDao employeeDao = new EmployeeDao();
    private DepartmentDao departmentDao = new DepartmentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Employee> listOfEmployee = employeeDao.findAllEmployee();
            List<Department> listOfDepartment = departmentDao.findAllDepartment();
            request.setAttribute("listOfEmployee", listOfEmployee);
            request.setAttribute("listOfDepartment", listOfDepartment);
            request.getRequestDispatcher("/views/list-employees.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            Log4J.getLogger().error(e.getMessage());
        }

    }
}
