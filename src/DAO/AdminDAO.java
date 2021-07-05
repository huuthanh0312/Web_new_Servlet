package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.User;

public class AdminDAO {
	//Dang nhap tai khoan admin
		public static String CheckLogin (HttpServletRequest request, Connection conn, User user) {
			  PreparedStatement dc= null;
			  String sql = "select username,password from [USER]";
			  
			  String test = "fail";
			  try {			   
			  dc = conn.prepareStatement(sql);
			  ResultSet rs = dc.executeQuery();
			  while(rs.next()) {
				  String username = rs.getString("username");
				  String password = rs.getString("password");
				  
				if(user.getUsername().equals(username) && user.getPassword().equals(password)) {
					test= "success";
				}
			  }  
		     dc.close();
		     rs.close();
			} catch (Exception e) {
				//e.printStackTrace();
				request.setAttribute("msglogin", e.getMessage());
			}
			 return test;
		  }
		//lay id danh muc admin
		public static int GetIDbyAdmin(HttpServletRequest request, Connection conn, User user)
		{
			PreparedStatement ptmt = null;
			
			String sql = "select adminid from [USER] where username='"+user.getUsername()+"' and password='"+user.getPassword()+"'";
			
			int adminid = 0;
			
			try 
			{
				ptmt = conn.prepareStatement(sql);
				
				
				ResultSet rs = ptmt.executeQuery();
				
				while (rs.next())
				{
					adminid = rs.getInt("adminid");		
				}
				
				ptmt.close();
				rs.close();
			} 
			catch (SQLException e) 
			{
				request.setAttribute("msglogin",e.getMessage());
			}
			
			return adminid;
		}
		//xuat ma admin theo username va password
		public static int Exportuserid(HttpServletRequest request, Connection conn, User user)
		{
			PreparedStatement ptmt = null;
			
			
			String sql = "select userid from [USER] where username='"+user.getUsername()+"' and password='"+user.getPassword()+"'";
			int userid = 0;
			
			try 
			{
				ptmt = conn.prepareStatement(sql);
				
				
				ResultSet rs = ptmt.executeQuery();
				
				while (rs.next())
				{
					userid = rs.getInt("userid");
				}
				
				ptmt.close();
				rs.close();
			} 
			catch (SQLException e) 
			{
				request.setAttribute("msglogin",e.getMessage());
			}
			
			return userid;
		}
		//Dang ki tai khoan admin
		public static boolean InSertUsser (HttpServletRequest request, Connection conn, User user) {
			  PreparedStatement dc= null;
			  String sql = "insert into [USER](username,password,fullname,adminid) values (?,?,?,'2')";
			  try {
				   
			  dc = conn.prepareStatement(sql);
			  String username = user.getUsername();
			  String password = user.getPassword();
			  String fullname = user.getFullname();
			  
			 dc.setString(1,username); 
			 dc.setString(2,password);
			 dc.setString(3,fullname);
			 int kt = dc.executeUpdate();
			  if(kt!=0)
			  {
				  return true;
			  }
		     dc.close();
			} catch (Exception e) {
				//e.printStackTrace();
				request.setAttribute("msgregister", e.getMessage());
			}
			  return false;
		  }
	// in danh sach admin
		public static List<User> SelectUsers(Connection conn) {
			  List<User> list = new ArrayList<User>();
			  PreparedStatement dc= null;
			  String sql = "select * from [USER] where adminid='2'";
			  try {   
			     dc = conn.prepareStatement(sql);
			     ResultSet rs = dc.executeQuery();		
			     while(rs.next()) {
			    	 User user = new User();
			    	  int usersid = rs.getInt("usersid");
			    	  String username= rs.getString("username");
			    	  String password= rs.getString("password");
			    	  String fullname= rs.getString("fullname");
			    	  
			    	  
			    	  user.setUsersid(usersid);
			    	  user.setUsername(username);
			    	  user.setPassword(password);
			    	  user.setFullname(fullname);
			    	list.add(user);
			     }
			     dc.close();
			     rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; 
		  }
		// in danh sach admin
				public static List<User> SelectbyUsers(Connection conn) {
					  List<User> list = new ArrayList<User>();
					  PreparedStatement dc= null;
					  String sql = "select * from [USER] ";
					  try {   
					     dc = conn.prepareStatement(sql);
					     ResultSet rs = dc.executeQuery();		
					     while(rs.next()) {
					    	 User user = new User();
					    	  int usersid = rs.getInt("usersid");
					    	  String username= rs.getString("username");
					    	  String password= rs.getString("password");
					    	  String fullname= rs.getString("fullname");
					    	  
					    	  
					    	  user.setUsersid(usersid);
					    	  user.setUsername(username);
					    	  user.setPassword(password);
					    	  user.setFullname(fullname);
					    	list.add(user);
					     }
					     dc.close();
					     rs.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					return list; 
				  }
		//xoa tai khoan
		 public static void DeleteUser(Connection conn, int usersid)
				{
					String sql = "delete from [USER] where usersid="+usersid;
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
		// in danh sach admin theo id
			public static List<User> SelectByUserID(Connection conn, int id) {
				  List<User> list = new ArrayList<User>();
				  PreparedStatement dc= null;
				  String sql = "select * from [USER] where usersid="+id+"";
				  try {   
				     dc = conn.prepareStatement(sql);
				     ResultSet rs = dc.executeQuery();		
				     while(rs.next()) {
				    	 User user = new User();
				    	  int usersid = rs.getInt("usersid");
				    	  String username= rs.getString("username");
				    	  String password= rs.getString("password");
				    	  String fullname= rs.getString("fullname");
				    	  
				    	  
				    	  user.setUsersid(usersid);
				    	  user.setUsername(username);
				    	  user.setPassword(password);
				    	  user.setFullname(fullname);
				    	list.add(user);
				     }
				     dc.close();
				     rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return list; 
			  }
			//update  cho tai khoan dua theo id cua tai khoan do
		 public static boolean UpdateUser(HttpServletRequest request, Connection conn,User user , int usersid)
			{   
				PreparedStatement dc = null;			
				String sql = "update [USER] set username=? ,password=? ,fullname=? where usersid="+usersid+"";
				try 
				{
					dc = conn.prepareStatement(sql);
					String username = user.getUsername();
					String password = user.getPassword();
					String fullname = user.getFullname();
					
					dc.setString(1, username);
					dc.setString(2, password);
					dc.setString(3, fullname);
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
