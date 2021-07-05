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
import DAO.DanhmucDAO;
import DB.DBConnection;

@WebServlet("/DeleteCategoryController")
public class DeleteCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String categoryidstr = request.getParameter("categoryid");
		int categoryid = Integer.parseInt(categoryidstr);
		DanhmucDAO.DeleteNewsByCategoryid(conn, categoryid);
		DanhmucDAO.DeleteDanhmuc(conn, categoryid);
		List<DanhMuc> list = DanhmucDAO.DisplayDanhmuc(conn);		
		request.setAttribute("listdanhmuc", list);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/CategoryAdmin.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
