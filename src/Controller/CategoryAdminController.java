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


@WebServlet("/CategoryAdminController")
public class CategoryAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CategoryAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection();
		List<DanhMuc> list = DanhmucDAO.DisplayDanhmuc(conn);		
		request.setAttribute("listdanhmuc", list);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/CategoryAdmin.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection(); 
		if (request.getCharacterEncoding() == null)    // insert tieng viet tu form
			request.setCharacterEncoding("UTF-8");
		
			  String categoryname = request.getParameter("categoryname");	  
			  DanhMuc d = new DanhMuc();	
			  d.setCategoryname(categoryname);
		  boolean kt = DanhmucDAO.InSertDanhMuc(conn, d);
		  if(kt) {
			  
			 try {
				 request.setAttribute("msgdanhmuc", "Insert Success");				 
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
			    request.setAttribute("msgdanhmuc", "Insert Failed");
			    RequestDispatcher rd = request.getRequestDispatcher("View/Admin/CategoryAdmin.jsp");
			    rd.forward(request, response);
		       }
		  
			
	}
}

