package dao;

import entities.Department;
import utils.DBUtil;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class DepartmentDao {

    public List<Department> findAllDepartment() throws ClassNotFoundException, IOException, SQLException {
        Connection connection = DBUtil.getConnection();
        CallableStatement callableStatement = connection.prepareCall("{call usp_findAllDepartment}");
        ResultSet resultSet = callableStatement.executeQuery();
        List<Department> listOfDepartment = new ArrayList<>();
        while (resultSet.next()) {
            int deptId = resultSet.getInt("Dept_ID");
            String deptName = resultSet.getString("Dept_Name");
            Department department = new Department(deptId, deptName);
            listOfDepartment.add(department);
        }
        DBUtil.closeConnection(connection);
        return listOfDepartment;
    }
}
