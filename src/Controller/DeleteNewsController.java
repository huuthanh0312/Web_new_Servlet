package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NewsDAO;
import DB.DBConnection;


@WebServlet("/DeleteNewsController")
public class DeleteNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteNewsController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String newsidstr = request.getParameter("newsid");
		int newsid = Integer.parseInt(newsidstr);
		NewsDAO.DeleteNews(conn, newsid);		
		RequestDispatcher rd = request.getRequestDispatcher("NewsadminForward?pageid=1");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
