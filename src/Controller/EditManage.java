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


@WebServlet("/EditManage")
public class EditManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditManage() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection();
		String usersidstr = request.getParameter("usersid");
		int usersid = Integer.parseInt(usersidstr);
		request.setAttribute("usersid", usersid);
		List<User> lists = AdminDAO.SelectByUserID(conn, usersid);
		request.setAttribute("listAdmin",lists);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditManageAdmin.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	Connection conn = DBConnection.CreateConnection();
	if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
		request.setCharacterEncoding("UTF-8");
	String usersididstr = request.getParameter("usersid");
	int usersid = Integer.parseInt(usersididstr);
	try {
		String username  = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setFullname(fullname);
	 boolean kt =AdminDAO.UpdateUser(request, conn, user, usersid);
	    if(kt) {	  
			 try {
				 
				    List<User> lists = AdminDAO.SelectUsers(conn);
					request.setAttribute("listAdmin",lists);
					RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ManageAdmin.jsp");
					rd.forward(request, response);
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 }
		  else {
			  request.setAttribute("msgeditadmin", "Edit Failed");
			  List<User> lists = AdminDAO.SelectByUserID(conn, usersid);
				request.setAttribute("listAdmin",lists);
				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditManageAdmin.jsp");
				rd.forward(request, response);
			 
		  }
	    }catch (Exception e) {
			// TODO: handle exception
		}
	} 
}
