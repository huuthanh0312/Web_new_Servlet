package DAO;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import BEAN.News;



public class NewsDAO {
	// in danh sach bai tin tuc
	public static List<News> SelectNews(Connection conn) {
		  List<News> lists = new ArrayList<News>();
		  PreparedStatement dc= null;
		  String sql = "select * from NEWS";
		  try {   
		     dc = conn.prepareStatement(sql);
		     ResultSet rs = dc.executeQuery();		
		     while(rs.next()) {
		    	 News news = new News();
		    	  int newsid= rs.getInt("newsid");
				  String tieude = rs.getString("tieude");
				  String mota = rs.getString("mota");
				  String noidung = rs.getString("noidung");
				  Date date= rs.getDate("date");	  
				  String img = rs.getString("img");
		    	  
		    	  news.setNewsid(newsid);
		    	  news.setTieude(tieude);
		    	  news.setMota(mota);
		    	  news.setNoidung(noidung);
		    	  news.setDate(date);
		    	  news.setImg(img);
		    	  
		    	lists.add(news);
		     }
		     dc.close();
		     rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists; 
	  }
	//Them bai tin tuc
	 public static boolean InSertNews(Connection conn, News s) {
		  PreparedStatement dc= null;
		  String sql = "insert into NEWS(tieude,categoryid,mota,noidung,date) values (?,?,?,?,?)";
		  try {   
		  dc = conn.prepareStatement(sql);
		 
		  String tieude = s.getTieude();
		  int categoryid= s.getCategoryid();
		  String mota = s.getMota();
		  String noidung = s.getNoidung();
		  Date date= s.getDate();		  
		  //String img = s.getImg();
		 
		  dc.setString(1,tieude);
		  dc.setInt(2,categoryid );
		  dc.setString(3, mota);
		  dc.setString(4,noidung);
		  dc.setDate(5,new java.sql.Date(date.getTime()));
		 // dc.setString(6,img);
		  
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
	//ham them file anh cua bai tin tuc
	 public static String Uploadimage(Connection conn, HttpServletRequest request, HttpServletResponse response, int newsid) 
				throws ServletException, IOException 
		{
			String test = "";
			ServletContext context = request.getServletContext();
			response.setContentType("text/html; charset=UTF-8");		
			final String Address = context.getRealPath("Imageupload/");
			final int MaxMemorySize = 1024 * 1024 * 3; //3MB
			final int MaxRequestSize = 1024 * 1024 * 50; //50 MB
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if (!isMultipart)
			{
				test = "Thieu multipart/form-data trong form";
			}
			
			DiskFileItemFactory factory = new DiskFileItemFactory();		
			// Set factory constraints
			factory.setSizeThreshold(MaxMemorySize);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// Set overall request size constraint
			upload.setSizeMax(MaxRequestSize);
			try 
			{
				// Parse the request
				List<FileItem> items = upload.parseRequest(request);		
				// Process the uploaded items
				Iterator<FileItem> iter = items.iterator();	
				while (iter.hasNext()) 
				{
				    FileItem item = iter.next();
				    if (!item.isFormField()) 
				    {
				    	String fileName = item.getName(); 
				    	String pathFile = Address + File.separator + fileName;		    	 
				    	File uploadedFile = new File(pathFile);
				    	boolean kt = uploadedFile.exists();  	 
				    	try 
				    	{		    		
				    		if (kt == true)
				    		{			    
				    			test = "file trung lap. Yeu cau chon file khac";
				    		}
				    		else
				    		{		    			
				    			item.write(uploadedFile);
				    			NewsDAO.Insertimage(request, conn, fileName, newsid);
				    			test="Success";
				    		}
						} 
				    	catch (Exception e) 
				    	{			    		
				    		test = e.getMessage();
						}   	 
				    } 
				    else 
				    {
				    	test ="Failed";
				    }
				}
			} 
			catch (FileUploadException e) 
			{
				test = e.getMessage();
			}
			return test;
		}
		//update ten hinh cho bai tin tuc dua theo id cua bai do
	 public static void Insertimage(HttpServletRequest request, Connection conn,String img,int newsid)
		{
			PreparedStatement dc = null;			
			String sql = "update NEWS set img=? where newsid="+newsid;
			try 
			{
				dc = conn.prepareStatement(sql);
				dc.setString(1,img);
				
				dc.executeUpdate();
				
				dc.close();
			} 
			catch (SQLException e) 
			{
				request.setAttribute("msgimg",e.getMessage());
			}
		}
	//xoa bai tin tuc
	 public static void DeleteNews(Connection conn, int newsid)
			{
				String sql = "delete from NEWS where newsid="+newsid;
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
	 // in ra danh sach theo id
	 public static List<News> SelectNewsByID(Connection conn , int id) {
		  List<News> listsid = new ArrayList<News>();
		  PreparedStatement dc= null;
		  String sql = "select * from NEWS where newsid="+id+"";
		  try {   
		     dc = conn.prepareStatement(sql);
		     ResultSet rs = dc.executeQuery();		
		     while(rs.next()) {
		    	 News news = new News();
		    	  int newsid= rs.getInt("newsid");
		    	  int categoryid= rs.getInt("categoryid");
				  String tieude = rs.getString("tieude");
				  String mota = rs.getString("mota");
				  String noidung = rs.getString("noidung");
				  Date date= rs.getDate("date");	  
				  String img = rs.getString("img");
				  int usersid= rs.getInt("usersid");
		    	  
		    	  news.setNewsid(newsid);
		    	  news.setCategoryid(categoryid);
		    	  news.setTieude(tieude);
		    	  news.setMota(mota);
		    	  news.setNoidung(noidung);
		    	  news.setDate(date);
		    	  news.setImg(img);
		    	  news.setUsersid(usersid);
		    	  
		    	listsid.add(news);
		     }
		     dc.close();
		     rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listsid; 
	  }
		//update  cho bai tin tuc dua theo id cua bai do
	 public static boolean UpdateNews(HttpServletRequest request, Connection conn,News s , int newsid)
		{   
			PreparedStatement dc = null;			
			String sql = "update NEWS set  tieude=?, mota=?, noidung=?, date=? where newsid="+newsid+"";
			try 
			{
				dc = conn.prepareStatement(sql);
				  String tieude = s.getTieude();				  
				  String mota = s.getMota();
				  String noidung = s.getNoidung();
				  Date date= s.getDate();		  
				  //String img = s.getImg();
				  
				  dc.setString(1,tieude);
				  dc.setString(2, mota);
				  dc.setString(3,noidung);
				  dc.setDate(4,new java.sql.Date(date.getTime()));
				
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
