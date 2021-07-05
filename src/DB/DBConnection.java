package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	

     public static Connection CreateConnection()  {
    	  
    	 Connection conn = null;
    	 String url = "jdbc:sqlserver://ADMIN:1433;databaseName=Webnews";
    	 String usersname = "sa";
    	 String password = "123";
    	 try {
    		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    		 
    		// cn=DriverManager.getConnection("jdbc:sqlserver://ADMIN:1433;databaseName=account;user=sa; password=123");
    		 conn = DriverManager.getConnection(url,usersname,password);

	      } catch(ClassNotFoundException e) {
	    	  e.printStackTrace();
	      }
    	 
    	 catch (SQLException e) {
			e.printStackTrace();
		}
    	
	    return conn;
    	
     }
}
