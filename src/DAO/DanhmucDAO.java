package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.DanhMuc;

public class DanhmucDAO {
	public static List<DanhMuc> DisplayDanhmuc(Connection conn) {
		  List<DanhMuc> list = new ArrayList<DanhMuc>();
		
		  PreparedStatement dc= null;
		  String sql = "select * from DANHMUC";
		  try {
			   
		     dc = conn.prepareStatement(sql);
		     ResultSet rs = dc.executeQuery();
		
		     while(rs.next()) {
		    	 DanhMuc danhmuc = new DanhMuc();
		          int categoryid= rs.getInt("categoryid");
		    	  String categoryname = rs.getString("categoryname");
		    	 
		    	 danhmuc.setCategoryid(categoryid);
		    	 danhmuc.setCategoryname(categoryname);
		    	  
		    	list.add(danhmuc);
		     }
		     dc.close();
		     rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	  }
	 public static boolean InSertDanhMuc(Connection conn, DanhMuc s) {
		  PreparedStatement dc= null;
		  String sql = "insert into DANHMUC(categoryname) values (?)";
		  try {  
		     dc = conn.prepareStatement(sql);
		     String categoryname = s.getCategoryname();
		     
		     dc.setString(1,categoryname);
		     int kt = dc.executeUpdate();
			  if(kt!=0)
			  {
				  return true;
			  }
		   
		     dc.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	  }
	   //xoa danh muc
		 public static void DeleteDanhmuc(Connection conn, int categoryid)
				{
					String sql = "delete from DANHMUC where categoryid="+categoryid;
					try 
					{
						PreparedStatement ptmt = conn.prepareStatement(sql);
						
						ptmt.executeUpdate();
						
						
						ptmt.close();
					} 
					catch (SQLException e) 
					{

						e.printStackTrace();
					}
				}
		 public static void DeleteNewsByCategoryid(Connection conn, int categoryid)
			{
				String sql = "delete from NEWS where categoryid="+categoryid;
				try 
				{
					PreparedStatement ptmt = conn.prepareStatement(sql);
					
					ptmt.executeUpdate();
					
					
					ptmt.close();
				} 
				catch (SQLException e) 
				{

					e.printStackTrace();
				}
			}
		 // in ra danh sach danh muc theo id
		 public static List<DanhMuc> SelectDanhmucByID(Connection conn , int id) {
			  List<DanhMuc> listdmid = new ArrayList<DanhMuc>();
			  PreparedStatement dc= null;
			  String sql = "select * from DANHMUC where categoryid="+id+"";
			  try {   
			     dc = conn.prepareStatement(sql);
			     ResultSet rs = dc.executeQuery();		
			     while(rs.next()) {
			    	 DanhMuc danhmuc = new DanhMuc();
			    	 String categoryname = rs.getString("categoryname");
			    	 danhmuc.setCategoryname(categoryname);  
			    	listdmid.add(danhmuc);
			     }
			     dc.close();
			     rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return listdmid; 
		  }
			//update  cho danh muc dua theo id cua danh muc do
		 public static boolean UpdateDanhmuc(HttpServletRequest request, Connection conn,DanhMuc s , int categoryid)
			{   
				PreparedStatement dc = null;			
				String sql = "update NEWS set categoryname=? where categoryid="+categoryid+"";
				try 
				{
					dc = conn.prepareStatement(sql);
					String categoryname = s.getCategoryname();		 					
					dc.setString(1, categoryname);					
					dc.executeUpdate();
					int kt = dc.executeUpdate();
					  if(kt!=0)
					  {
						  return true;
					  }
				     dc.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					  return false;
			}
}
