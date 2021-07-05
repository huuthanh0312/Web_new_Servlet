package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.DanhMuc;
import BEAN.News;
import DAO.DanhmucDAO;
import DAO.NewsDAO;
import DB.DBConnection;


@WebServlet("/EditNewsController")
public class EditNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditNewsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String newsidstr = request.getParameter("newsid");
		int newsid = Integer.parseInt(newsidstr);	
		request.setAttribute("newsid", newsid);
		
		List<DanhMuc> list = DanhmucDAO.DisplayDanhmuc(conn);		
		request.setAttribute("listdanhmuc", list); 
		List<News> listsid = NewsDAO.SelectNewsByID(conn, newsid);
		request.setAttribute("listnewsbyid", listsid);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditNewsAdmin.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
			request.setCharacterEncoding("UTF-8");
		String newsidstr = request.getParameter("newsid");
		int newsid = Integer.parseInt(newsidstr);
		try {
		  String tieude = request.getParameter("tieude");		 
		  String mota = request.getParameter("mota");
		  String noidung = request.getParameter("noidung");
		  SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");
		  Date date =dd.parse(request.getParameter("date"));
		
		  News s = new News();
		  s.setTieude(tieude);		 
		  s.setMota(mota);
		  s.setNoidung(noidung); 
	   	  s.setDate(date);
		
	   	boolean kt =NewsDAO.UpdateNews(request, conn, s , newsid);
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
			  request.setAttribute("msgeditnews", "Edit Failed");
			  List<DanhMuc> list = DanhmucDAO.DisplayDanhmuc(conn);		
			  request.setAttribute("listdanhmuc", list);
			  List<News> listsid = NewsDAO.SelectNewsByID(conn, newsid);
			  request.setAttribute("listnewsbyid", listsid);
			  RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditNewsAdmin.jsp");
			  rd.forward(request, response); 
		  }
	    }catch (Exception e) {
			// TODO: handle exception
		}
	}
}
