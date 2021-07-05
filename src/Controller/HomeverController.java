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


@WebServlet("/HomeverController")
public class HomeverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public HomeverController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    Connection conn = DBConnection.CreateConnection();
	        String pageidstr = request.getParameter("pageid");
			int pageid =Integer.parseInt(pageidstr);	
			int count = 10;		
			List<News> list = HomeDAO.Pagination(pageid, count, conn);
			int sumrow = HomeDAO.Countrow(conn);
			int maxpageid;
		    if(sumrow % count == 0) {
		    	 maxpageid = (sumrow/count);
		    }
		    else {
		    	 maxpageid = (sumrow/count)+1;
		    }
		    int dem = sumrow - 5;
			List<News> lists = HomeDAO.ListBySize(dem, sumrow, conn);
			request.setAttribute("NewsMoi",lists);
			request.setAttribute("maxpageid",maxpageid);
			request.setAttribute("numberpage",pageid);
			request.setAttribute("listHomeNews",list);
			List<DanhMuc> listdanhmuc = DanhmucDAO.DisplayDanhmuc(conn);
			request.setAttribute("listdanhmuc", listdanhmuc);
			
			RequestDispatcher rd = request.getRequestDispatcher("View/Home.jsp");
			rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
