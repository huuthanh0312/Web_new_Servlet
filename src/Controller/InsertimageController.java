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


@WebServlet("/InsertimageController")
public class InsertimageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InsertimageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newsidstr = request.getParameter("newsid");
		int newsid = Integer.parseInt(newsidstr);	
		request.setAttribute("newsid", newsid);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Uploadimage.jsp");
		rd.forward(request,response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String newsidstr = request.getParameter("newsid");
		int newsid = Integer.parseInt(newsidstr);
		String test = NewsDAO.Uploadimage(conn, request, response, newsid);
		if (test.equals("Success"))
		{   			
			RequestDispatcher rd = request.getRequestDispatcher("NewsadminForward?pageid=1");
			rd.forward(request, response);
		}
		else 
		{
			request.setAttribute("msgimage",test);
	    	RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Uploadimage.jsp");
			rd.forward(request,response);		 
		}
		
	}

}
