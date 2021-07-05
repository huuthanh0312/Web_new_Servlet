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
import DAO.DanhmucDAO;
import DAO.HomeDAO;
import DB.DBConnection;


@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
			request.setCharacterEncoding("UTF-8");
		String tieude = request.getParameter("tieude");
		request.setAttribute("search", tieude);
		List<News> list = HomeDAO.Search(request, conn, tieude);
		request.setAttribute("listsearch",list);
		
		int sumrow = HomeDAO.Countrow(conn);
		int dem = sumrow - 5;
		List<News> listss = HomeDAO.ListBySize(dem, sumrow, conn);
		request.setAttribute("NewsMoi",listss);
		
		List<DanhMuc> lists = DanhmucDAO.DisplayDanhmuc(conn);		
		request.setAttribute("listdanhmuc", lists);
		
		RequestDispatcher rd = request.getRequestDispatcher("View/Search.jsp");
		rd.forward(request,response);
	}

}
