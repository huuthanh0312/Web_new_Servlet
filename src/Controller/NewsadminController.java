package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.News;
import DAO.NewsDAO;
import DB.DBConnection;


@WebServlet("/NewsadminController")
public class NewsadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public NewsadminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection();
		if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
			request.setCharacterEncoding("UTF-8");	
		try {
		  String tieude = request.getParameter("tieude");
		  String categorystr = request.getParameter("categoryid");
		  int categoryid = Integer.parseInt(categorystr);
		  String mota = request.getParameter("mota");
		  String noidung = request.getParameter("noidung");
		  SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");
		  Date date =dd.parse(request.getParameter("date"));
		
		  News s = new News();
		  s.setTieude(tieude);
		  s.setCategoryid(categoryid);
		  s.setMota(mota);;
		  s.setNoidung(noidung); 
	   	  s.setDate(date);
		  
		  boolean kt = NewsDAO.InSertNews(conn, s);	
		  
		  if(kt) {
			  
			 try {				
				 RequestDispatcher rd = request.getRequestDispatcher("NewsadminForward?pageid=1");
				 rd.forward(request, response);
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 }
		  else {
			  request.setAttribute("msgnews", "Insert Failed");
			  RequestDispatcher rd = request.getRequestDispatcher("View/Admin/NewsAdmin.jsp");
			  rd.forward(request, response);
		  }
	    } catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	   }
	}
}
