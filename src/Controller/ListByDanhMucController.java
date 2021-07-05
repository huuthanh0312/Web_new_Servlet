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


@WebServlet("/ListByDanhMucController")
public class ListByDanhMucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ListByDanhMucController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String categoryidstr = request.getParameter("categoryid");
		int categoryid = Integer.parseInt(categoryidstr);
		request.setAttribute("categoryid", categoryid);
		String pageidstr = request.getParameter("pageid");
	    int pageid =Integer.parseInt(pageidstr);	
	    int count = 10;	
	    List<News> list = HomeDAO.SelectNewsByDanhMuc(categoryid, pageid, count, conn);
		request.setAttribute("listNewsByDanhMuc", list);
		int sumrow1 = HomeDAO.Countrow(conn);
		int sumrow2 = HomeDAO.CountrowByC(categoryid, conn);
		int maxpageid;
	    if(sumrow2 % count == 0) {
	    	 maxpageid = (sumrow2/count);
	    }
	    else {
	    	 maxpageid = (sumrow2/count)+1;
	    }
	    request.setAttribute("maxpageid",maxpageid);
		request.setAttribute("numberpage",pageid);
	    
		int dem = sumrow1 - 9;
		List<News> lists = HomeDAO.ListBySize(dem, sumrow1, conn);
		request.setAttribute("NewsMoi", lists);
		List<DanhMuc> listdanhmuc = DanhmucDAO.DisplayDanhmuc(conn);
		request.setAttribute("listdanhmuc", listdanhmuc);

		RequestDispatcher rd = request.getRequestDispatcher("View/ListByDanhMuc.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
