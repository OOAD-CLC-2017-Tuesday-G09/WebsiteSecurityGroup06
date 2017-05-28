package model;

public class HistoryLogin {
	private int id;
	public HistoryLogin(int id, String username, int countlogin, String iplogin) {
		super();
		this.id = id;
		this.username = username;
		this.countlogin = countlogin;
		this.iplogin = iplogin;
	}
	public HistoryLogin()
	{
		
	}
	private String username;
	private int countlogin;
	private String iplogin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getCountlogin() {
		return countlogin;
	}
	public void setCountlogin(int countlogin) {
		this.countlogin = countlogin;
	}
	public String getIplogin() {
		return iplogin;
	}
	public void setIplogin(String iplogin) {
		this.iplogin = iplogin;
	}


}
