package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.User;
import DAO.AdminDAO;
import DB.DBConnection;


@WebServlet("/DeleteManage")
public class DeleteManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection();
		String usersididstr = request.getParameter("usersid");
		int usersid = Integer.parseInt(usersididstr);
		AdminDAO.DeleteUser(conn, usersid);
		List<User> lists = AdminDAO.SelectUsers(conn);
		request.setAttribute("listAdmin",lists);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ManageAdmin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
