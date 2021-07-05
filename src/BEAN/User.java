package BEAN;

public class User {
  private int usersid;
  private String username;
  private String password;
  private String fullname;
  private String adminid;
   public int getUsersid() {
	return usersid;
     }
   public void setUsersid(int usersid) {
	this.usersid = usersid;
    }
   public String getAdminid() {
	return adminid;
    }
   public void setAdminid(String adminid) {
	this.adminid = adminid;
    }
   public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

}
