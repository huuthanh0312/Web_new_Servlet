package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.User;
import DAO.AdminDAO;
import DB.DBConnection;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("View/Login.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);

		int adminid = AdminDAO.GetIDbyAdmin(request, conn, user);
		String test = AdminDAO.CheckLogin(request, conn, user);
		if (test.equals("success")) {
			if (adminid == 1) {
				HttpSession session = request.getSession(true);
				session.setAttribute("sessionadmin", username);
				RequestDispatcher rd = request.getRequestDispatcher("AdminForward?pageid=1");
				rd.forward(request, response);
			}
			if (adminid == 2) {
				HttpSession session = request.getSession(true);
				session.setAttribute("sessionadmin", username);
				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/MemberAdmin.jsp");
				rd.forward(request, response);
			}
		} else {
			request.setAttribute("msglogin", "Tên Hoặc Mật Khẩu Sai");
			RequestDispatcher rd = request.getRequestDispatcher("View/Login.jsp");
			rd.forward(request, response);
		}
	}

}
