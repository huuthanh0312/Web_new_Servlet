package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.News;

public class HomeDAO {
	// select phan trang
	public static List<News> Pagination(int start, int count, Connection conn)
	{   int PageSize = count * start; 
	    int PageNo = ((start-1) * count) +1;
	    PreparedStatement dc= null;
		List<News> list = new ArrayList<News>();
		String sql = "select * from  (select *, row_number() over ( order by newsid) as id from NEWS )T where T.id between "+(PageNo)+" and "+(PageSize)+"";
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
		    	  
		    	  news.setNewsid(newsid);
		    	  news.setCategoryid(categoryid);
		    	  news.setTieude(tieude);
		    	  news.setMota(mota);
		    	  news.setNoidung(noidung);
		    	  news.setDate(date);
		    	  news.setImg(img);
		    	  
		    	list.add(news);
		     }
		     dc.close();
		     rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// phân trang cuoi csdl * hang
	public static List<News> ListBySize(int start, int count, Connection conn)
	{  
	    PreparedStatement dc= null;
		List<News> list = new ArrayList<News>();
		String sql = "select * from  (select *, row_number() over ( order by newsid) as id from NEWS )T where T.id between "+(start)+" and "+(count)+"";
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
		    	  
		    	  news.setNewsid(newsid);
		    	  news.setCategoryid(categoryid);
		    	  news.setTieude(tieude);
		    	  news.setMota(mota);
		    	  news.setNoidung(noidung);
		    	  news.setDate(date);
		    	  news.setImg(img);
		    	  
		    	list.add(news);
		     }
		     dc.close();
		     rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//dem tong so cot trong bang NEWS
	public static int Countrow(Connection conn)
	{
		int count = 0;	
		String sql = "select count(*) from NEWS";
		
		try 
		{
			PreparedStatement ptmt = conn.prepareStatement(sql);			
			ResultSet rs = ptmt.executeQuery();			
			rs.next();			
			count = rs.getInt(1);							
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return count;
	}
	//dem tong so cot trong bang NEWS theo categoty
	public static int CountrowByC(int id,Connection conn)
	{
		int count = 0;	
		String sql = "select count(*) from NEWS where categoryid="+id+"";
		
		try 
		{
			PreparedStatement ptmt = conn.prepareStatement(sql);			
			ResultSet rs = ptmt.executeQuery();			
			rs.next();			
			count = rs.getInt(1);							
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return count;
	}
	//in theo id danh muc header truyen toi
	public static List<News> SelectNewsByDanhMuc( int id , int start, int count,Connection conn) {
		int PageSize = count * start; 
	    int PageNo = ((start-1) * count) +1;
		List<News> listsid = new ArrayList<News>();
		PreparedStatement dc = null;
		String sql = "select * from  (select *, row_number() over ( order by newsid) as id from NEWS where "
				+ "categoryid="+(id)+" )T where T.id between "+ (PageNo) + " and " + (PageSize) + "";
		try {
			dc = conn.prepareStatement(sql);
			ResultSet rs = dc.executeQuery();
			while (rs.next()) {
				News news = new News();
				int newsid = rs.getInt("newsid");
				int categoryid = rs.getInt("categoryid");
				String tieude = rs.getString("tieude");
				String mota = rs.getString("mota");
				String noidung = rs.getString("noidung");
				Date date = rs.getDate("date");
				String img = rs.getString("img");

				news.setNewsid(newsid);
				news.setCategoryid(categoryid);
				news.setTieude(tieude);
				news.setMota(mota);
				news.setNoidung(noidung);
				news.setDate(date);
				news.setImg(img);

				listsid.add(news);
			}
			dc.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listsid;
	}

	// select noi dung bài theo id do
	public static String SelectNewsByNoiDung(Connection conn, int newsid) {
		String noidung = "";
		String sql = "select noidung from NEWS where newsid=" + newsid + "";
		try {
			PreparedStatement dc = conn.prepareStatement(sql);
			ResultSet rs = dc.executeQuery();
			while (rs.next()) {
				noidung = rs.getString("noidung");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noidung;
	  }
	// tim kiem
	public static List<News> Search (HttpServletRequest request,Connection conn, String name)
	{
		List<News> list = new ArrayList<News>();

		String sql = "select  * from NEWS where tieude like '%" + name + "%'";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				request.setAttribute("ketqua", "Không Thấy Kết Quả Tìm Kiếm- Vui Lòng Thử Lại");
			} else {
				while (rs.next()) {
					News news = new News();
					int newsid = rs.getInt("newsid");
					int categoryid = rs.getInt("categoryid");
					String tieude = rs.getString("tieude");
					String mota = rs.getString("mota");
					String noidung = rs.getString("noidung");
					Date date = rs.getDate("date");
					String img = rs.getString("img");

					news.setNewsid(newsid);
					news.setCategoryid(categoryid);
					news.setTieude(tieude);
					news.setMota(mota);
					news.setNoidung(noidung);
					news.setDate(date);
					news.setImg(img);

					list.add(news);
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
}
