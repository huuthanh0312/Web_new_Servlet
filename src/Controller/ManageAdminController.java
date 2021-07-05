package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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


@WebServlet("/ManageAdminController")
public class ManageAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ManageAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection();
		List<User> lists = AdminDAO.SelectUsers(conn);
		request.setAttribute("listAdmin",lists);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ManageAdmin.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
			request.setCharacterEncoding("UTF-8");

		String username  = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setFullname(fullname);
		boolean test = AdminDAO.InSertUsser(request, conn, user );
		if(test)
		{
			try {
				request.setAttribute("msgregister","ĐĂNG KÍ THÀNH CÔNG");
				List<User> lists = AdminDAO.SelectUsers(conn);
				request.setAttribute("listAdmin",lists);
				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ManageAdmin.jsp");
				rd.forward(request, response);
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {
			request.setAttribute("msgregister","ĐĂNG KÍ KHÔNG THÀNH CÔNG");
					
			}
	}

}
