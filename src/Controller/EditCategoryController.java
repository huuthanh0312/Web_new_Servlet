package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
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


@WebServlet("/EditCategoryController")
public class EditCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		String categoryidstr = request.getParameter("categoryid");
		int categoryid = Integer.parseInt(categoryidstr);	
		request.setAttribute("categoryid", categoryid);
		
		List<DanhMuc> listdmid = DanhmucDAO.SelectDanhmucByID(conn, categoryid);
		request.setAttribute("listdmbyid", listdmid);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditCategoryAdmin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
			request.setCharacterEncoding("UTF-8");
		String categoryidstr = request.getParameter("categoryid");
		int categoryid = Integer.parseInt(categoryidstr);
		try {
		  String categoryname = request.getParameter("categoryname");		
		  DanhMuc s = new DanhMuc();
		 s.setCategoryname(categoryname);
		 boolean kt =DanhmucDAO.UpdateDanhmuc(request, conn, s, categoryid);
		    if(kt) {	  
				 try {
					 
					 List<DanhMuc> list = DanhmucDAO.DisplayDanhmuc(conn);				
					 request.setAttribute("listdanhmuc", list);
					 
					 RequestDispatcher rd = request.getRequestDispatcher("View/Admin/CategoryAdmin.jsp");
					 rd.forward(request, response);
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				 }
			  else {
				  request.setAttribute("msgeditdanhmuc", "Edit Failed");
				  List<DanhMuc> listdmid = DanhmucDAO.SelectDanhmucByID(conn, categoryid);
				  request.setAttribute("listdmbyid", listdmid);
				  RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditCategoryAdmin.jsp");
				  rd.forward(request, response);
				 
			  }
		    }catch (Exception e) {
				// TODO: handle exception
			}
		} 
}
