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

import BEAN.DanhMuc;
import BEAN.News;
import BEAN.User;
import DAO.AdminDAO;
import DAO.DanhmucDAO;
import DAO.HomeDAO;
import DAO.NewsDAO;
import DB.DBConnection;


@WebServlet("/ShowNewsController")
public class ShowNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ShowNewsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String newsidstr = request.getParameter("newsid");
		int newsid = Integer.parseInt(newsidstr);
		int sumrow = HomeDAO.Countrow(conn);
		int dem = sumrow - 5;
		List<News> lists = HomeDAO.ListBySize(dem, sumrow, conn);
		request.setAttribute("NewsMoi",lists);
		List<DanhMuc> list = DanhmucDAO.DisplayDanhmuc(conn);		
		request.setAttribute("listdanhmuc", list);
		List<User> listuser = AdminDAO.SelectbyUsers(conn);
		request.setAttribute("listUser", listuser);
		List<News> listsid = NewsDAO.SelectNewsByID(conn, newsid);
		request.setAttribute("listnewsbyid", listsid);
		String noidung = HomeDAO.SelectNewsByNoiDung(conn, newsid);
		request.setAttribute("noidung",noidung);
		request.setAttribute("kitutrongdb","\n");
		request.setAttribute("kitutronghtml","<br/>");
		
		RequestDispatcher rd = request.getRequestDispatcher("View/ShowNews.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
